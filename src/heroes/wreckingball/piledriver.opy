#!mainFile "../../dev_main.opy"


rule "[wreckingball/piledriver.opy]: Increase Piledriver damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.HAMMOND
    @Condition eventAbility == Button.CROUCH

    damage(
        victim, 
        attacker, 
        ((ADJ_WRECKING_BALL_PILEDRIVER_DAMAGE/OW2_WRECKING_BALL_PILEDRIVER_DAMAGE) \
        * (eventDamage/eventPlayer._base_damage_scalar) \
        - eventDamage)/eventPlayer._base_damage_scalar)
