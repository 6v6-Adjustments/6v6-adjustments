#!mainFile "../../dev_main.opy"


rule "[passives/damage/damage_passive.opy]: Remove DPS Passive":
    @Team 1
    @Event playerTookDamage
    @Condition attacker.getCurrentHero() in getDamageHeroes()
    @Condition attacker != victim

    
    eventPlayer.setHealingReceived(percent(100/(100-OW2_DAMAGE_PASSIVE_HEAL_REDUCTION)))
    wait(OW2_DAMAGE_PASSIVE_DURATION, Wait.RESTART_WHEN_TRUE)
    eventPlayer.setHealingReceived(100)
