#!mainFile "../../dev_main.opy"

#!include "heroes/ana/nade.opy"

rule "[ana/init.opy]: Ana":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ANA
    
    newHero(ADJ_ANA_HEALTH, 0, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_ANA_BIOTIC_GRENADE_DAMAGE/OW2_ANA_BIOTIC_GRENADE_DAMAGE)

    eventPlayer.setMaxAmmo(0, 12)
    eventPlayer.setAmmo(0, 12)

    eventPlayer.ult_change_check = 1.06


rule "[ana/init.opy]: Correct Biotic Rifle, Sleep Dart, Melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ANA
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_1, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
