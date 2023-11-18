#!mainFile "../../../main.opy"


rule "[zenyatta/transc.opy]: Allow self healing during Transcendence":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ZENYATTA)
    @Condition eventPlayer.isUsingUltimate()

    pushSelfHealing(Button.ULTIMATE)
    waitUntil(eventPlayer.isUsingUltimate() == false, Math.INFINITY)
    popSelfHealing(Button.ULTIMATE)