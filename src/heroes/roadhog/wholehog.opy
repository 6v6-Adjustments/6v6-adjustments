#!mainFile "../../dev_main.opy"


rule "[roadhog/wholehog.opy]: Disable abilities during wholehog":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setMeleeEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setKnockbackDealt(100)


rule "[roadhog/wholehog.opy]: Enable abilities after wholehog":
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


rule "[roadhog/wholehog.opy]: Force autofire while in wholehog":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isUsingUltimate()
    @Condition not eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
