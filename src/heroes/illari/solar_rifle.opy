#!mainFile "../../dev_main.opy"

# Use 1 rule with if/else inside instead of 2 rules for performance
# rule "[illari/solar_rifle.opy]: Correct Solar Rifle damage":
#     @Event playerDealtDamage
#     @Hero illari
#     @Condition eventAbility == Button.PRIMARY_FIRE

#     if eventWasCriticalHit:
#         damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_ILLARI_SOLAR_RIFLE_DAMAGE_CRIT/OW2_ILLARI_SOLAR_RIFLE_DAMAGE_CRIT) - eventDamage)/eventPlayer._base_damage_scalar)
#     else:
#         damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_ILLARI_SOLAR_RIFLE_DAMAGE/OW2_ILLARI_SOLAR_RIFLE_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[illari/solar_rifle.opy]: Correct Solar Rifle healing":
    @Event eachPlayer
    @Hero illari
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)
    
    eventPlayer.setHealingDealt(percent(ADJ_ILLARI_SOLAR_RIFLE_HEALING/OW2_ILLARI_SOLAR_RIFLE_HEALING))
    waitUntil(not eventPlayer.isHoldingButton(Button.SECONDARY_FIRE), Math.INFINITY)
    eventPlayer.setHealingDealt(percent(ADJ_ILLARI_PYLON_HEALING/OW2_ILLARI_PYLON_HEALING))
