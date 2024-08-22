#!mainFile "../../dev_main.opy"


def initJuno():
    @Name "[juno/init.opy]: initJuno()"
    
    setCustomHp(ADJ_JUNO_HEALTH, 0, ADJ_JUNO_SHIELDS)
    setUltCost(ADJ_JUNO_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    eventPlayer.hero_initialized = true


rule "[juno/init.opy]: Correct Pulsar Torpedo damage":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition eventDamage <= 40 # melee damage threshold

    damage(victim, attacker, eventDamage * (ADJ_JUNO_MEDIGUN_DAMAGE/OW2_JUNO_MEDIGUN_DAMAGE) - eventDamage)


# rule "[juno/init.opy]: Correct Juno melee damage":
#     @Event playerDealtDamage
#     @Hero juno
#     @Condition eventAbility == Button.MELEE

#     damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
