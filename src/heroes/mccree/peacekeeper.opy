#!mainFile "../../dev_main.opy"

playervar cassidy_shot_distance
playervar cassidy_damage_base
playervar ow2_cassidy_damage_falloff_scalar
playervar adj_cassidy_damage_falloff_scalar
playervar expected_cassidy_damage


# Damage falloff derived from Marblr's "How Damage Falloff is Calculated" video: https://youtu.be/VL2VnkNJPpE
#!define ADJCASSIDYN(d) ((d - ADJ_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)/(ADJ_CASSIDY_DAMAGE_FALLOFF_END_DISTANCE - ADJ_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE))
#!define OW2CASSIDYN(d) ((d - OW2_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)/(OW2_CASSIDY_DAMAGE_FALLOFF_END_DISTANCE - OW2_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE))
#!define ADJCassidyFalloff(d) ((ADJCASSIDYN(d)) * ADJ_CASSIDY_DAMAGE_FALLOFF_SCALAR + (1 - ADJCASSIDYN(d)))
#!define OW2CassidyFalloff(d) ((OW2CASSIDYN(d)) * OW2_CASSIDY_DAMAGE_FALLOFF_SCALAR + (1 - OW2CASSIDYN(d)))


rule "[mccree/peacekeeper.opy]: Increase Peacekeeper damage range":
    @Event playerDealtDamage
    @Hero cassidy
    @Condition eventAbility == Button.PRIMARY_FIRE
    
    eventPlayer.cassidy_shot_distance = distance(attacker.getEyePosition(), victim)
    eventPlayer.ow2_cassidy_damage_falloff_scalar = OW2CassidyFalloff(eventPlayer.cassidy_shot_distance)
    # Cap min/max scalar
    if eventPlayer.ow2_cassidy_damage_falloff_scalar > 1: # Max damage scalar
        eventPlayer.ow2_cassidy_damage_falloff_scalar = 1
    elif eventPlayer.ow2_cassidy_damage_falloff_scalar < OW2_CASSIDY_DAMAGE_FALLOFF_SCALAR: # Min damage scalar
        eventPlayer.ow2_cassidy_damage_falloff_scalar = OW2_CASSIDY_DAMAGE_FALLOFF_SCALAR

    eventPlayer.cassidy_damage_base = eventDamage/eventPlayer.ow2_cassidy_damage_falloff_scalar
    
    eventPlayer.adj_cassidy_damage_falloff_scalar = ADJCassidyFalloff(eventPlayer.cassidy_shot_distance)
    # Cap min/max scalar
    if eventPlayer.adj_cassidy_damage_falloff_scalar > 1: # Max damage scalar
        eventPlayer.adj_cassidy_damage_falloff_scalar = 1
    elif eventPlayer.adj_cassidy_damage_falloff_scalar < ADJ_CASSIDY_DAMAGE_FALLOFF_SCALAR: # Min damage scalar
        eventPlayer.adj_cassidy_damage_falloff_scalar = ADJ_CASSIDY_DAMAGE_FALLOFF_SCALAR

    eventPlayer.expected_cassidy_damage = eventPlayer.cassidy_damage_base * eventPlayer.adj_cassidy_damage_falloff_scalar
    damage(victim, attacker, eventPlayer.expected_cassidy_damage - eventDamage)
