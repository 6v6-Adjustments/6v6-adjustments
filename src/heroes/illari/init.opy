#!mainFile "../../dev_main.opy"

#!include "heroes/illari/solar_rifle.opy"


rule "[illari/init.opy]: Initialize Illari":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    
    setCustomHp(ADJ_ILLARI_HEALTH, 0, 0)
    setUltCost(ADJ_ILLARI_ULT_COST)
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_ILLARI_SUNSTRUCK_DAMAGE/OW2_ILLARI_SUNSTRUCK_DAMAGE)
    setBaseHealing(eventPlayer, ADJ_ILLARI_PYLON_HEALING/OW2_ILLARI_PYLON_HEALING)

    eventPlayer.setMaxAmmo(0, ADJ_ILLARI_SOLAR_RIFLE_AMMO)
    eventPlayer.setAmmo(0, ADJ_ILLARI_SOLAR_RIFLE_AMMO)

    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_ILLARI_PYLON_HEALTH/OW2_ILLARI_PYLON_HEALTH)


rule "[illari/init.opy]: Correct Outburst and melee damage":
    @Event playerDealtDamage
    @Hero illari
    @Condition eventAbility in [Button.MELEE, Button.ABILITY_1]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[illari/init.opy]: Correct Pylon self healing":
    @Event playerDealtHealing
    @Hero illari
    @Condition healee == healer

    heal(healer, null, eventHealing)
    