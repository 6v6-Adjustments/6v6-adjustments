#!mainFile "../../dev_main.opy"

playervar hp_exiting_grasp


rule "[sigma/kinetic_grasp.opy]: Reduce Kinetic Grasp overhealth":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.SIGMA
    @Condition eventPlayer.isUsingAbility1()
    
    wait(OW2_SIGMA_KINETIC_GRASP_DURATION - 50 * TICK_DURATION, Wait.ABORT_WHEN_FALSE)
    eventPlayer.hp_exiting_grasp = eventPlayer.getHealth()
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    damage(eventPlayer, null, (1 - ADJ_SIGMA_KINETIC_GRASP_OVERHEALTH/OW2_SIGMA_KINETIC_GRASP_OVERHEALTH) * (eventPlayer.getHealth() - eventPlayer.hp_exiting_grasp))
