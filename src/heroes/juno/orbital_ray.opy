#!mainFile "../../dev_main.opy"

playervar orbital_ray_x
playervar orbital_ray_z
playervar orbital_ray_final_x
playervar orbital_ray_final_z

rule "[juno/orbital_ray.opy]: Adjust Orbital Ray Healing":
    @Event eachPlayer
    @Hero juno
    @Condition eventPlayer.isUsingUltimate()
    @Condition eventPlayer.isAlive()
    @Condition not eventPlayer.hasStatusEffect(Status.ASLEEP)
    @Condition not eventPlayer.hasStatusEffect(Status.FROZEN)
    @Condition not eventPlayer.hasStatusEffect(Status.KNOCKED_DOWN)
    @Condition not eventPlayer.hasStatusEffect(Status.STUNNED)

    wait(OW2_JUNO_ORBITAL_RAY_CAST_TIME)

    eventPlayer.orbital_ray_x = (eventPlayer.getPosition() + OW2_JUNO_ORBITAL_RAY_START_DIST * angleToDirection(eventPlayer.getHorizontalFacingAngle(), 0)).x
    eventPlayer.orbital_ray_z = (eventPlayer.getPosition() + OW2_JUNO_ORBITAL_RAY_START_DIST * angleToDirection(eventPlayer.getHorizontalFacingAngle(), 0)).z

    eventPlayer.orbital_ray_final_x = (eventPlayer.getPosition() + OW2_JUNO_ORBITAL_RAY_END_DIST * angleToDirection(eventPlayer.getHorizontalFacingAngle(), 0)).x
    eventPlayer.orbital_ray_final_z = (eventPlayer.getPosition() + OW2_JUNO_ORBITAL_RAY_END_DIST * angleToDirection(eventPlayer.getHorizontalFacingAngle(), 0)).z
    
    chase(eventPlayer.orbital_ray_x, eventPlayer.orbital_ray_final_x, duration=OW2_JUNO_ORBITAL_RAY_DURATION, ChaseReeval.NONE)
    chase(eventPlayer.orbital_ray_z, eventPlayer.orbital_ray_final_z, duration=OW2_JUNO_ORBITAL_RAY_DURATION, ChaseReeval.NONE)

    # createBeam(eventPlayer, Beam.GOOD, vect(eventPlayer.orbital_ray_x, 0.0, eventPlayer.orbital_ray_z), vect(eventPlayer.orbital_ray_x, 100.0, eventPlayer.orbital_ray_z), Color.WHITE, EffectReeval.POSITION_AND_RADIUS)

    while eventPlayer.isUsingUltimate():
        [player
            for player 
            in getLivingPlayers(eventPlayer.getTeam())
            if distance(vect(eventPlayer.orbital_ray_x, 0.0, eventPlayer.orbital_ray_z), vect(player.getPosition().x, 0.0, player.getPosition().z)) < OW2_JUNO_ORBITAL_RAY_RADIUS
            and player.getHealth() < player.getMaxHealth()
            and player.remainingAntiDuration <= 0].startDoT(null, ADJ_JUNO_ORBITAL_RAY_UPDATE_DELAY, OW2_JUNO_ORBITAL_RAY_HPS - ADJ_JUNO_ORBITAL_RAY_HPS)
        wait(ADJ_JUNO_ORBITAL_RAY_UPDATE_DELAY)
