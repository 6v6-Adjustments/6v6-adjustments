#!mainFile "../../dev_main.opy"


rule "[junkerqueen/rampage.opy]: Reduce Rampage damage":
    @Event eachPlayer
    @Hero junkerQueen
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setDamageDealt(percent(ADJ_JUNKERQUEEN_RAMPAGE_WOUND_DAMAGE/OW2_JUNKERQUEEN_RAMPAGE_WOUND_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))


rule "[ana/nade.opy]: Track Biotic Grenade Anti duration effect":
    @Event playerDealtDamage
    @Hero junkerQueen
    @Condition eventAbility == Button.ULTIMATE

    if victim.remainingAntiDuration < OW2_JUNKERQUEEN_RAMPAGE_ANTI_DURATION:
        stopChasingVariable(eventPlayer.remainingAntiDuration)
        victim.remainingAntiDuration = OW2_JUNKERQUEEN_RAMPAGE_ANTI_DURATION
        chase(victim.remainingAntiDuration, 0.0, rate=1.0, ChaseReeval.NONE)