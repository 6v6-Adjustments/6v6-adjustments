#!mainFile "../../dev_main.opy"

playervar within_shout_radius = false


rule "[junkerqueen/commanding_shout.opy]: Prepare Commanding Shout overhealth reduction":
    @Event eachPlayer
    @Hero junkerQueen
    @Condition eventPlayer.isUsingAbility1()

    getPlayersInRadius(eventPlayer, 15.5, eventPlayer.getTeam(), LosCheck.SURFACES).exclude(eventPlayer).within_shout_radius = true


rule "[junkerqueen/commanding_shout.opy]: Reduce Commanding Shout overhealth for allies":
    @Event eachPlayer
    @Condition eventPlayer.within_shout_radius == true

    damage(eventPlayer, null, ((OW2_JUNKERQUEEN_SHOUT_ALLY_OVERHEALTH - ADJ_JUNKERQUEEN_SHOUT_ALLY_OVERHEALTH) * eventPlayer.max_health_scaler))
    heal(eventPlayer, null, 0.01)
    wait()
    eventPlayer.within_shout_radius = false
