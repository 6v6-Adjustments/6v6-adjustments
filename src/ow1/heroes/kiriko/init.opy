#!mainFile "../../../main.opy"


rule "[kiriko/init.opy]: Initialize Kiriko":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.KIRIKO)
    @Condition eventPlayer.call_init
    
    resetHero()
    # removeSelfHealing()
    eventPlayer.call_init = false


rule "[kiriko.opy]: Allow self healing during Suzu":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.KIRIKO)
    @Condition eventPlayer.isUsingAbility2()

    pushSelfHealing(Button.ABILITY_2)
    waitUntil(eventPlayer.isUsingAbility2() == false, Math.INFINITY)
    popSelfHealing(Button.ABILITY_2)