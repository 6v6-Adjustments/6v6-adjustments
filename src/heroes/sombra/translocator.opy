# Idea by Questron
# Original code by cactuspuppy
# OverPy implementation by Unmellow#1512

#Global variables
globalvar STEALTH_REFUND_FRACTION
globalvar NEGATIVE_STATUS_PREVENTS_REFUND
globalvar MINIMUM_TRANSLOCATOR_COOLDOWN

#Player variables
playervar stealth_timer
playervar stealth_pvar
#!defineMember _stealth_max_cooldown stealth_pvar[0]
#!defineMember _ult_charge_percent_cache stealth_pvar[1]


rule "[sombra/translocator_cooldown_reset.opy]: Sombra stealth refund variables":
    STEALTH_REFUND_FRACTION = createWorkshopSetting(int[0:100], "Gameplay Settings", "Percent of Stealth Timer Remaining Refunded Towards Translocator Cooldown", 40, 0) / 100
    NEGATIVE_STATUS_PREVENTS_REFUND = createWorkshopSetting(bool, "Gameplay Settings", "Negative Status Effects Cancelling Stealth Prevents Translocator Cooldown Refund", true, 1)
    MINIMUM_TRANSLOCATOR_COOLDOWN = 4
    
    
rule "[sombra/translocator_cooldown_reset.opy]: When Translocator is used, begin tracking how long Sombra is in stealth":
    @Event eachPlayer
    @Condition (eventPlayer.getCurrentHero() == Hero.SOMBRA) == true
    @Condition eventPlayer.isUsingAbility2() == true
    
    eventPlayer.stealth_timer = 5.5
    waitUntil(eventPlayer.isUsingAbility2() == false, Math.INFINITY)
    chase(eventPlayer.stealth_timer, 0, rate=1, ChaseReeval.NONE)
    #Sombra can't break stealth during the cast time of stealth
    wait(0.5, Wait.RESTART_WHEN_TRUE)
    #Wait until Sombra exits Stealth
    waitUntil(any([eventPlayer.hasStatusEffect(Status.ASLEEP), eventPlayer.hasStatusEffect(Status.FROZEN), eventPlayer.hasStatusEffect(Status.HACKED), eventPlayer.hasStatusEffect(Status.KNOCKED_DOWN), eventPlayer.hasStatusEffect(Status.STUNNED), eventPlayer.hasStatusEffect(Status.ROOTED)]) or eventPlayer.isFiringPrimaryFire() or eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and not eventPlayer.isFiringSecondaryFire() or eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 and eventPlayer.isHoldingButton(Button.ABILITY_1) or eventPlayer.isHoldingButton(Button.MELEE) or eventPlayer.isMeleeing() or eventPlayer.isUsingUltimate() or eventPlayer._ult_charge_percent_cache == 100 and eventPlayer.isHoldingButton(Button.ULTIMATE), 5)
    stopChasingVariable(eventPlayer.stealth_timer)
    if eventPlayer.stealth_timer <= 0:
        return
    if NEGATIVE_STATUS_PREVENTS_REFUND:
        if any([eventPlayer.hasStatusEffect(Status.ASLEEP), eventPlayer.hasStatusEffect(Status.FROZEN), eventPlayer.hasStatusEffect(Status.HACKED), eventPlayer.hasStatusEffect(Status.KNOCKED_DOWN), eventPlayer.hasStatusEffect(Status.STUNNED), eventPlayer.hasStatusEffect(Status.ROOTED)]):
            return
    waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0, 1)
    # printLog("Current Translocator Cooldown: {0} | Target Translocator Cooldown: {1}".format(eventPlayer.getAbilityCooldown(Button.ABILITY_2), eventPlayer._stealth_max_cooldown - 5 + (eventPlayer.stealth_timer * (1 - STEALTH_REFUND_FRACTION))))
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, eventPlayer._stealth_max_cooldown - 5 + (eventPlayer.stealth_timer * (1 - STEALTH_REFUND_FRACTION)))
    
    
rule "[sombra/translocator_cooldown_reset.opy]: Set max stealth cooldown observed":
    @Event eachPlayer
    @Condition (eventPlayer.getCurrentHero() == Hero.SOMBRA) == true
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) > eventPlayer._stealth_max_cooldown
    
    eventPlayer._stealth_max_cooldown = round(eventPlayer.getAbilityCooldown(Button.ABILITY_2))
