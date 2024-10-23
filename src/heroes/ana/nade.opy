#!mainFile "../../dev_main.opy"

playervar biotic_nade_flying

#!include "constants/adj_constants.opy"
#!include "constants/ow2_constants.opy"
#!include "passives/support/self_heal.opy"


rule "[ana/nade.opy]: Increase Biotic Grenade healing":
    @Event playerDealtHealing
    @Hero ana
    @Condition eventAbility == Button.ABILITY_2

    heal(healee, healer, eventHealing*(ADJ_ANA_BIOTIC_GRENADE_HEALING/OW2_ANA_BIOTIC_GRENADE_HEALING)-eventHealing)
    eventPlayer.biotic_nade_flying = false


rule "[ana/nade.opy]: Allow self healing during Biotic Grenade":
    @Event eachPlayer
    @Hero ana
    @Condition eventPlayer.isUsingAbility2()

    damage(eventPlayer, null, MIN_DAMAGE)
    eventPlayer.biotic_nade_flying = true
    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.biotic_nade_flying, ADJ_THROWABLES_WAIT_TIME)
    popSelfHealing(Button.ABILITY_2)


rule "[ana/nade.opy]: Track Biotic Grenade Anti duration effect":
    @Event playerDealtDamage
    @Hero ana
    @Condition eventAbility == Button.ABILITY_2

    if victim.remainingAntiDuration < OW2_ANA_BIOTIC_GRENADE_DURATION:
        stopChasingVariable(eventPlayer.remainingAntiDuration)
        victim.remainingAntiDuration = OW2_ANA_BIOTIC_GRENADE_DURATION
        chase(victim.remainingAntiDuration, 0.0, rate=1.0, ChaseReeval.NONE)
