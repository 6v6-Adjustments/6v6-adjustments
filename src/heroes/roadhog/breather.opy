#!mainFile "../../dev_main.opy"


rule "[roadhog/breather.opy]: Allow self healing during Breather":
    @Event eachPlayer
    @Hero roadhog
    @Condition eventPlayer.isFiringSecondaryFire()

    damage(eventPlayer, null, MIN_DAMAGE)
    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    popSelfHealing(Button.ABILITY_2)

    # do not merge these two rules together, the breather logic interferes with the self-healing timing

rule "[roadhog/breather.opy]: Adjust Breather efficacy":
    @Event eachPlayer
    @Hero roadhog
    @Condition eventPlayer.isFiringSecondaryFire()

    eventPlayer.setHealingDealt(percent(ADJ_ROADHOG_BREATHER_HEAL_MINIMUM/OW2_ROADHOG_BREATHER_HEAL_MINIMUM))
    wait(OW2_ROADHOG_BREATHER_MINIMUM_DURATION)
    eventPlayer.setHealingDealt(percent((ADJ_ROADHOG_BREATHER_HEAL_MAXIMUM-ADJ_ROADHOG_BREATHER_HEAL_MINIMUM)/(OW2_ROADHOG_BREATHER_HEAL_MAXIMUM-OW2_ROADHOG_BREATHER_HEAL_MINIMUM)))
    waitUntil(not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    eventPlayer.setHealingDealt(100)
