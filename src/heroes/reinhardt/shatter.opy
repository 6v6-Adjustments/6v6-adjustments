#!mainFile "../../dev_main.opy"


rule "[reinhardt/shatter.opy]: Correct Earthshatter damage":
    @Event playerDealtDamage
    @Hero reinhardt
    @Condition eventAbility == Button.ULTIMATE
    @Condition not eventWasCriticalHit
    
    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[reinhardt/shatter.opy]: Correct Earthshatter critical damage":
    @Event playerDealtDamage
    @Hero reinhardt
    @Condition eventAbility == Button.ULTIMATE
    @Condition eventWasCriticalHit
    
    damage(
        victim, 
        attacker, 
        ((eventDamage/eventPlayer._base_damage_scalar) * ((ADJ_REINHARDT_EARTHSHATTER_BASE_DAMAGE + ADJ_REINHARDT_EARTHSHATTER_BONUS_DAMAGE) 
            / (OW2_REINHARDT_EARTHSHATTER_BASE_DAMAGE + OW2_REINHARDT_EARTHSHATTER_BONUS_DAMAGE)) 
            - eventDamage)/eventPlayer._base_damage_scalar)
