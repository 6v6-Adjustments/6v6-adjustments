#!mainFile "../../dev_main.opy"


rule "[roadhog/breather.opy]: Allow self healing during Breather":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isFiringSecondaryFire()

    damage(eventPlayer, null, MIN_DAMAGE)
    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    popSelfHealing(Button.ABILITY_2)
