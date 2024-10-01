#!mainFile "../../dev_main.opy"

#!include "heroes/mauga/cage_fight.opy"
#!include "heroes/mauga/cardiac.opy"

playervar mauga_healing_id


def initMauga():
    @Name "[mauga/init.opy]: initMauga()"

    setCustomHp(
        ADJ_MAUGA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_MAUGA_HEALTH, 
        ADJ_MAUGA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_MAUGA_ARMOR, 
        0)
    setUltCost(ADJ_MAUGA_ULT_COST)

    eventPlayer.setAmmo(0, ADJ_MAUGA_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_MAUGA_AMMO)

    removeTankPassive()
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
    setBaseDamage(eventPlayer, ADJ_MAUGA_CHAINGUN_DAMAGE/OW2_MAUGA_CHAINGUN_DAMAGE)
    startHealingModification(eventPlayer, eventPlayer, percent(ADJ_MAUGA_CARDIAC_LIFESTEAL/OW2_MAUGA_CARDIAC_LIFESTEAL), HealingReeval.RECEIVERS_HEALERS_AND_HEALPERCENT) # cardiac overdrive base healing is increased to account for the half effectiveness on allies, see lobby.opy
    eventPlayer.mauga_healing_id = getLastHealingModification()


    eventPlayer.startScalingSize(0.91, true)

    eventPlayer.balance_change_check = false
    eventPlayer.hero_initialized = true


rule "[mauga/init.opy]: Clean up Mauga":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup != Hero.MAUGA

    stopHealingModification(eventPlayer.mauga_healing_id)
    eventPlayer.mauga_healing_id = null


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
