#!mainFile "../../dev_main.opy"

playervar overload_overhealth


rule "[torbjorn/init.opy]: Initialize Torbjorn":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.TORBJORN

    setCustomHp(ADJ_TORBJORN_HEALTH, ADJ_TORBJORN_ARMOR, 0)
    setUltCost(ADJ_TORBJORN_ULT_COST)
    removeSelfHealing()

    eventPlayer.setAmmo(0, 15)
    eventPlayer.setMaxAmmo(0, 15)

    eventPlayer.overhealth_check = false
    eventPlayer.call_init = false


rule "[torbjorn/init.opy]: Increase Rivet Gun alternate fire ammo cost":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.isFiringSecondaryFire() == true
    
    eventPlayer.setAmmo(0, eventPlayer.getAmmo(0) - 1)


rule "[torbjorn/init.opy]: Increase Overload overhealth":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.addHealthPool(Health.NORMAL, OW2_OVERLOAD_HEALTH - percent(ADJ_TORBJORN_TURRET_HEALTH/OW2_TORBJORN_TURRET_HEALTH), false, true)
    eventPlayer.overload_overhealth = getLastCreatedHealthPool()
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    removeHealthPool(eventPlayer.overload_overhealth)
