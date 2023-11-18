#!mainFile "../../../main.opy"

#!include "ow1/heroes/mei/blaster.opy"


rule "[mei/init.opy]: Initialize Mei":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.MEI)
    @Condition eventPlayer.call_init
    
    resetHero()
    eventPlayer.setAmmo(0, OW1_MEI_CLIP_SIZE)
    eventPlayer.setMaxAmmo(0, OW1_MEI_CLIP_SIZE)
    eventPlayer.call_init = false
