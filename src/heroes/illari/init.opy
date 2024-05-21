#!mainFile "../../dev_main.opy"

#!include "heroes/illari/solar_rifle.opy"


rule "[illari/init.opy]: Illari":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    
    setCustomHp(ADJ_ILLARI_HEALTH, 0, 0)
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_ILLARI_SUNSTRUCK_DAMAGE/OW2_ILLARI_SUNSTRUCK_DAMAGE)

    eventPlayer.setMaxAmmo(0, ADJ_ILLARI_SOLAR_RIFLE_AMMO)
    eventPlayer.setAmmo(0, ADJ_ILLARI_SOLAR_RIFLE_AMMO)

    eventPlayer.call_init = false


rule "[illari/init.opy]: Correct Outburst and melee damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    @Condition eventAbility in [Button.MELEE, Button.ABILITY_1]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
