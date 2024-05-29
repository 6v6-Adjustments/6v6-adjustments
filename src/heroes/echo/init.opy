#!mainFile "../../dev_main.opy"

#!include "heroes/echo/duplicate.opy"

rule "[echo/init.opy]: Echo":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ECHO

    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)

    setCustomHp(ADJ_ECHO_HEALTH, 0, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_ECHO_STICKY_BOMBS_DAMAGE/OW2_ECHO_STICKY_BOMBS_DAMAGE)

    eventPlayer.call_init = false


rule "[echo/init.opy]: Correct Tri-Shot and Echo melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ECHO
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.MELEE]

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
