#!mainFile "../../dev_main.opy"

#!include "heroes/kiriko/protection_suzu.opy"
#!include "heroes/kiriko/swift_step.opy"


rule "[kiriko/init.opy]: Initialize Kiriko":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.KIRIKO

    setCustomHp(ADJ_KIRIKO_HEALTH, 0, 0)
    setUltCost(ADJ_KIRIKO_ULT_COST)
    removeSelfHealing()

    # eventPlayer.setAmmo(1, ADJ_KIRIKO_KUNAI_COUNT)
    # eventPlayer.setMaxAmmo(1, ADJ_KIRIKO_KUNAI_COUNT)
    setBaseDamage(eventPlayer, ADJ_KIRIKO_KUNAI_DAMAGE / OW2_KIRIKO_KUNAI_DAMAGE)

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN)

    eventPlayer.call_init = false


rule "[kiriko/init.opy]: Reduce Kiriko melee damage":
    @Event playerDealtDamage
    @Hero kiriko
    @Condition eventAbility == Button.MELEE

    heal(victim, null, eventDamage - (eventDamage/eventPlayer._base_damage_scalar))
