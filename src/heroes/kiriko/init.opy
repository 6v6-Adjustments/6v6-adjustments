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

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN) 

    eventPlayer.hero_initialized = true
    eventPlayer.suzu_flying = false


rule "[kiriko/init.opy]: Correct Kiriko melee damage":
    @Event playerDealtDamage
    @Hero kiriko
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


# rule "[kiriko/init.opy]: Correct Ofuda healing":
#     @Event playerDealtHealing
#     @Hero kiriko
#     # @Condition eventHealing >= 10
#     @Condition not eventAbility == Button.ABILITY_2

#     heal(healee, healer, eventHealing * (ADJ_KIRIKO_OFUDA_HEALING/OW2_KIRIKO_OFUDA_HEALING) - eventHealing)
