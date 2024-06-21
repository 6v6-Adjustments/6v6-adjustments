#!mainFile "../../dev_main.opy"

#!include "heroes/wreckingball/grapple.opy"
#!include "heroes/wreckingball/shields.opy"
#!include "heroes/wreckingball/piledriver.opy"


rule "[wreckingball/init.opy]: Initialize Wrecking Ball":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.HAMMOND

    setCustomHp(
        ADJ_WRECKING_BALL_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_WRECKING_BALL_HEALTH, 
        ADJ_WRECKING_BALL_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_WRECKING_BALL_ARMOR, 
        0)
    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_WRECKING_BALL_MINEFIELD_DAMAGE/OW2_WRECKING_BALL_MINEFIELD_DAMAGE)

    eventPlayer.call_init = false


rule "[wreckingball/init.opy]: Correct primary fire, fireball, melee damage":
    @Event playerDealtDamage
    @Hero hammond
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_1, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


/*
rule "Correct Adaptive Shields overhealth while outside spawn rooms":
    @Event eachPlayer
    @Hero hammond
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition eventPlayer.overhealth_check == false
    
    damage(eventPlayer, null, 100)
    eventPlayer.overhealth_check = true
    waitUntil(eventPlayer.isUsingAbility2() == false, 99999)
    eventPlayer.overhealth_check = false
*/

/*
rule "Correct Adaptive Shields overhealth while inside spawn rooms":
    @Event eachPlayer
    @Hero hammond
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition eventPlayer.overhealth_check == false
    
    eventPlayer.setHealth(eventPlayer.getMaxHealth() - 100)
    eventPlayer.overhealth_check = true
    waitUntil(eventPlayer.isUsingAbility2() == false, 99999)
    eventPlayer.overhealth_check = false
*/

/*
rule "Enable Adaptive Shields when near enemy players":
    @Event eachPlayer
    @Hero hammond
    @Condition getPlayersInRadius(eventPlayer, 8.9, getOppositeTeam(eventPlayer.getTeam()), LosCheck.OFF) >= 1
    
    eventPlayer.setAbility2Enabled(true)
*/

/*
rule "Disable Adaptive Shields when not near enemy players":
    @Event eachPlayer
    @Hero hammond
    @Condition getPlayersInRadius(eventPlayer, 8.9, getOppositeTeam(eventPlayer.getTeam()), LosCheck.OFF) <= 0
    
    eventPlayer.setAbility2Enabled(false)
*/


/*
rule "(Duplicate) pile cooldown":
*/