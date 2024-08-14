#!mainFile "../../dev_main.opy"

#!include "utilities/custom_hp.opy"
#!include "utilities/hero_init.opy"
#!include "heroes/ana/sleep.opy"
#!include "heroes/ana/nade.opy"


def initAna():
    @Name "[ana/init.opy]: initAna()"
    
    setCustomHp(ADJ_ANA_HEALTH, 0, 0)
    setUltCost(ADJ_ANA_ULT_COST)
    removeSelfHealing()

    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_ANA_BIOTIC_GRENADE_DAMAGE/OW2_ANA_BIOTIC_GRENADE_DAMAGE)

    eventPlayer.setMaxAmmo(0, ADJ_ANA_AMMO_COUNT)
    eventPlayer.setAmmo(0, ADJ_ANA_AMMO_COUNT)

    eventPlayer.hero_initialized = true


rule "[ana/init.opy]: Correct Biotic Rifle, Sleep Dart, Melee damage":
    @Event playerDealtDamage
    @Hero ana
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_1, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
