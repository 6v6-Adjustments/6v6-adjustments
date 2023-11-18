#!mainFile "../../../main.opy"

#!include "ow1/heroes/mercy/guardian.opy"


rule "[mercy/init.opy]: Initialize Mercy":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.MERCY)
    @Condition eventPlayer.call_init
    
    resetHero()
    eventPlayer.setAmmo(0, OW1_MERCY_CLIP_SIZE)
    eventPlayer.setMaxAmmo(0, OW1_MERCY_CLIP_SIZE)

    eventPlayer.is_using_guardian_angel = false
    eventPlayer.is_slingshotting = false
    eventPlayer.call_init = false
