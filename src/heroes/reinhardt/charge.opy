#!mainFile "../../dev_main.opy"


rule "[reinhardt/charge.opy]: Correct Charge damage":
    @Event playerDealtDamage
    @Hero reinhardt
    @Condition eventAbility == Button.ABILITY_1
    
    if eventDamage > (OW2_REINHARDT_CHARGE_BUMP_DAMAGE + 1): # Checks for pin vs boop damage (+ 1 because apparently 50.0 > 50 == true for whatever reason)
        damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar*(ADJ_REINHARDT_CHARGE_PIN_DAMAGE/OW2_REINHARDT_CHARGE_PIN_DAMAGE)-eventDamage)/eventPlayer._base_damage_scalar)
    else:
        damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
