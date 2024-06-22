#!mainFile "../../dev_main.opy"

#!include "heroes/illari/solar_rifle.opy"


rule "[illari/init.opy]: Initialize Illari":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    
    setCustomHp(ADJ_ILLARI_HEALTH, 0, 0)
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_ILLARI_SUNSTRUCK_DAMAGE/OW2_ILLARI_SUNSTRUCK_DAMAGE)

    eventPlayer.setMaxAmmo(0, ADJ_ILLARI_SOLAR_RIFLE_AMMO)
    eventPlayer.setAmmo(0, ADJ_ILLARI_SOLAR_RIFLE_AMMO)

    eventPlayer.call_init = false


rule "[illari/init.opy]: Correct melee damage":
    @Event playerDealtDamage
    @Hero illari
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[illari/init.opy]: Correct Outburst damage":
    @Event playerDealtDamage
    @Hero illari
    @Condition eventAbility == Button.ABILITY_1

    heal(victim, null, eventDamage - ((ADJ_ILLARI_OUTBURST_DAMAGE/OW2_ILLARI_OUTBURST_DAMAGE) * eventDamage/eventPlayer._base_damage_scalar))


rule "[illari/outburst.opy]: Ignite Outburst victims":
    @Event playerDealtDamage
    @Hero illari
    @Condition eventAbility == Button.ABILITY_1

    victim.setStatusEffect(null, Status.BURNING, ADJ_ILLARI_BURN_DURATION)
    victim.startDoT(attacker, ADJ_ILLARI_BURN_DURATION, ADJ_ILLARI_BURN_TOTAL*(OW2_ILLARI_SUNSTRUCK_DAMAGE/ADJ_ILLARI_SUNSTRUCK_DAMAGE)/ADJ_ILLARI_BURN_DURATION)


rule "[illari/init.opy]: Correct Pylon self healing":
    @Event playerDealtHealing
    @Hero illari
    @Condition healee == healer

    heal(healer, null, eventHealing)
    