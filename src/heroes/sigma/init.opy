#!mainFile "../../dev_main.opy"


rule "[sigma/init.opy]: Sigma":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.SIGMA

    newHero(250 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 300, 0, 150)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.balance_change_check = 0
    eventPlayer.ult_change_check = 1.07


rule "[sigma/init.opy]: Remove Kinetic Grasp overhealth":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.SIGMA
    @Condition eventPlayer.isUsingAbility1() == true
    
    wait(1.92)
    if not RULE_CONDITION:
        return
    eventPlayer.setStatusEffect(null, Status.STUNNED, 0.001)
    if eventPlayer.isInSpawnRoom():
        wait(0.1)
        eventPlayer.balance_change_check = eventPlayer.getMaxHealth()
        eventPlayer.balance_change_check -= 450
        eventPlayer.setHealth(eventPlayer.getMaxHealth() - eventPlayer.balance_change_check)


rule "[sigma/init.opy]: Increase Accretion damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.SIGMA
    @Condition eventAbility == Button.ABILITY_2
    
    damage(victim, attacker, eventDamage * 1.125 - eventDamage)