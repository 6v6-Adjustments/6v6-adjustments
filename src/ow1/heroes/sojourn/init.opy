#!mainFile "../../../main.opy"


rule "[sojourn/init.opy]: Initialize Sojourn":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.SOJOURN)
    @Condition eventPlayer.call_init

    resetHero()
    eventPlayer.call_init = false
