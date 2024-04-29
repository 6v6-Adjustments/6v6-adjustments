#!mainFile "../dev_main.opy"

globalvar max_roles = [
    createWorkshopSetting(int[0:5], "Role limits", "Tank Role Cap", 2, 0),
    createWorkshopSetting(int[0:5], "Role limits", "Damage Role Cap", 2, 1),
    createWorkshopSetting(int[0:5], "Role limits", "Support Role Cap", 2, 2)
]


rule "[utilities/role_lock.opy]: Skip Hero Assembly Phase":
    @Condition isAssemblingHeroes() == true

    setMatchTime(0.1)


rule "[utilities/role_lock.opy]: Initialize Role Limits":
    @Event eachPlayer

    eventPlayer.allowed_heroes = getAllHeroes()


rule "[utilities/role_lock.opy]: Lock/Unlock Tank heroes at role limit":
    @Event eachPlayer
    @Condition len(([player for player in getPlayers(eventPlayer.getTeam()) if player.getCurrentHero() in getTankHeroes()]).exclude(eventPlayer)) >= max_roles[0]
    @Condition max_roles[0] > 0

    eventPlayer.allowed_heroes.remove(getTankHeroes())
    eventPlayer.setAllowedHeroes(eventPlayer.allowed_heroes)
    waitUntil(len(([player for player in getPlayers(eventPlayer.getTeam()) if player.getCurrentHero() in getTankHeroes()]).exclude(eventPlayer)) < max_roles[0], 99999)
    eventPlayer.allowed_heroes.append(getTankHeroes())
    eventPlayer.setAllowedHeroes(eventPlayer.allowed_heroes)


rule "[utilities/role_lock.opy]: Lock/Unlock Damage heroes at role limit":
    @Event eachPlayer
    @Condition len(([player for player in getPlayers(eventPlayer.getTeam()) if player.getCurrentHero() in getDamageHeroes()]).exclude(eventPlayer)) >= max_roles[1]
    @Condition max_roles[1] > 0

    eventPlayer.allowed_heroes.remove(getDamageHeroes())
    eventPlayer.setAllowedHeroes(eventPlayer.allowed_heroes)
    waitUntil(len(([player for player in getPlayers(eventPlayer.getTeam()) if player.getCurrentHero() in getDamageHeroes()]).exclude(eventPlayer)) < max_roles[1], 99999)
    eventPlayer.allowed_heroes.append(getDamageHeroes())
    eventPlayer.setAllowedHeroes(eventPlayer.allowed_heroes)


rule "[utilities/role_lock.opy]: Lock/Unlock Support heroes at role limit":
    @Event eachPlayer
    @Condition len(([player for player in getPlayers(eventPlayer.getTeam()) if player.getCurrentHero() in getSupportHeroes()]).exclude(eventPlayer)) >= max_roles[2]
    @Condition max_roles[2] > 0

    eventPlayer.allowed_heroes.remove(getSupportHeroes())
    eventPlayer.setAllowedHeroes(eventPlayer.allowed_heroes)
    waitUntil(len(([player for player in getPlayers(eventPlayer.getTeam()) if player.getCurrentHero() in getSupportHeroes()]).exclude(eventPlayer)) < max_roles[2], 99999)
    eventPlayer.allowed_heroes.append(getSupportHeroes())
    eventPlayer.setAllowedHeroes(eventPlayer.allowed_heroes)
