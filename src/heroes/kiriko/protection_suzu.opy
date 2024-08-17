#!mainFile "../../dev_main.opy"

playervar suzu_flying


rule "[kiriko/protection_suzu.opy]: Track Protection Suzu healing":
    @Event playerDealtHealing
    @Hero kiriko
    @Condition eventAbility == Button.ABILITY_2
    
    eventPlayer.suzu_flying = false


rule "[kiriko/protection_suzu.opy]: Allow self healing during Protection Suzu":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    
    damage(eventPlayer, null, MIN_DAMAGE)
    eventPlayer.suzu_flying = true
    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.suzu_flying, ADJ_THROWABLES_WAIT_TIME)
    wait(OW2_KIRIKO_SUZU_DURATION)
    popSelfHealing(Button.ABILITY_2)
