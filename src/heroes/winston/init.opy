#!mainFile "../../dev_main.opy"


rule "[winston/init.opy]: Winston":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.WINSTON

    newHero(300 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 400, 100, 0)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.setDamageDealt(80)

    eventPlayer.ult_change_check = 1.13


rule "[winston/init.opy]: Increase Winston other forms of damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    @Condition eventAbility != Button.PRIMARY_FIRE
    @Condition eventAbility != Button.ULTIMATE
    
    damage(victim, attacker, eventDamage * 1.25 - eventDamage)


rule "[winston/init.opy]: Set default Leap cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.isUsingUltimate() == false
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 6)


rule "[winston/init.opy]: Reset Leap cooldown after Primal Rage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    @Condition eventPlayer.isUsingUltimate() == true
    
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)