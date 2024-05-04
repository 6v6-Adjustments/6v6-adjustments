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
    @Condition eventPlayer.isUsingUltimate() == false
    
    damage(victim, attacker, eventDamage * 1.094 - eventDamage)


rule "[reaper/init.opy]: Reduce Death Blossom damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REAPER
    @Condition eventPlayer.isUsingUltimate() == true
    
    eventPlayer.setDamageDealt(91.891)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setDamageDealt(100)
