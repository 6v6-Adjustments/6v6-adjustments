#!mainFile "../../dev_main.opy"


def initReaper():
    @Name "[reaper/init.opy]: initReaper()"

    setCustomHp(ADJ_REAPER_HEALTH, 0, 0)
    setUltCost(ADJ_REAPER_ULT_COST)
    removeOW2RegenPassive()

    setBaseDamage(eventPlayer, ADJ_REAPER_HELLFIRE_SHOTGUNS_DAMAGE / OW2_REAPER_HELLFIRE_SHOTGUNS_DAMAGE)
    setBaseHealing(eventPlayer, ADJ_REAPER_LIFESTEAL_PERCENT / OW2_REAPER_LIFESTEAL_PERCENT)

    eventPlayer.hero_initialized = true


rule "[reaper/init.opy]: Increase Reaper melee damage":
    @Event playerDealtDamage
    @Hero reaper
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[reaper/init.opy]: Reduce Death Blossom damage":
    @Event eachPlayer
    @Hero reaper
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(percent(ADJ_REAPER_DEATH_BLOSSON_DAMAGE/OW2_REAPER_DEATH_BLOSSON_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(ADJ_REAPER_HELLFIRE_SHOTGUNS_DAMAGE / OW2_REAPER_HELLFIRE_SHOTGUNS_DAMAGE))
