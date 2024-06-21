#!mainFile "../../dev_main.opy"


rule "[soldier/biotic_field.opy]: Allow self healing during Biotic Field":
    @Event eachPlayer
    @Hero soldier
    @Condition eventPlayer.isUsingAbility2()

    damage(eventPlayer, null, MIN_DAMAGE)
    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.isUsingAbility2(), ADJ_SOLDIER_BIOTIC_FIELD_DURATION)
    popSelfHealing(Button.ABILITY_2)
