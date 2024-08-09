#!mainFile "../../dev_main.opy"

#!include "heroes/echo/duplicate.opy"


rule "[echo/init.opy]: Initialize Echo":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ECHO

    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)

    setCustomHp(ADJ_ECHO_HEALTH, 0, 0)
    setUltCost(ADJ_ECHO_ULT_COST)
    removeSelfHealing()

    # setBaseDamage(eventPlayer, ADJ_ECHO_STICKY_BOMBS_DAMAGE/OW2_ECHO_STICKY_BOMBS_DAMAGE)

    eventPlayer.call_init = false


rule "[echo/init.opy]: Correct Focusing Beam damage":
    @Event playerDealtDamage
    @Hero echo
    @Condition eventAbility == Button.ABILITY_2

    damage(victim, attacker, eventDamage * (ADJ_ECHO_FOCUSING_BEAM_DMG / OW2_ECHO_FOCUSING_BEAM_DMG) - eventDamage)
