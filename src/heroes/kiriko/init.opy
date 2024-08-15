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


rule "[kiriko/init.opy]: Reduce Kiriko melee damage":
    @Event playerDealtDamage
    @Hero kiriko
    @Condition eventAbility == Button.MELEE

    heal(victim, null, eventDamage - (eventDamage/eventPlayer._base_damage_scalar))
