#!mainFile "../../dev_main.opy"


rule "[wreckingball/grapple.opy]: Force Grappling Hook cooldown":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.HAMMOND
    @Condition eventPlayer.isFiringSecondaryFire()
    
    waitUntil(eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0, Math.INFINITY)
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_WRECKING_BALL_GRAPPLE_COOLDOWN)


rule "[wreckingball/grapple.opy]: Increase Fireball impact damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.HAMMOND
    @Condition eventAbility == Button.SECONDARY_FIRE
        
        damage(
            victim, 
            attacker, 
            ((ADJ_WRECKING_BALL_FIREBALL_DAMAGE/OW2_WRECKING_BALL_FIREBALL_DAMAGE) \
            * (eventDamage/eventPlayer._base_damage_scalar) \
            - eventDamage)/eventPlayer._base_damage_scalar)
