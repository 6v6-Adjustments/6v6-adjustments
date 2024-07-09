#!mainFile "../../dev_main.opy"

#!include "heroes/ana/nade.opy"

rule "[ana/init.opy]: Initialize Ana":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ANA
    
    setCustomHp(ADJ_ANA_HEALTH, 0, 0)
    setUltCost(ADJ_ANA_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_ANA_BIOTIC_GRENADE_DAMAGE/OW2_ANA_BIOTIC_GRENADE_DAMAGE)

    eventPlayer.setMaxAmmo(0, ADJ_ANA_AMMO_COUNT)
    eventPlayer.setAmmo(0, ADJ_ANA_AMMO_COUNT)

    eventPlayer.call_init = false


rule "[ana/init.opy]: Correct Biotic Rifle, Sleep Dart, Melee damage":
    @Event playerDealtDamage
    @Hero ana
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_1, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
