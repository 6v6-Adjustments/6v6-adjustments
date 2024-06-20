#!mainFile "../../dev_main.opy"


rule "[junkerqueen/jagged_blade.opy]: Increase pull distance on squishies":
    @Event playerDealtKnockback
    @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition victim.getCurrentHero() not in getTankHeroes()

    victim.applyImpulse(vect((normalize(eventPlayer.getPosition() - victim.getPosition())).x, 0, (normalize(eventPlayer.getPosition() - victim)).z), 7.5, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)

