#!mainFile "../../dev_main.opy"


rule "[winston/init.opy]: Winston":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.WINSTON

    setCustomHp(ADJ_WINSTON_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_WINSTON_HEALTH, ADJ_WINSTON_ARMOR, 0)
    removeTankPassive()
    removeSelfHealing()
    setBaseDamage(eventPlayer, ADJ_WINSTON_TESLA_DAMAGE/OW2_WINSTON_TESLA_DAMAGE)

    eventPlayer.call_init = false


rule "[winston/init.opy]: Correct Jump Pack, Melee, Primal Rage damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    @Condition eventAbility in [Button.ABILITY_1, Button.MELEE, Button.SECONDARY_FIRE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
