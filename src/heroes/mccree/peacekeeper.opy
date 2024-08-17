#!mainFile "../../dev_main.opy"

# Damage falloff derived from Marblr's "How Damage Falloff is Calculated" video: https://youtu.be/VL2VnkNJPpE

playervar peacekeeper_distance
playervar adj_cassidy_n
playervar ow2_cassidy_n
playervar adj_cassidy_falloff
playervar ow2_cassidy_falloff


rule "[mccree/peacekeeper.opy]: Increase Peacekeeper falloff damage range":
    @Event playerDealtDamage
    @Hero cassidy
    @Condition eventAbility == Button.PRIMARY_FIRE

    # true falloff distance in OW is distance from attacker eye to the hit coordinate on the hitbox
    # since workshop doesn't provide exact hit coordinate, assume hit coordianate is the center mass of victim
    # then subtract some magic value as compensation for the inaccuracy
    eventPlayer.peacekeeper_distance = distance(attacker.getEyePosition(), centerMass(victim)) - 0.25
    eventPlayer.adj_cassidy_n = (eventPlayer.peacekeeper_distance - ADJ_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)/(ADJ_CASSIDY_DAMAGE_FALLOFF_END_DISTANCE - ADJ_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)
    eventPlayer.ow2_cassidy_n = (eventPlayer.peacekeeper_distance - OW2_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)/(OW2_CASSIDY_DAMAGE_FALLOFF_END_DISTANCE - OW2_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)
    eventPlayer.adj_cassidy_falloff = clamp(eventPlayer.adj_cassidy_n * ADJ_CASSIDY_DAMAGE_FALLOFF_SCALAR + (1 - eventPlayer.adj_cassidy_n), ADJ_CASSIDY_DAMAGE_FALLOFF_SCALAR, 1)
    eventPlayer.ow2_cassidy_falloff = clamp(eventPlayer.ow2_cassidy_n * OW2_CASSIDY_DAMAGE_FALLOFF_SCALAR + (1 - eventPlayer.ow2_cassidy_n), OW2_CASSIDY_DAMAGE_FALLOFF_SCALAR, 1)

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(eventPlayer.adj_cassidy_falloff/eventPlayer.ow2_cassidy_falloff) - eventDamage)/eventPlayer._base_damage_scalar)
