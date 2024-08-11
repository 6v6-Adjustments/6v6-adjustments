#!mainFile "../../dev_main.opy"

#!include "heroes/ramattra/nemesis_form.opy"


def initRamattra():
    @Name "[ramattra/init.opy]: initRamattra()"
    
    setCustomHp(
        ADJ_RAMATTRA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_RAMATTRA_HEALTH,
        0,
        0)
    setUltCost(ADJ_RAMATTRA_ULT_COST)
    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_RAMATTRA_ACCELERATOR_DAMAGE/OW2_RAMATTRA_ACCELERATOR_DAMAGE)

    eventPlayer.startScalingSize(0.94, true)

    eventPlayer.max_health_scaler = (ADJ_RAMATTRA_BARRIER_HEALTH/OW2_RAMATTRA_BARRIER_HEALTH)

    eventPlayer.hero_initialized = true


rule "[ramattra/init.opy]: Reduce Ramattra melee damage":
    @Event playerDealtDamage
    @Hero ramattra
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == false
    
    heal(victim, null, eventDamage - (eventDamage/eventPlayer._base_damage_scalar))
