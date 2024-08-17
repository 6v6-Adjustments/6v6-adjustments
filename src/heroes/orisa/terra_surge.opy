#!mainFile "../../dev_main.opy"

playervar terra_overhealth


rule "[orisa/terra_surge.opy]: Reduce Terra Surge damage":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(percent(ADJ_ORISA_TERRA_SURGE_MAX_DAMAGE/OW2_ORISA_TERRA_SURGE_MAX_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(100) # revert damage back after Terra Surge concludes


rule "[orisa/terra_surge.opy]: Increase Terra Surge overhealth":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.addHealthPool(Health.NORMAL, ADJ_ORISA_TERRA_SURGE_OVERHEALTH - OW2_ORISA_TERRA_SURGE_OVERHEALTH, false, true)
    eventPlayer.terra_overhealth = getLastCreatedHealthPool()
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    removeHealthPool(eventPlayer.terra_overhealth)
