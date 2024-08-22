#!mainFile "../../dev_main.opy"


rule "[orisa/javelin.opy]: Increase Javelin direct damage":
    @Event playerDealtDamage
    @Hero orisa
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition eventPlayer.balance_change_check

    eventPlayer.balance_change_check = false
    heal(victim, null, (eventDamage * (ADJ_ORISA_JAVELIN_DIRECT_DAMAGE/OW2_ORISA_JAVELIN_DIRECT_DAMAGE) - eventDamage) * -1)
    wait(2) # arbitrary number chosen to not mistakenly buff wall-stun damage
    eventPlayer.balance_change_check = true
