#!mainFile "../../dev_main.opy"


rule "[mccree/deadeye.opy]: Set damage during deadeye":
    @Event eachPlayer
    @Hero cassidy
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setDamageDealt(100)
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
