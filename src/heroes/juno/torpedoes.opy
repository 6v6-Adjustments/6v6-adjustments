#!mainFile "../../dev_main.opy"


rule "[juno/init.opy]: Correct Pulsar Torpedo healing and damage":
    @Event eachPlayer
    @Hero juno
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)
    @Condition eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) < 0.1
    @Condition not eventPlayer.isMeleeing()
    @Condition not eventPlayer.isReloading()

    eventPlayer.setHealingDealt(percent(ADJ_JUNO_TORPEDO_HEALING/OW2_JUNO_TORPEDO_HEALING))
    eventPlayer.setDamageDealt(percent(ADJ_JUNO_TORPEDO_DAMAGE/OW2_JUNO_TORPEDO_DAMAGE))
    waitUntil(eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0, OW2_JUNO_TORPEDO_CAST_DURATION)
    eventPlayer.setHealingDealt(percent(eventPlayer._base_healing_scalar))
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))


rule "[juno/init.opy]: Correct Pulsar Torpedo healing over time":
    @Event playerDealtHealing
    @Hero juno
    @Condition eventHealing > ADJ_JUNO_TORPEDO_HEALING-1

    healee.startDoT(null, OW2_JUNO_TORPEDO_HEALING_DURATION-0.1, OW2_JUNO_TORPEDO_HOT-ADJ_JUNO_TORPEDO_HOT)
