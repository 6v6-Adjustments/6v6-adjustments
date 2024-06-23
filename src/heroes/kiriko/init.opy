#!mainFile "../../dev_main.opy"

#!include "heroes/kiriko/swift_step.opy"

playervar suzu_flying


rule "[kiriko/init.opy]: Initialize Kiriko":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.KIRIKO

    setCustomHp(ADJ_KIRIKO_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.setAmmo(1, ADJ_KIRIKO_KUNAI_COUNT)
    eventPlayer.setMaxAmmo(1, ADJ_KIRIKO_KUNAI_COUNT)
    eventPlayer.setMoveSpeed(percent(ADJ_KIRIKO_SPEED/OW2_KIRIKO_SPEED))

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN)
    eventPlayer.setAbility1Enabled(false)

    eventPlayer.call_init = false


rule "[kiriko/init.opy]: Track Protection Suzu healing":
    @Event playerDealtHealing
    @Hero kiriko
    @Condition eventAbility == Button.ABILITY_2
    
    eventPlayer.suzu_flying = false


rule "[kiriko/init.opy]: Allow self healing during Protection Suzu":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    
    damage(eventPlayer, null, MIN_DAMAGE)
    eventPlayer.suzu_flying = true
    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.suzu_flying, ADJ_THROWABLES_WAIT_TIME)
    wait(0.65)
    popSelfHealing(Button.ABILITY_2)
