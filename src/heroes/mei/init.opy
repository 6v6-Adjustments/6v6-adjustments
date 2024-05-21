#!mainFile "../../dev_main.opy"

#!include "heroes/mei/cryo_freeze.opy"


rule "[mei/init.opy]: Mei":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MEI

    setCustomHp(ADJ_MEI_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.setMaxAmmo(0, 120)
    eventPlayer.setAmmo(0, 120)

    eventPlayer.call_init = false
