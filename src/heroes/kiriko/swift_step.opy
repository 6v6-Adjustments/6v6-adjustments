#!mainFile "../../dev_main.opy"


rule "[kiriko/swift_step.opy]: Heal when using Swift Step":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.KIRIKO
    @Condition eventPlayer.isUsingAbility1() == true
    
    eventPlayer.startHoT(eventPlayer, ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL_DURATION, ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL/ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL_DURATION)


rule "[kiriko/swift_step.opy]: Force swift step cooldown after spawning":
    @Team 1
    @Event playerDied
    @Condition eventPlayer.hero_setup == Hero.KIRIKO

    waitUntil(eventPlayer.isAlive() and eventPlayer.isInSpawnRoom(), Math.INFINITY)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN)
