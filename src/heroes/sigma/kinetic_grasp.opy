#!mainFile "../../dev_main.opy"

# playervar hp_exiting_grasp


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


# rule "[sigma/kinetic_grasp.opy]: Reduce Kinetic Grasp overhealth":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.SIGMA
#     @Condition eventPlayer.isUsingAbility1()
    
#     wait(OW2_SIGMA_KINETIC_GRASP_DURATION - 50 * TICK_DURATION, Wait.ABORT_WHEN_FALSE)
#     eventPlayer.hp_exiting_grasp = eventPlayer.getHealth()
#     waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
#     damage(eventPlayer, null, (1 - ADJ_SIGMA_KINETIC_GRASP_OVERHEALTH/OW2_SIGMA_KINETIC_GRASP_OVERHEALTH) * (eventPlayer.getHealth() - eventPlayer.hp_exiting_grasp))
