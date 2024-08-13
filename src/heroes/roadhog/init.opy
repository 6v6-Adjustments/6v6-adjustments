#!mainFile "../../dev_main.opy"

#!include "heroes/roadhog/breather.opy"
#!include "heroes/roadhog/wholehog.opy"


def initRoadhog():
    @Name "[roadhog/init.opy]: initRoadhog()"
    
    setCustomHp(
        ADJ_ROADHOG_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ROADHOG_HEALTH,
        0,
        0)
    setUltCost(ADJ_ROADHOG_ULT_COST)
    removeTankPassive()
    removeSelfHealing()
    
    setBaseDamage(eventPlayer, ADJ_ROADHOG_SCRAP_GUN_DAMAGE/OW2_ROADHOG_SCRAP_GUN_DAMAGE)
    eventPlayer.setHealingDealt(percent(ADJ_ROADHOG_BREATHER_HEAL_TOTAL/OW2_ROADHOG_BREATHER_HEAL_TOTAL))

    eventPlayer.setAmmo(0, 5)
    eventPlayer.setMaxAmmo(0, 5)

    eventPlayer.hero_initialized = true


# rule "[roadhog/init.opy]: Clean up Roadhog":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup != Hero.ROADHOG

#     hideBreatherCD()


rule "[roadhog/init.opy]: Correct melee damage":
    @Event playerDealtDamage
    @Hero roadhog
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[roadhog/init.opy]: Correct Chain Hook damage":
    @Event playerDealtDamage
    @Hero roadhog
    @Condition eventAbility == Button.ABILITY_1

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_ROADHOG_HOOK_DAMAGE/OW2_ROADHOG_HOOK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[roadhog/init.opy]: Correct Pigpen damage":
    @Event playerDealtDamage
    @Hero roadhog
    @Condition eventAbility == Button.ABILITY_2
    @Condition not eventPlayer.isUsingUltimate()

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_ROADHOG_PIGPEN_DAMAGE/OW2_ROADHOG_PIGPEN_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
