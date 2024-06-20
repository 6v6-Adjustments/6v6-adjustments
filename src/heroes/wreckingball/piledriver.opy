#!mainFile "../../dev_main.opy"


rule "[wreckingball/piledriver.opy]: Increase Piledriver damage":
    @Event playerDealtDamage
    @Hero hammond
    @Condition eventAbility == Button.CROUCH

    damage(
        victim, 
        attacker, 
        ((ADJ_WRECKING_BALL_PILEDRIVER_DAMAGE/OW2_WRECKING_BALL_PILEDRIVER_DAMAGE) \
        * (eventDamage/eventPlayer._base_damage_scalar) \
        - eventDamage)/eventPlayer._base_damage_scalar)
