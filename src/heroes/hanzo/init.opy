#!mainFile "../../dev_main.opy"


rule "[hanzo/init.opy]: Initialize Hanzo":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.HANZO
    
    setCustomHp(ADJ_HANZO_HEALTH, 0, 0)
    setUltCost(ADJ_HANZO_ULT_COST)
    removeSelfHealing()

    # setBaseDamage(eventPlayer, ADJ_HANZO_STORM_DAMAGE/OW2_HANZO_STORM_DAMAGE)

    eventPlayer.call_init = false


# rule "[hanzo/init.opy]: Correct Hanzo melee damage":
#     @Event playerDealtDamage
#     @Hero hanzo
#     @Condition eventAbility == Button.MELEE

#     damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


# rule "[hanzo/init.opy]: Correct Storm Bow, Sonic Arrow damage":
#     @Event playerDealtDamage
#     @Hero hanzo
#     @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_1]

#     damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_HANZO_ARROW_DAMAGE / OW2_HANZO_ARROW_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[genji/init.opy]: Correct Storm Arrow damage":
    @Event playerDealtDamage
    @Hero hanzo
    @Condition eventAbility == Button.ABILITY_2

    damage(victim, attacker, eventDamage * (ADJ_HANZO_STORM_DAMAGE / OW2_HANZO_STORM_DAMAGE) - eventDamage)