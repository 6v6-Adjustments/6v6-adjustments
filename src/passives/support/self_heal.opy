#!mainFile "../../dev_main.opy"

globalvar enable_regeneration = createWorkshopSetting(bool, 'Passive', 'Global - Regeneration', true, 0)
globalvar ADJ_REGEN_HPS = createWorkshopSetting(int[1:100], 'Passive', 'Global - Regeneration Healing per Second', 10)
globalvar ADJ_REGEN_TIMER = createWorkshopSetting(int[1:30], 'Passive', 'Global - Regeneration Activation Time', 5)
globalvar enable_support_passive = createWorkshopSetting(bool, 'Passive', 'Support - Quicker Regeneration', false, 0)

playervar self_heal_pvar
#!defineMember _self_healing_source self_heal_pvar[0]
#!defineMember _self_healing_percent self_heal_pvar[1]
#!defineMember _self_healing_id self_heal_pvar[2]
#!defineMember _regen_passive_active self_heal_pvar[3]
#!defineMember _last_time_damage_taken self_heal_pvar[4]
#!defineMember _suppress_regen_passive self_heal_pvar[5]
#!defineMember _support_passive_active self_heal_pvar[6]
#!defineMember _regen_passive_id self_heal_pvar[7]
#!defineMember _passive_regen_delay self_heal_pvar[8]
#!defineMember _passive_regen_hps self_heal_pvar[9]
#!defineMember _current_regen_hps self_heal_pvar[10]
#!defineMember _new_regen_hps self_heal_pvar[11]

subroutine applyRegeneration
subroutine startPassiveRegeneration

#!include "constants/adj_constants.opy"
#!include "constants/ow2_constants.opy"


def resetSelfHealing():
    @Name "[passives/support/self_heal.opy]: resetSelfHealing()"

    stopHealingModification(eventPlayer._self_healing_id)
    eventPlayer._self_healing_id = null
    eventPlayer._self_healing_source = []
    eventPlayer._self_healing_percent = 0
    eventPlayer._regen_passive_active = true
    eventPlayer._suppress_regen_passive = false
    eventPlayer._support_passive_active = true


#!define removeRegenPassive()\
    eventPlayer._suppress_regen_passive = true


def removeSelfHealing():
    @Name "[passives/support/self_heal.opy]: removeSelfHealing()"

    eventPlayer._self_healing_source = []
    eventPlayer._self_healing_percent = 0
    if eventPlayer._self_healing_id == null:
        startHealingModification(eventPlayer, eventPlayer, eventPlayer._self_healing_percent, HealingReeval.RECEIVERS_HEALERS_AND_HEALPERCENT)
        eventPlayer._self_healing_id = getLastHealingModification()


#!define evalSelfHealingPercent()\
    eventPlayer._self_healing_percent = 100 if len(eventPlayer._self_healing_source) > 0 else 0\
    eventPlayer._suppress_regen_passive = true if eventPlayer._self_healing_percent > 0 else false


#!define pushSelfHealing(button) \
    if (button not in eventPlayer._self_healing_source): eventPlayer._self_healing_source.append(button) \
    evalSelfHealingPercent()


#!define popSelfHealing(button) \
    eventPlayer._self_healing_source.remove(button) \
    evalSelfHealingPercent()


#!define setRegeneration(hps) \
    eventPlayer._new_regen_hps = hps \
    applyRegeneration()


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


rule "[passives/support/self_heal.opy]: Recreate regeneration passive":
    @Event playerTookDamage
    @Condition enable_regeneration or (eventPlayer.getCurrentHero() == Hero.MERCY)

    async(startPassiveRegeneration, AsyncBehavior.RESTART)


def startPassiveRegeneration():
    @Name "[passives/support/self_heal.opy]: startPassiveRegeneration()"

    # logic for calculating regen parameters
    if eventPlayer.getCurrentHero() == Hero.MERCY: # mercy passive
        eventPlayer._passive_regen_delay = ADJ_MERCY_PASSIVE_TIMER if not eventPlayer.isUsingUltimate() else 0
        eventPlayer._passive_regen_hps = ADJ_MERCY_REGEN_HPS
    elif enable_support_passive and (eventPlayer.getCurrentHero() in getSupportHeroes()): # support passive
        eventPlayer._passive_regen_delay = ADJ_REGEN_TIMER/2
        eventPlayer._passive_regen_hps = ADJ_REGEN_HPS
    else: # everyone else
        eventPlayer._passive_regen_delay = ADJ_REGEN_TIMER
        eventPlayer._passive_regen_hps = ADJ_REGEN_HPS
    
    if eventPlayer._passive_regen_delay > 0: setRegeneration(0)
    wait(eventPlayer._passive_regen_delay, Wait.RESTART_WHEN_TRUE)
    eventPlayer._passive_regen_delay = 0
    
    if eventPlayer.getHealth() < eventPlayer.getMaxHealth():
        setRegeneration(eventPlayer._passive_regen_hps)

    waitUntil(eventPlayer.getHealth() >= eventPlayer.getMaxHealth(), Math.INFINITY)
    setRegeneration(0)


def applyRegeneration():
    @Name "[passives/support/self_heal.opy]: applyRegeneration()"

    # do nothing if regen_hps didn't change
    if eventPlayer._new_regen_hps == eventPlayer._current_regen_hps: return

    # kill regen passive
    if eventPlayer._new_regen_hps == 0:
        stopHoT(eventPlayer._regen_passive_id)
        eventPlayer._regen_passive_id = null
        eventPlayer._current_regen_hps = 0
    # update regen passive
    else:
        stopHoT(eventPlayer._regen_passive_id)
        eventPlayer._regen_passive_id = null
        eventPlayer.startHoT(null, Math.INFINITY, eventPlayer._new_regen_hps)
        eventPlayer._regen_passive_id = getLastHoT()
        eventPlayer._current_regen_hps = eventPlayer._new_regen_hps
