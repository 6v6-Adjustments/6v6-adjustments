#!mainFile "../../dev_main.opy"


rule "[ana/nade.opy]: Increase Biotic Grenade healing":
    @Team 1
    @Event playerDealtHealing
    @Condition eventPlayer.hero_setup == Hero.ANA
    @Condition eventAbility == Button.ABILITY_2

    heal(healee, healer, eventHealing*(ADJ_ANA_BIOTIC_GRENADE_HEALING/OW2_ANA_BIOTIC_GRENADE_HEALING)-eventHealing)


rule "[ana/nade.opy]: Allow self healing during Biotic Grenade":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ANA
    @Condition eventPlayer.isUsingAbility2()

    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    popSelfHealing(Button.ABILITY_2)
