#!mainFile "../../dev_main.opy"


rule "[kiriko/swift_step.opy]: Force swift step cooldown after spawning":
    @Event playerDied
    @Hero kiriko

    waitUntil(eventPlayer.isAlive() and eventPlayer.isInSpawnRoom(), Math.INFINITY)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN)


rule "[kiriko/swift_step.opy]: Heal when using Swift Step":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.KIRIKO
    @Condition eventPlayer.isUsingAbility1()
    @Condition not eventPlayer.suzu_flying
    
    wait(0.1) # grace period to allow SS to cleanse anti-heal effects
    eventPlayer.startHoT(null , ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL_DURATION, ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL/ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL_DURATION)
