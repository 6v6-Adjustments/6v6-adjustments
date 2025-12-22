#!mainFile "../../dev_main.opy"


macro initSelfBubble():
    eventPlayer.disallowButton(Button.ABILITY_1)


rule "[zarya/barrier.opy]: Custom Zarya self barrier health":
    @Event eachPlayer
    @Hero zarya
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1)
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_1) <= 0

    eventPlayer.setMaxHealth(percent(ADJ_ZARYA_BARRIER_HEALTH/OW2_ZARYA_BARRIER_HEALTH))
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_1)
    waitUntil(eventPlayer.isUsingAbility1(), TICK_DURATION)
    eventPlayer.setMaxHealth(percent(eventPlayer._hp_scalar))
