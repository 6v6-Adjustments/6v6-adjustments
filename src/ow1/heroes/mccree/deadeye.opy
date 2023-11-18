#!mainFile "../../../main.opy"


rule "[mccree.opy]: Remove damage reduction during deadeye":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.MCCREE)
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setDamageReceived(percent(100/(100-OW2_MCCREE_DEADEYE_DAMAGE_REDUCTION)))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageReceived(100)
