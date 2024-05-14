#!mainFile "../../dev_main.opy"


rule "[wreckingball/grapple.opy]: Force Grappling Hook cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.HAMMOND
    @Condition eventPlayer.isFiringSecondaryFire()
    
    waitUntil(eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0, Math.INFINITY)
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_WRECKING_BALL_GRAPPLE_COOLDOWN)


rule "[wreckingball/grapple.opy]: Correct fireball damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.HAMMOND
    @Condition eventAbility == Button.SECONDARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_WRECKING_BALL_FIREBALL_DAMAGE/OW2_WRECKING_BALL_FIREBALL_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
