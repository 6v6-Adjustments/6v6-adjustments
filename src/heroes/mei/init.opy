#!mainFile "../../../main.opy"

#!include "heroes/mei/blaster.opy"


rule "[mei/init.opy]: Initialize Mei":
    @Event eachPlayer
    @Hero mei
    @Condition eventPlayer.call_init
    
    defaultHero()
    eventPlayer.setAmmo(0, OW1_MEI_CLIP_SIZE)
    eventPlayer.setMaxAmmo(0, OW1_MEI_CLIP_SIZE)
    eventPlayer.call_init = false