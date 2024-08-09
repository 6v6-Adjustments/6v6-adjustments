#!mainFile "../../dev_main.opy"

playervar biotic_nade_flying


rule "[ana/nade.opy]: Increase Biotic Grenade damage":
    @Event playerDealtDamage
    @Hero ana
    @Condition eventAbility == Button.ABILITY_2

    damage(victim, attacker, eventDamage * (ADJ_ANA_BIOTIC_GRENADE_DAMAGE / OW2_ANA_BIOTIC_GRENADE_DAMAGE) - eventDamage)
    eventPlayer.biotic_nade_flying = false


rule "[ana/nade.opy]: Increase Biotic Grenade healing":
    @Event playerDealtHealing
    @Hero ana
    @Condition eventAbility == Button.ABILITY_2

    heal(healee, healer, eventHealing * (ADJ_ANA_BIOTIC_GRENADE_HEALING / OW2_ANA_BIOTIC_GRENADE_HEALING) - eventDamage)
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
