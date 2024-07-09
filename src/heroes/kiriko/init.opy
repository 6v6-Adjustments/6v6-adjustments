#!mainFile "../../dev_main.opy"

#!include "heroes/kiriko/swift_step.opy"

playervar suzu_flying


rule "[kiriko/init.opy]: Initialize Kiriko":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.KIRIKO

    setCustomHp(ADJ_KIRIKO_HEALTH, 0, 0)
    setUltCost(ADJ_KIRIKO_ULT_COST)
    removeSelfHealing()

    eventPlayer.setAmmo(1, ADJ_KIRIKO_KUNAI_COUNT)
    eventPlayer.setMaxAmmo(1, ADJ_KIRIKO_KUNAI_COUNT)

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN)

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

/*
rule "Heal when using Protection Suzu":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0
    
    eventPlayer.startHoT(eventPlayer, 0.65, 123)
*/

/*
rule "Unlock Swift Step while in LoS":
    @Event eachPlayer
    @Hero kiriko
    @Condition isInLoS(eventPlayer, eventPlayer.getPlayerClosestToReticle(eventPlayer.getTeam()), BarrierLos.PASS_THROUGH_BARRIERS) == true
    
    eventPlayer.setAbility1Enabled(true)
*/

/*
rule "Lock Swift Step while not in LoS":
    @Event eachPlayer
    @Hero kiriko
    @Condition isInLoS(eventPlayer, eventPlayer.getPlayerClosestToReticle(eventPlayer.getTeam()), BarrierLos.PASS_THROUGH_BARRIERS) == false
    
    eventPlayer.setAbility1Enabled(false)
*/
