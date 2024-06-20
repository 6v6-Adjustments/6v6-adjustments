#!mainFile "../../dev_main.opy"


rule "[orisa/javelin.opy]: Increase Javelin direct damage":
    @Event playerDealtDamage
    @Hero orisa
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition eventPlayer.balance_change_check

    eventPlayer.balance_change_check = false
    damage(victim, attacker, eventDamage * (ADJ_ORISA_JAVELIN_DIRECT_DAMAGE/OW2_ORISA_JAVELIN_DIRECT_DAMAGE) - eventDamage)
    waitUntil(eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) <= 0, Math.INFINITY)
    eventPlayer.balance_change_check = true
