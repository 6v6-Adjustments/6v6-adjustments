#!mainFile "../../dev_main.opy"

#!include "heroes/roadhog/breather.opy"
#!include "heroes/roadhog/wholehog.opy"


rule "[roadhog/init.opy]: Roadhog":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    
    setCustomHp(
        ADJ_ROADHOG_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ROADHOG_HEALTH,
        0,
        0)
    removeTankPassive()
    removeSelfHealing()
    
    setBaseDamage(eventPlayer, ADJ_ROADHOG_SCRAP_GUN_DAMAGE/OW2_ROADHOG_SCRAP_GUN_DAMAGE)
    eventPlayer.setHealingDealt(percent(ADJ_ROADHOG_BREATHER_HEAL_TOTAL/OW2_ROADHOG_BREATHER_HEAL_TOTAL))

    eventPlayer.setAmmo(0, 5)
    eventPlayer.setMaxAmmo(0, 5)

    eventPlayer.call_init = false


rule "[roadhog/init.opy]: Correct melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[roadhog/init.opy]: Correct Chain Hook damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventAbility == Button.ABILITY_1

    damage(
        victim, 
        attacker, 
        ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_ROADHOG_HOOK_DAMAGE/OW2_ROADHOG_HOOK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[roadhog/init.opy]: Correct Pigpen damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventAbility == Button.ABILITY_2
    @Condition not eventPlayer.isUsingUltimate()

    damage(
        victim, 
        attacker, 
        ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_ROADHOG_PIGPEN_DAMAGE/OW2_ROADHOG_PIGPEN_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
