#!mainFile "../../../main.opy"

#!include "ow1/heroes/dva/hp.opy"
#!include "ow1/heroes/dva/gun.opy"
#!include "ow1/heroes/dva/booster.opy"
#!include "ow1/heroes/dva/missile.opy"
#!include "ow1/heroes/dva/bomb.opy"


rule "[dva/init.opy]: Initialize DVa":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.DVA)
    @Condition eventPlayer.call_init
    
    resetHero()
    removeTankPassive()

    setCustomHealth(OW1_DVA_HEALTH, OW1_DVA_ARMOR, 0)

    eventPlayer.call_init = false
