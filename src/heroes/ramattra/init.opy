#!mainFile "../../dev_main.opy"

playervar ramattra_block_cooldown
playervar ramattra_block_cd_text

subroutine showRamattraBlockCD
subroutine hideRamattraBlockCD


rule "[ramattra/init.opy]: Ramattra":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    
    setCustomHp(ADJ_RAMATTRA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_RAMATTRA_HEALTH, 0, 0)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.startScalingSize(0.94, true)
    eventPlayer.setJumpVerticalSpeed(101)

    eventPlayer.call_init = false


rule "[ramattra/init.opy]: Correct Nemesis Form armor, movement speed, and cooldown for duplicate":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    
    eventPlayer.setMoveSpeed(83.4)
    eventPlayer.addHealthPool(Health.ARMOR, 28, true, true)
    waitUntil(eventPlayer.getMaxHealthOfType(Health.ARMOR) < 29, 99999)
    eventPlayer.setMoveSpeed(100)
    if not RULE_CONDITION:
        return
    removeHealthPool(getLastCreatedHealthPool())
    #if eventPlayer.getHeroOfDuplication() == Hero.RAMATTRA:
    #waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_1) != 0, 99999)
    #eventPlayer.setAbilityCooldown(Button.ABILITY_1, 9)


rule "[ramattra/init.opy]: Increase Pummel damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    @Condition eventDamage >= 50
    @Condition eventAbility != Button.MELEE
    
    damage(victim, attacker, eventDamage * 1.169 - eventDamage)


# rule "[ramattra/init.opy]: Set Ramattra Block Cooldown when not in Nemesis":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.RAMATTRA
#     @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
#     @Condition eventPlayer.isFiringSecondaryFire() == true
#     @Condition eventPlayer.isUsingUltimate() == false

#     waitUntil(not eventPlayer.isFiringSecondaryFire(), 99999999)
#     eventPlayer.ramattra_block_cooldown = 3
#     eventPlayer.setSecondaryFireEnabled(false)
#     eventPlayer.disallowButton(Button.SECONDARY_FIRE)
#     chase(eventPlayer.ramattra_block_cooldown, 0, rate=1, ChaseReeval.NONE)


# rule "[ramattra/init.opy]: Show Ramattra Block Cooldown":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.RAMATTRA
#     @Condition eventPlayer.ramattra_block_cooldown > 0

#     showRamattraBlockCD()


# rule "[ramattra/init.opy]: Hide Ramattra Block Cooldown":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.RAMATTRA
#     @Condition eventPlayer.ramattra_block_cooldown <= 0

#     hideRamattraBlockCD()
#     eventPlayer.setSecondaryFireEnabled(true)
#     eventPlayer.allowButton(Button.SECONDARY_FIRE)


# rule "[ramattra/init.opy]: Enable Shield when out of Nemesis":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.RAMATTRA
#     @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == false or eventPlayer.isUsingUltimate()

#     wait(0.1)
#     eventPlayer.ramattra_block_cooldown = 0
#     hideRamattraBlockCD()


# def initRamattraBlock():
#     @Name "[ramattra/init.opy]: initRamattraBlock()"
    
#     eventPlayer.ramattra_block_cooldown = 0


# def showRamattraBlockCD():
#     @Name "[ramattra/init.opy]: showRamattraBlockCD()"
    
#     createInWorldText(eventPlayer, "{0}".format(ceil(eventPlayer.ramattra_block_cooldown)), updateEveryTick(eventPlayer.getEyePosition() + (100 * (2.5 * worldVector(Vector.RIGHT, eventPlayer, Transform.ROTATION) + (-1.66 * (angleToDirection(horizontalAngleOfDirection(eventPlayer.getFacingDirection()), verticalAngleOfDirection(eventPlayer.getFacingDirection()) - 90))) + 3 * eventPlayer.getFacingDirection()))), 3, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR, Color.WHITE, SpecVisibility.DEFAULT)
#     eventPlayer.ramattra_block_cd_text = getLastCreatedText()


# def hideRamattraBlockCD():
#     @Name "[ramattra/init.opy]: hideRamattraBlockCD()"
    
#     destroyInWorldText(eventPlayer.ramattra_block_cd_text)
#     eventPlayer.ramattra_block_cooldown = 0


# rule "[ramattra/init.opy]: Clean up Ramattra":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup != Hero.RAMATTRA
    
#     hideRamattraBlockCD()


# rule "[ramattra/init.opy]: Disable Block after use":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.RAMATTRA
#     @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
#     @Condition eventPlayer.isFiringSecondaryFire() == true
#     @Condition eventPlayer.isUsingUltimate() == false
    
#     waitUntil(not eventPlayer.isFiringSecondaryFire(), 999999986991104)
#     eventPlayer.disallowButton(Button.SECONDARY_FIRE)
#     eventPlayer.setSecondaryFireEnabled(false)
#     waitUntil(eventPlayer.getMaxHealthOfType(Health.ARMOR) < 29, 99999)
#     wait(0.25)
#     eventPlayer.allowButton(Button.SECONDARY_FIRE)
#     eventPlayer.setSecondaryFireEnabled(true)


rule "[ramattra/init.opy]: Set Ravenous Vortex cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.isUsingAbility2() == true
    
    waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_2) != 0, 99999)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 12)


rule "[ramattra/init.opy]: Bonus Annihilation movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.isUsingUltimate() == true
    
    wait()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)


/*
rule "Reset Nemesis bonus armor when going into Annihilation":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    
    removeHealthPool(getLastCreatedHealthPool())
    eventPlayer.addHealthPool(Health.ARMOR, 15, true, true)
*/