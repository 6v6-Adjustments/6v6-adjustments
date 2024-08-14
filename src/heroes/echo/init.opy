#!mainFile "../../dev_main.opy"

#!include "heroes/echo/duplicate.opy"


def initEcho():
    @Name "[echo/init.opy]: initEcho()"

    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)

    setCustomHp(ADJ_ECHO_HEALTH, 0, 0)
    setUltCost(ADJ_ECHO_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_ECHO_STICKY_BOMBS_DAMAGE/OW2_ECHO_STICKY_BOMBS_DAMAGE)

    eventPlayer.hero_initialized = true


rule "[echo/init.opy]: Correct Echo other forms of damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ECHO
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_2, Button.MELEE]

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
