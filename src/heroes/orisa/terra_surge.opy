#!mainFile "../../dev_main.opy"

playervar terra_overhealth_id


rule "[orisa/terra_surge.opy]: Reduce Terra Surge base damage and add bonus overhealth":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.addHealthPool(Health.NORMAL, ADJ_ORISA_TERRA_SURGE_OVERHEALTH - OW2_ORISA_TERRA_SURGE_OVERHEALTH, false, true)
    eventPlayer.terra_overhealth_id = getLastCreatedHealthPool()
    eventPlayer.setDamageDealt(percent(ADJ_ORISA_TERRA_SURGE_MAX_DAMAGE/OW2_ORISA_TERRA_SURGE_MAX_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
    removeHealthPool(eventPlayer.terra_overhealth_id)


rule "[orisa/terra_surge.opy]: Increase Terra Surge overhealth":
    @Event playerDealtDamage
    @Hero orisa
    @Condition eventAbility == Button.ULTIMATE
    @Condition eventDamage >= 50  # do not include wind-up damage

    damage(victim, attacker, ADJ_ORISA_TERRA_SURGE_MINIMUM_DAMAGE - eventDamage)
