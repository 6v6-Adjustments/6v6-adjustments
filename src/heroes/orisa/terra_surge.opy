#!mainFile "../../dev_main.opy"


rule "[orisa/terra_surge.opy]: Reduce Terra Surge damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ORISA
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(percent(ADJ_ORISA_TERRA_SURGE_MAX_DAMAGE/OW2_ORISA_TERRA_SURGE_MAX_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(100)
