#!mainFile "../../dev_main.opy"


rule "[ana/nade.opy]: Increase Biotic Grenade healing":
    @Event playerDealtHealing
    @Condition eventPlayer.hero_setup == Hero.ANA
    @Condition eventAbility == Button.ABILITY_2

    heal(healee, healer, eventHealing*(ADJ_ANA_BIOTIC_GRENADE_HEALING/OW2_ANA_BIOTIC_GRENADE_HEALING)-eventHealing)
    eventPlayer.biotic_nade_flying = true


rule "[ana/nade.opy]: Allow self healing during Biotic Grenade":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ANA
    @Condition eventPlayer.isUsingAbility2()

    damage(eventPlayer, null, MIN_DAMAGE)
    eventPlayer.biotic_nade_flying = false
    pushSelfHealing(Button.ABILITY_2)
    waitUntil(eventPlayer.biotic_nade_flying, ADJ_THROWABLES_WAIT_TIME)
    popSelfHealing(Button.ABILITY_2)
