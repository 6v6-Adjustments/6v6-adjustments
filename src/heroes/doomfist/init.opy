#!mainFile "../../dev_main.opy"

#!include "heroes/doomfist/punch.opy"
#!include "heroes/doomfist/slam.opy"
#!include "heroes/doomfist/powerblock.opy"


rule "[doomfist/init.opy]: Doomfist":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST

    setCustomHp(ADJ_DOOMFIST_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DOOMFIST_HEALTH, 0, 0)
    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_DOOMFIST_HAND_CANNON_DAMAGE/OW2_DOOMFIST_HAND_CANNON_DAMAGE)

    eventPlayer.call_init = false


rule "[doomfist/init.opy]: Correct Rocket Punch and Meteor Strike damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventAbility in [Button.SECONDARY_FIRE, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
