#!mainFile "../../dev_main.opy"

#!include "heroes/doomfist/punch.opy"
#!include "heroes/doomfist/slam.opy"


rule "[doomfist/init.opy]: Doomfist":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    
    eventPlayer.ult_change_check = 0.97
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(100)
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 349 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 399, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_DOOMFIST_HAND_CANNON_DAMAGE/OW2_DOOMFIST_HAND_CANNON_DAMAGE)


rule "[doomfist/init.opy]: Correct Rocket Punch and Meteor Strike damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventAbility in [Button.SECONDARY_FIRE, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
