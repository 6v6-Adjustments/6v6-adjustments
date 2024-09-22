#!mainFile "../../dev_main.opy"


rule "[venture/burrow.opy]: Correct Burrow damage":
    @Event eachPlayer
    @Hero venture
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.setDamageDealt(percent(ADJ_VENTURE_BURROW_DAMAGE/OW2_VENTURE_BURROW_DAMAGE))
    waitUntil(not eventPlayer.isUsingAbility1(), ADJ_VENTURE_BURROW_DURATION)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
