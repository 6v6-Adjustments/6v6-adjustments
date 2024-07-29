#!mainFile "../../dev_main.opy"


rule "[lucio/aura.opy]: Allow self healing during heal aura":
    @Event eachPlayer
    @Hero lucio
    @Condition not eventPlayer.isUsingAbility1()

    pushSelfHealing(Button.ABILITY_1)
    waitUntil(eventPlayer.isUsingAbility1(), Math.INFINITY)
    popSelfHealing(Button.ABILITY_1)


rule "[illari/init.opy]: Correct Aura self healing":
    @Event playerDealtHealing
    @Hero lucio
    @Condition healee == healer
    @Condition eventAbility == Button.ABILITY_1
    @Condition not eventPlayer.isUsingAbility2()

    heal(healer, healer, eventHealing * (OW2_LUCIO_ALLY_HEALING / OW2_LUCIO_SELF_HEALING) - eventHealing)
    