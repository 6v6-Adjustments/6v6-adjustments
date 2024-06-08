#!mainFile "../../dev_main.opy"


rule "[mauga/init.opy]: Increase Mauga stomp damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.isUsingAbility1()
    @Condition eventDamage > 20 # arbitrary number chosen to not mistakenly buff burn damage

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
