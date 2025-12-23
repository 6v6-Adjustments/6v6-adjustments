#!mainFile "../../dev_main.opy"

# !include "../../heroes/ana/sleep.opy"
#!include "../../heroes/ana/nade.opy"


def initAna():
    @Name "[ana/init.opy]: initAna()"
    
    setCustomHp(ADJ_ANA_HEALTH, 0, 0)
    setUltCost(ADJ_ANA_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
        setBaseDamage(eventPlayer, ADJ_ANA_BIOTIC_GRENADE_DAMAGE/OW2_ANA_BIOTIC_GRENADE_DAMAGE)
        setBaseHealing(eventPlayer, ADJ_ANA_BIOTIC_RIFLE_HEALING/OW2_ANA_BIOTIC_RIFLE_HEALING)

    eventPlayer.setMaxAmmo(0, ADJ_ANA_AMMO_COUNT)
    eventPlayer.setAmmo(0, ADJ_ANA_AMMO_COUNT)

    eventPlayer.hero_initialized = true


rule "[ana/init.opy]: Correct Sleep Dart and Ana Melee damage":
    @Event playerDealtDamage
    @Hero ana
    @Condition eventAbility in [Button.ABILITY_1, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[ana/init.opy]: Correct Sleep Dart and Ana Melee damage":
    @Event playerDealtDamage
    @Hero ana
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_ANA_BIOTIC_RIFLE_DAMAGE/OW2_ANA_BIOTIC_RIFLE_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
