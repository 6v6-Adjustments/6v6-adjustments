#!mainFile "../../dev_main.opy"

playervar terra_overhealth_id


rule "[orisa/terra_surge.opy]: Reduce Terra Surge damage":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(percent(ADJ_ORISA_TERRA_SURGE_MAX_DAMAGE/OW2_ORISA_TERRA_SURGE_MAX_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar)) # revert damage back after Terra Surge concludes


rule "[orisa/terra_surge.opy]: Increase Terra Surge overhealth":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.addHealthPool(Health.NORMAL, ADJ_ORISA_TERRA_SURGE_OVERHEALTH - OW2_ORISA_TERRA_SURGE_OVERHEALTH, false, true)
    eventPlayer.terra_overhealth_id = getLastCreatedHealthPool()
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    removeHealthPool(eventPlayer.terra_overhealth_id)
