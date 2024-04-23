#!mainFile "../../dev_main.opy"

#!include "heroes/doomfist/punch.opy"


rule "Doomfist":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    
    eventPlayer.ult_change_check = 0.97
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(100)
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 399 if not eventPlayer.isDuplicatingAHero() or FULL_ECHO_TANK_HP else 349, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    removeTankPassive()
    eventPlayer.setHealingDealt(0)
    eventPlayer.setKnockbackDealt(80)
    eventPlayer.setDamageDealt(90)
    
    removeSelfHealing()


rule "Increase Doomfist melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventAbility == Button.MELEE
    
    damage(victim, attacker, eventDamage * 1.128 - eventDamage)


rule "Increase Rocket Punch damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventAbility == Button.SECONDARY_FIRE
    
    damage(victim, attacker, eventDamage * 1.128 - eventDamage)


rule "Increase Meteor Strike damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventAbility == Button.ULTIMATE
    
    damage(victim, attacker, eventDamage * 1.126 - eventDamage)