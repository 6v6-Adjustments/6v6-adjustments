#!mainFile "../../dev_main.opy"


rule "[sigma/kinetic_grasp.opy]: Remove Kinetic Grasp overhealth":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.SIGMA
    @Condition eventPlayer.isUsingAbility1()
    
    wait(1.92)
    if not RULE_CONDITION:
        return
    eventPlayer.setStatusEffect(null, Status.STUNNED, 0.001)
    if eventPlayer.isInSpawnRoom():
        wait(0.1)
        eventPlayer.balance_change_check = eventPlayer.getMaxHealth()
        eventPlayer.balance_change_check -= 450
        eventPlayer.setHealth(eventPlayer.getMaxHealth() - eventPlayer.balance_change_check)
