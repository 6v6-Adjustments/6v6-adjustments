#!mainFile "../../dev_main.opy"

#!include "heroes/kiriko/protection_suzu.opy"
#!include "heroes/kiriko/swift_step.opy"


def initKiriko():
    @Name "[kiriko/init.opy]: initKiriko()"

    setCustomHp(ADJ_KIRIKO_HEALTH, 0, 0)
    setUltCost(ADJ_KIRIKO_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
    setBaseDamage(eventPlayer, ADJ_KIRIKO_KUNAI_DAMAGE / OW2_KIRIKO_KUNAI_DAMAGE)
    setBaseHealing(eventPlayer, 0.1)
    eventPlayer.startScalingSize(0.95, true)
    eventPlayer.setMoveSpeed(percent(ADJ_KIRIKO_SPEED/OW2_KIRIKO_SPEED))

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN) 

    eventPlayer.hero_initialized = true
    eventPlayer.suzu_flying = false


rule "[kiriko/init.opy]: Correct Kiriko melee damage":
    @Event playerDealtDamage
    @Hero kiriko
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[kiriko/init.opy]: Correct Kiriko headshot damage":
    @Event playerDealtDamage
    @Hero kiriko
    @Condition eventAbility != Button.MELEE
    @Condition eventWasCriticalHit == true

    damage(victim, attacker, 0.5*eventDamage)


rule "[kiriko/init.opy]: Correct Ofuda healing":
    @Event playerDealtHealing
    @Hero kiriko
    @Condition not eventAbility == Button.ABILITY_2

    heal(healee, healer, eventHealing * (10 * ADJ_KIRIKO_OFUDA_HEALING/OW2_KIRIKO_OFUDA_HEALING) - eventHealing)
