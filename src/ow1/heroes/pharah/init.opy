#!mainFile "../../../main.opy"


rule "[pharah/init.opy]: Initialize Pharah":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.PHARAH)
    @Condition eventPlayer.call_init

    resetHero()

    eventPlayer.call_init = false
