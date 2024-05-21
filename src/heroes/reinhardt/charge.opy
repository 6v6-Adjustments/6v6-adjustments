#!mainFile "../../dev_main.opy"


rule "[reinhardt/charge.opy]: Correct Charge damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    @Condition eventAbility == Button.ABILITY_1
    
    if eventDamage > (OW2_REINHARDT_CHARGE_BUMP_DAMAGE + 1): # Checks for pin vs boop damage (+ 1 because apparently 50.0 > 50 == true for whatever reason)
        damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar*(ADJ_REINHARDT_CHARGE_PIN_DAMAGE/OW2_REINHARDT_CHARGE_PIN_DAMAGE)-eventDamage)/eventPlayer._base_damage_scalar)
    else:
        damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[reinhardt/charge.opy]: Reduce Charge radius":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    @Condition eventPlayer.isUsingAbility1()

    eventPlayer.startForcingThrottle(0, 1/OW2_REINHARDT_TURN_BONUS, 0, 1/OW2_REINHARDT_TURN_BONUS, 0, 1/OW2_REINHARDT_TURN_BONUS)
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.stopForcingThrottle()
