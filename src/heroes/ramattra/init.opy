#!mainFile "../../dev_main.opy"

#!include "heroes/ramattra/nemesis_form.opy"


rule "[ramattra/init.opy]: Initialize Ramattra":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    
    setCustomHp(
        ADJ_RAMATTRA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_RAMATTRA_HEALTH,
        0,
        0)
    setUltCost(ADJ_RAMATTRA_ULT_COST)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.startScalingSize(0.94, true)

    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_RAMATTRA_BARRIER_HEALTH/OW2_RAMATTRA_BARRIER_HEALTH)


# rule "[ramattra/init.opy]: Correct Barrier cooldown":
#     @Event eachPlayer
#     @Hero ramattra
#     @Condition eventPlayer.isFiringSecondaryFire()
        
#     waitUntil(not eventPlayer.isFiringSecondaryFire() or eventPlayer.isUsingAbility1(), Math.INFINITY)
#     wait(0.1)
#     eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, OW2_RAMATTRA_VOID_BARRIER_COOLDOWN - 0.1)


# rule "[ramattra/init.opy]: Correct Vortex cooldown":
#     @Event eachPlayer
#     @Hero ramattra
#     @Condition eventPlayer.isUsingAbility2()
        
#     waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
#     wait(0.5)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_2, ADJ_RAMATTRA_VORTEX_COOLDOWN - 0.5)
