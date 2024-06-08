#!mainFile "../../dev_main.opy"

playervar ramattra_block_cooldown
playervar ramattra_block_cd_text

subroutine showRamattraBlockCD
subroutine hideRamattraBlockCD


rule "[ramattra/init.opy]: Ramattra":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    
    setCustomHp(ADJ_RAMATTRA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_RAMATTRA_HEALTH, 0, 0)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.startScalingSize(0.94, true)

    eventPlayer.call_init = false


rule "[ramattra/init.opy]: Correct Nemesis Form armor and movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    
    eventPlayer.setMoveSpeed(83.4)
    eventPlayer.addHealthPool(Health.ARMOR, 53.75, true, true)
    waitUntil(eventPlayer.getMaxHealthOfType(Health.ARMOR) < 54.75, Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
    removeHealthPool(getLastCreatedHealthPool())


rule "[ramattra/init.opy]: Increase Pummel damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR)
    @Condition eventDamage >= 50 # This condition stops vortex from applying the damage increase
    @Condition eventAbility != Button.MELEE
    
    damage(victim, attacker, eventDamage * (ADJ_RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE) - eventDamage)


rule "[ramattra/init.opy]: Set Ravenous Vortex cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.isUsingAbility2()
    
    waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_2) != 0, Math.INFINITY)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 12)


rule "[ramattra/init.opy]: Bonus Annihilation movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.isUsingUltimate()
    
    wait(0.1)
    eventPlayer.setMoveSpeed(100)


/*
rule "Reset Nemesis bonus armor when going into Annihilation":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    
    removeHealthPool(getLastCreatedHealthPool())
    eventPlayer.addHealthPool(Health.ARMOR, 15, true, true)
*/