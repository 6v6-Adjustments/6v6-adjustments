#!mainFile "../../dev_main.opy"

#!include "heroes/mauga/cage_fight.opy"
#!include "heroes/mauga/cardiac.opy"


rule "[mauga/init.opy]: Initialize Mauga":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.call_init

    setCustomHp(
        ADJ_MAUGA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_MAUGA_HEALTH, 
        ADJ_MAUGA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_MAUGA_ARMOR, 
        0)
    setUltCost(ADJ_MAUGA_ULT_COST)

    removeTankPassive()
    removeSelfHealing()
    
    setBaseDamage(eventPlayer, ADJ_MAUGA_CHAINGUN_DAMAGE/OW2_MAUGA_CHAINGUN_DAMAGE)
    setBaseHealing(eventPlayer, ADJ_MAUGA_CARDIAC_LIFESTEAL/OW2_MAUGA_CARDIAC_LIFESTEAL)

    eventPlayer.startScalingSize(0.94, true)

    eventPlayer.balance_change_check = false

    eventPlayer.call_init = false


rule "[mauga/init.opy]: Increase Mauga melee damage":
    @Event playerDealtDamage
    @Hero mauga
    @Condition eventAbility in [Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[mauga/init.opy]: Reduce Mauga stomp damage":
    @Event playerDealtDamage
    @Hero mauga
    @Condition eventAbility == Button.ABILITY_1

    heal(victim, null, eventDamage - ((ADJ_MAUGA_STOMP_DAMAGE / OW2_MAUGA_STOMP_DAMAGE) * eventDamage/eventPlayer._base_damage_scalar))
