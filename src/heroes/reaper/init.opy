#!mainFile "../../dev_main.opy"


rule "[reaper/init.opy]: Reaper":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REAPER

    newHero(250, 0, 0)
    removePassiveHealing()

    eventPlayer.ult_change_check = 1.14


rule "[reaper/init.opy]: Increase Hellfire Shotgun damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.REAPER
    @Condition eventAbility == Button.PRIMARY_FIRE
    @Condition not eventPlayer.isUsingUltimate()

    damage(victim, attacker, eventDamage * (ADJ_REAPER_HELLFIRE_SHOTGUNS_DAMAGE/OW2_REAPER_HELLFIRE_SHOTGUNS_DAMAGE) - eventDamage)


rule "[reaper/init.opy]: Reduce Death Blossom damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REAPER
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(percent(ADJ_REAPER_DEATH_BLOSSON_DAMAGE/OW2_REAPER_DEATH_BLOSSON_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(100)
