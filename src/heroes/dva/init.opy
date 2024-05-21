#!mainFile "../../dev_main.opy"

#!include "heroes/dva/hp.opy"


rule "[dva/init.opy]: Initialize D.Va":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA

    removeTankPassive()
    removeSelfHealing()

    eventPlayer.call_init = false


/*
rule "(Duplicate) d.va dm fix a":
    @Event eachPlayer
    @Condition eventPlayer.getHeroOfDuplication() == Hero.DVA
    @Condition eventPlayer.isFiringSecondaryFire() == true
    @Condition eventPlayer.getAbilityResource(Button.SECONDARY_FIRE) > 66
    
    eventPlayer.setAbilityResource(Button.SECONDARY_FIRE, 66)
*/

/*
rule "(Duplicate) d.va dm fix b":
    @Event eachPlayer
    @Condition eventPlayer.getHeroOfDuplication() == Hero.DVA
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition eventPlayer.getAbilityResource(Button.SECONDARY_FIRE) > 66
    
    eventPlayer.setAbilityResource(Button.SECONDARY_FIRE, 100)
*/
