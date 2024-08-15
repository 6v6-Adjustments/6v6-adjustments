#!mainFile "../../dev_main.opy"


# Damage falloff derived from Marblr's "How Damage Falloff is Calculated" video: https://youtu.be/VL2VnkNJPpE
#!define ADJCASSIDYN(distance) ((distance - ADJ_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)/(ADJ_CASSIDY_DAMAGE_FALLOFF_END_DISTANCE - ADJ_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE))
#!define OW2CASSIDYN(distance) ((distance - OW2_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE)/(OW2_CASSIDY_DAMAGE_FALLOFF_END_DISTANCE - OW2_CASSIDY_DAMAGE_FALLOFF_START_DISTANCE))
#!define ADJCassidyFalloff(distance) clamp((ADJCASSIDYN(distance)) * ADJ_CASSIDY_DAMAGE_FALLOFF_SCALAR + (1 - ADJCASSIDYN(distance)), 0, 1)
#!define OW2CassidyFalloff(distance) clamp((OW2CASSIDYN(distance)) * OW2_CASSIDY_DAMAGE_FALLOFF_SCALAR + (1 - OW2CASSIDYN(distance)), 0, 1)
#!define expectedCassidyDamage(distance) (eventDamage/eventPlayer._base_damage_scalar)*(ADJCassidyFalloff(distance)/OW2CassidyFalloff(distance))


rule "[mccree/peacekeeper.opy]: Increase Peacekeeper damage range":
    @Event playerDealtDamage
    @Hero cassidy
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, (expectedCassidyDamage(distance(attacker.getEyePosition(), victim)) - eventDamage)/eventPlayer._base_damage_scalar)
