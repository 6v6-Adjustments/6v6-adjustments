#!mainFile "../../dev_main.opy"


macro initAllyBubble():
    eventPlayer.disallowButton(Button.ABILITY_2)


rule "[zarya/barrier.opy]: Custom Zarya ally barrier health":
    @Event eachPlayer
    @Hero zarya
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2)
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) <= 0

    eventPlayer.setMaxHealth(percent(ADJ_ZARYA_BARRIER_HEALTH/OW2_ZARYA_BARRIER_HEALTH))
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ABILITY_2)
    waitUntil(eventPlayer.isUsingAbility2(), TICK_DURATION)
    eventPlayer.setMaxHealth(percent(eventPlayer._hp_scalar))
