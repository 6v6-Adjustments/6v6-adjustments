#!mainFile "../../dev_main.opy"

#!include "heroes/sigma/kinetic_grasp.opy"


rule "[sigma/init.opy]: Sigma":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SIGMA

    setCustomHp(ADJ_SIGMA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_SIGMA_HEALTH, 0, ADJ_SIGMA_SHIELDS)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.balance_change_check = 0
    eventPlayer.call_init = false


rule "[sigma/init.opy]: Increase Accretion damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.SIGMA
    @Condition eventAbility == Button.ABILITY_2
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_SIGMA_ACCRETION_DAMAGE/OW2_SIGMA_ACCRETION_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
