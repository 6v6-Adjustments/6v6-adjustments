#!mainFile "../../dev_main.opy"


# Damage falloff derived from Marblr's "How Damage Falloff is Calculated" video: https://youtu.be/VL2VnkNJPpE
#!define ADJCASSIDYN(distance) ((distance - ADJ_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)/(ADJ_CASSIDY_DAMAGE_FALLOFF_END_DISTANCE - ADJ_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE))
#!define OW2CASSIDYN(distance) ((distance - OW2_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)/(OW2_CASSIDY_DAMAGE_FALLOFF_END_DISTANCE - OW2_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE))
#!define ADJCassidyFalloff(distance) clamp((ADJCASSIDYN(distance)) * ADJ_CASSIDY_DAMAGE_FALLOFF_SCALAR + (1 - ADJCASSIDYN(distance)), ADJ_CASSIDY_DAMAGE_FALLOFF_SCALAR, 1)
#!define OW2CassidyFalloff(distance) clamp((OW2CASSIDYN(distance)) * OW2_CASSIDY_DAMAGE_FALLOFF_SCALAR + (1 - OW2CASSIDYN(distance)), OW2_CASSIDY_DAMAGE_FALLOFF_SCALAR, 1)
#!define expectedCassidyDamage(distance) (eventDamage/eventPlayer._base_damage_scalar)*(ADJCassidyFalloff(distance)/OW2CassidyFalloff(distance))

playervar peacekeeper_distance

rule "[mccree/peacekeeper.opy]: Increase Peacekeeper falloff damage range":
    @Event playerDealtDamage
    @Hero cassidy
    @Condition eventAbility == Button.PRIMARY_FIRE

    # true falloff distance in OW is distance from attacker eye to the hit coordinate on the hitbox
    # since workshop doesn't provide exact hit coordinate, assume hit coordianate is the center mass of victim
    # then subtract some magic value as compensation for the inaccuracy
    eventPlayer.peacekeeper_distance = distance(attacker.getEyePosition(), centerMass(victim)) - 0.25
    damage(victim, attacker, (expectedCassidyDamage(eventPlayer.peacekeeper_distance) - eventDamage)/eventPlayer._base_damage_scalar)
