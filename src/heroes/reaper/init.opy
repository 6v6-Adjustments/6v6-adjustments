#!mainFile "../../dev_main.opy"


rule "[reaper/init.opy]: Initialize Reaper":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.REAPER

    setCustomHp(ADJ_REAPER_HEALTH, 0, 0)
    setUltCost(ADJ_REAPER_ULT_COST)
    removeRegenPassive()

    eventPlayer.setHealingDealt(percent(ADJ_REAPER_LIFESTEAL_PERCENT / OW2_REAPER_LIFESTEAL_PERCENT))

    eventPlayer.call_init = false


rule "[reaper/init.opy]: Increase Hellfire Shotgun damage":
    @Event playerDealtDamage
    @Hero reaper
    @Condition eventAbility == Button.PRIMARY_FIRE
    @Condition not eventPlayer.isUsingUltimate()

    damage(victim, attacker, eventDamage * (ADJ_REAPER_HELLFIRE_SHOTGUNS_DAMAGE/OW2_REAPER_HELLFIRE_SHOTGUNS_DAMAGE) - eventDamage)


rule "[reaper/init.opy]: Reduce Death Blossom damage":
    @Event eachPlayer
    @Hero reaper
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(percent(ADJ_REAPER_DEATH_BLOSSON_DAMAGE/OW2_REAPER_DEATH_BLOSSON_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(100)
