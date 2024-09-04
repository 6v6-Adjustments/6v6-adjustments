#!mainFile "../../dev_main.opy"


def initJuno():
    @Name "[juno/init.opy]: initJuno()"
    
    setCustomHp(ADJ_JUNO_HEALTH, 0, ADJ_JUNO_SHIELDS)
    setUltCost(ADJ_JUNO_ULT_COST)
    
    # if not eventPlayer.isDuplicatingAHero():
    #     removeSelfHealing()
    #     setBaseDamage(eventPlayer, ADJ_JUNO_MEDIGUN_DAMAGE/OW2_JUNO_MEDIGUN_DAMAGE)

    eventPlayer.hero_initialized = true


# rule "[juno/init.opy]: Reduce Orbital Ray healing":
#     @Event eachPlayer
#     @Hero juno
#     @Condition eventPlayer.isUsingUltimate()

#     eventPlayer.setHealingDealt(percent(ADJ_JUNO_RAY_HPS/OW2_JUNO_RAY_HPS))
#     waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
#     eventPlayer.setHealingDealt(percent(eventPlayer._base_healing_scalar))


# rule "[juno/init.opy]: Increase healing while using Orbital Ray":
#     @Event playerDealtHealing
#     @Hero juno
#     @Condition eventPlayer.isUsingUltimate()
#     @Condition eventAbility == Button.SECONDARY_FIRE or eventHealing <= 20 # checks for medigun healing or torpedo healing

#     heal(healee, null, ((eventHealing/eventPlayer._base_healing_scalar) - eventHealing)/eventPlayer._base_healing_scalar)


# rule "[juno/init.opy]: Correct Juno melee damage":
#     @Event playerDealtDamage
#     @Hero juno
#     @Condition eventAbility == Button.MELEE or eventDamage >= 95

#     heal(victim, null, eventDamage - (eventDamage/eventPlayer._base_damage_scalar))
