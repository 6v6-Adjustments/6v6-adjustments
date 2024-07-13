#!mainFile "../../dev_main.opy"


rule "[junkerqueen/jagged_blade.opy]: Correct Jagged Blade impact damage":
    @Event playerDealtDamage
    @Hero junkerQueen
    @Condition eventDamage == (OW2_JUNKERQUEEN_BLADE_IMPACT_DAMAGE * (ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE / OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)) or ((OW2_JUNKERQUEEN_BLADE_IMPACT_DAMAGE * (ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE / OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)) * 1.25) or ((OW2_JUNKERQUEEN_BLADE_IMPACT_DAMAGE * (ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE / OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)) * 1.5)

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[junkerqueen/jagged_blade.opy]: Increase Jagged Blade pull distance on squishies":
    @Event playerDealtKnockback
    @Hero junkerQueen
    @Condition not eventPlayer.isMeleeing() 
    @Condition victim.getCurrentHero() not in getTankHeroes()

    victim.applyImpulse(vect((normalize(eventPlayer.getPosition() - victim.getPosition())).x, 0, (normalize(eventPlayer.getPosition() - victim)).z), 7.5, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)
