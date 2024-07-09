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
    setUltCost(ADJ_WRECKING_BALL_ULT_COST)
    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_WRECKING_BALL_MINEFIELD_DAMAGE/OW2_WRECKING_BALL_MINEFIELD_DAMAGE)

    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_WRECKING_BALL_SHIELD_PER_TARGET/OW2_WRECKING_BALL_SHIELD_PER_TARGET)


rule "[wreckingball/init.opy]: Correct primary fire, fireball, melee damage":
    @Event playerDealtDamage
    @Hero hammond
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_1, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
