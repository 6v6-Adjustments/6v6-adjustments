#!mainFile "../../dev_main.opy"


rule "[passives/damage/damage_passive.opy]: Remove DPS Passive":
    @Event playerTookDamage
    @Condition attacker.getCurrentHero() in getDamageHeroes()
    @Condition attacker != victim
    
    eventPlayer.setHealingReceived(percent(100/(100-OW2_DAMAGE_PASSIVE_HEAL_REDUCTION)))
    wait(0.5)
    wait((OW2_DAMAGE_PASSIVE_DURATION - 0.5), Wait.RESTART_WHEN_TRUE)
    eventPlayer.setHealingReceived(100)
