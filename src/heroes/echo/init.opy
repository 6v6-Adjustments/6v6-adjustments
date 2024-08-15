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


rule "[echo/init.opy]: Correct Echo Tri-Shot damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ECHO
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_ECHO_TRISHOT_DAMAGE / OW2_ECHO_TRISHOT_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[echo/init.opy]: Correct Echo other forms of damage":
    @Event playerDealtDamage
    @Hero echo
    @Condition not eventPlayer.isDuplicatingAHero()
    @Condition eventAbility in [Button.ABILITY_2, Button.MELEE]

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
