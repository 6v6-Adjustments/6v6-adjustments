#!mainFile "../dev_main.opy"

globalvar enable_respawn_helper = createWorkshopSetting(bool, 'General Changes', 'Faster Respawning Below 6 Players', true, 0)
globalvar ADJ_RESPAWN_ASSIST_REDUCTION = createWorkshopSetting(float[0.1:10], 'General Changes', 'Faster Respawning Timer per missing player', ADJ_RESPAWN_ASSIST_REDUCTION_DEFAULT)


rule "[utilities/respawn_helper.opy]: Initialize Respawn Timers when starting a match":
    @Condition enable_respawn_helper
    @Condition not getAllPlayers() == 12

    getPlayers(Team.1).setRespawnTime(10 - (6 - getNumberOfPlayers(Team.1)) * ADJ_RESPAWN_ASSIST_REDUCTION)
    getPlayers(Team.2).setRespawnTime(10 - (6 - getNumberOfPlayers(Team.2)) * ADJ_RESPAWN_ASSIST_REDUCTION)


rule "[utilities/respawn_helper.opy]: Update Respawn Timers when players join a match":
    @Event playerJoined
    @Condition enable_respawn_helper

    getPlayers(Team.1).setRespawnTime(10 - (6 - getNumberOfPlayers(Team.1)) * ADJ_RESPAWN_ASSIST_REDUCTION)
    getPlayers(Team.2).setRespawnTime(10 - (6 - getNumberOfPlayers(Team.2)) * ADJ_RESPAWN_ASSIST_REDUCTION)


rule "[utilities/respawn_helper.opy]: Update Respawn Timers when players leave a match":
    @Event playerLeft
    @Condition enable_respawn_helper

    getPlayers(Team.1).setRespawnTime(10 - (6 - getNumberOfPlayers(Team.1)) * ADJ_RESPAWN_ASSIST_REDUCTION)
    getPlayers(Team.2).setRespawnTime(10 - (6 - getNumberOfPlayers(Team.2)) * ADJ_RESPAWN_ASSIST_REDUCTION)
