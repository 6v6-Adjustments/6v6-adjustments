#!mainFile "../../dev_main.opy"

playervar wholehog_pvar
#!defineMember _is_exiting_wholehog wholehog_pvar[0]
#!defineMember _hog_hp reset_pvar[1]
#!defineMember _hook_cooldown wholehog_pvar[2]
#!defineMember _breather_cooldown wholehog_pvar[3]
#!defineMember _scrap_ammo wholehog_pvar[4]

subroutine cancelWholehog


rule "[roadhog/wholehog.opy]: OW1 disable abilities during wholehog":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setMeleeEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setKnockbackDealt(100)


rule "[roadhog/wholehog.opy]: OW1 enable abilities when not in wholehog":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition not eventPlayer.isUsingUltimate()

    eventPlayer.setMeleeEnabled(true)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
    eventPlayer.setKnockbackDealt(35)


rule "[roadhog/wholehog.opy]: OW1 Wholehog force autofire":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isUsingUltimate()
    @Condition not eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
