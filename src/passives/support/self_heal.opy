#!mainFile "../../dev_main.opy"

globalvar enable_regeneration = createWorkshopSetting(bool, 'Passive', 'Global - Regeneration', false, 0)
globalvar enable_support_passive = createWorkshopSetting(bool, 'Passive', 'Support - Quicker Regeneration', false, 0)

playervar self_heal_pvar
#!defineMember _self_healing_source self_heal_pvar[0]
#!defineMember _self_healing_percent self_heal_pvar[1]
#!defineMember _self_healing_id self_heal_pvar[2]
#!defineMember _regen_passive_active self_heal_pvar[3]
#!defineMember _last_time_damage_taken self_heal_pvar[4]
#!defineMember _suppress_regen_passive self_heal_pvar[5]
#!defineMember _support_passive_active self_heal_pvar[6]

#!define resetSelfHealing()\
    stopHealingModification(eventPlayer._self_healing_id)\
    eventPlayer._self_healing_id = null\
    eventPlayer._self_healing_source = []\
    eventPlayer._self_healing_percent = 0\
    eventPlayer._regen_passive_active = true\
    eventPlayer._suppress_regen_passive = false\
    eventPlayer._support_passive_active = true\

#!define removeRegenPassive()\
    eventPlayer._suppress_regen_passive = true

def removeSelfHealing():
    @Name "[passives/support/self_heal.opy]: removeSelfHealing()"
    if enable_regeneration: return

    eventPlayer._self_healing_source = []
    eventPlayer._self_healing_percent = 0
    if eventPlayer._self_healing_id == null:
        startHealingModification(eventPlayer, eventPlayer, eventPlayer._self_healing_percent, HealingReeval.RECEIVERS_HEALERS_AND_HEALPERCENT)
        eventPlayer._self_healing_id = getLastHealingModification()

#!define evalSelfHealingPercent()\
    eventPlayer._self_healing_percent = 100 if len(eventPlayer._self_healing_source) > 0 else 0\
    eventPlayer._suppress_regen_passive = true if eventPlayer._self_healing_percent > 0 else false

#!define pushSelfHealing(button) \
    if (button not in eventPlayer._self_healing_source): \
        eventPlayer._self_healing_source.append(button) \
evalSelfHealingPercent()

#!define popSelfHealing(button) \
    eventPlayer._self_healing_source.remove(button) \
    evalSelfHealingPercent()


rule "[passives/support/self_heal.opy]: Detect healing passive":
    @Event playerTookDamage

    eventPlayer._regen_passive_active = false
    eventPlayer._support_passive_active = false
    wait(OW2_SUPPORT_HEAL_PASSIVE_ACTIVATION_TIME - TICK_DURATION)
    eventPlayer._support_passive_active = true
    wait(OW2_HEAL_PASSIVE_ACTIVATION_TIME - OW2_SUPPORT_HEAL_PASSIVE_ACTIVATION_TIME - TICK_DURATION)
    eventPlayer._regen_passive_active = true


# Deal damage to suppress regen passive except when regenerating shield hp
rule "[passives/support/self_heal.opy]: Remove Passive self healing":
    @Event eachPlayer
    @Condition not enable_regeneration
    @Condition eventPlayer._suppress_regen_passive
    @Condition eventPlayer._regen_passive_active or eventPlayer._support_passive_active
    @Condition eventPlayer.getHealthOfType(Health.SHIELDS) >= eventPlayer.getMaxHealthOfType(Health.SHIELDS)
    @Condition eventPlayer.getHealth() < eventPlayer.getMaxHealth()
    @Condition not eventPlayer.hasStatusEffect(Status.ASLEEP)
    
    do:
        damage(eventPlayer, null, MIN_DAMAGE)
        wait(OW2_SUPPORT_HEAL_PASSIVE_ACTIVATION_TIME - TICK_DURATION \
            if eventPlayer.getCurrentHero() in getSupportHeroes() \
            else OW2_HEAL_PASSIVE_ACTIVATION_TIME - TICK_DURATION, Wait.ABORT_WHEN_FALSE)
    while RULE_CONDITION


# Deal damage to suppress passive except when regenerating shield hp
rule "[passives/support/self_heal.opy]: Remove Support Passive":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() in getSupportHeroes()
    @Condition enable_regeneration
    @Condition not enable_support_passive
    @Condition eventPlayer._support_passive_active
    @Condition not eventPlayer._regen_passive_active
    @Condition eventPlayer.getHealthOfType(Health.SHIELDS) >= eventPlayer.getMaxHealthOfType(Health.SHIELDS)
    @Condition eventPlayer.getHealth() < eventPlayer.getMaxHealth()
    @Condition not eventPlayer.hasStatusEffect(Status.ASLEEP)
    
    do:
        damage(eventPlayer, null, MIN_DAMAGE)
        wait(OW2_SUPPORT_HEAL_PASSIVE_ACTIVATION_TIME - TICK_DURATION, Wait.ABORT_WHEN_FALSE)
    while RULE_CONDITION
