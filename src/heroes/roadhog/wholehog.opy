#!mainFile "../../dev_main.opy"

playervar wholehog_pvar
#!defineMember _is_exiting_wholehog wholehog_pvar[0]
#!defineMember _hog_hp wholehog_pvar[1]
#!defineMember _hook_cooldown wholehog_pvar[2]
#!defineMember _breather_cooldown wholehog_pvar[3]
#!defineMember _scrap_ammo wholehog_pvar[4]

subroutine cancelWholehog


rule "[roadhog/wholehog.opy]: OW1 disable abilities during wholehog":
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
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isUsingUltimate()
    @Condition not eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)


rule "[roadhog/wholehog.opy]: Reduce ultimate duration":
    @Event eachPlayer
    @Hero roadhog
    @Condition eventPlayer.isUsingUltimate()
    
    wait(ADJ_ROADHOG_ULTIMATE_DURATION, Wait.ABORT_WHEN_FALSE)
    cancelWholehog()


# Switch to Zarya temporarily to remove wholehog
def cancelWholehog():
    @Name "[roadhog/wholehog.opy]: cancelWholehog()"

    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    
    # Save hog state
    eventPlayer._hog_hp = eventPlayer.getHealth()
    eventPlayer._hook_cooldown = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
    eventPlayer._breather_cooldown = eventPlayer.getAbilityCooldown(Button.ABILITY_2)

    eventPlayer._is_exiting_wholehog = true
    eventPlayer.startForcingHero(Hero.ZARYA)


# Switch back to roadhog after entering zarya
rule "[roadhog/wholehog.opy]: Go back to roadhog":
    @Event eachPlayer
    @Condition eventPlayer._is_exiting_wholehog

    eventPlayer.startForcingHero(Hero.ROADHOG)
    eventPlayer.stopForcingCurrentHero()

    # Restore hog state
    setCustomHp(eventPlayer._hp_health, eventPlayer._hp_armor, eventPlayer._hp_shields)
    eventPlayer.setHealth(eventPlayer._hog_hp)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, eventPlayer._hook_cooldown)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, eventPlayer._breather_cooldown)

    eventPlayer.setAmmo(0, 5)
    eventPlayer.setMaxAmmo(0, 5) # Without this, hog gets his ow2 clip size back

    eventPlayer._is_exiting_wholehog = false