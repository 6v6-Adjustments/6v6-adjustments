#!mainFile "../../../main.opy"


rule "[junkerqueen/init.opy]: Initialize Junkerqueen":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.JUNKER_QUEEN)
    @Condition eventPlayer.call_init
    
    resetHero()
    # removeTankPassive()
    eventPlayer.call_init = false
