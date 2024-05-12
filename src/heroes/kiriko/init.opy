#!mainFile "../../dev_main.opy"


rule "[kiriko/init.opy]: Kiriko":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.KIRIKO

    setCustomHp(ADJ_KIRIKO_HEALTH, 0, 0)
    removeRegenPassive()

    eventPlayer.setAmmo(1, 12)
    eventPlayer.setMaxAmmo(1, 12)

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 5)

    eventPlayer.call_init = false


rule "[kiriko/init.opy]: Heal when using Swift Step":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.KIRIKO
    @Condition eventPlayer.isUsingAbility1() == true
    
    eventPlayer.startHoT(eventPlayer, 0.25, 160)


/*
rule "Heal when using Protection Suzu":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.KIRIKO
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0
    
    eventPlayer.startHoT(eventPlayer, 0.65, 123)
*/

/*
rule "Unlock Swift Step while in LoS":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.KIRIKO
    @Condition isInLoS(eventPlayer, eventPlayer.getPlayerClosestToReticle(eventPlayer.getTeam()), BarrierLos.PASS_THROUGH_BARRIERS) == true
    
    eventPlayer.setAbility1Enabled(true)
*/

/*
rule "Lock Swift Step while not in LoS":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.KIRIKO
    @Condition isInLoS(eventPlayer, eventPlayer.getPlayerClosestToReticle(eventPlayer.getTeam()), BarrierLos.PASS_THROUGH_BARRIERS) == false
    
    eventPlayer.setAbility1Enabled(false)
*/
