#!mainFile "../../dev_main.opy"


rule "[kiriko/swift_step.opy]: Force swift step cooldown after spawning":
    @Event playerDied
    @Hero kiriko

    waitUntil(eventPlayer.isAlive() and eventPlayer.isInSpawnRoom(), Math.INFINITY)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN)


rule "[kiriko/swift_step.opy]: Heal when using Swift Step":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.KIRIKO
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.suzu_flying == false
    
    wait(0.1) # grace period to allow SS to cleanse anti-heal effects
    eventPlayer.startHoT(eventPlayer, ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL_DURATION, ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL/ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL_DURATION)


# rule "[kiriko/swift_step.opy]: Unlock Swift Step while in LoS":
#     @Event eachPlayer
#     @Hero kiriko
#     @Condition isInLoS(eventPlayer, eventPlayer.getPlayerClosestToReticle(eventPlayer.getTeam()), BarrierLos.PASS_THROUGH_BARRIERS) == true
    
#     eventPlayer.setAbility1Enabled(true)


# rule "[kiriko/swift_step.opy]: Lock Swift Step while not in LoS":
#     @Event eachPlayer
#     @Hero kiriko
#     @Condition isInLoS(eventPlayer, eventPlayer.getPlayerClosestToReticle(eventPlayer.getTeam()), BarrierLos.PASS_THROUGH_BARRIERS) == false
    
#     eventPlayer.setAbility1Enabled(false)
