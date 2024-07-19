#!mainFile "../../dev_main.opy"

#!include "heroes/sigma/accretion.opy"
#!include "heroes/sigma/kinetic_grasp.opy"


rule "[sigma/init.opy]: Initialize Sigma":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SIGMA

    setCustomHp(
        ADJ_SIGMA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_SIGMA_HEALTH,
        0,
        ADJ_SIGMA_SHIELDS)
    setUltCost(
        ADJ_SIGMA_ULT_COST)
    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_SIGMA_ACCRETION_DAMAGE/OW2_SIGMA_ACCRETION_DAMAGE)

    eventPlayer.balance_change_check = 0
    eventPlayer.call_init = false


rule "[sigma/init.opy]: Increase Sigma other forms of damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.SIGMA
    @Condition eventAbility in [Button.MELEE, Button.PRIMARY_FIRE, Button.ULTIMATE]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
