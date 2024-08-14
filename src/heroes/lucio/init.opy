#!mainFile "../../dev_main.opy"

#!include "heroes/lucio/aura.opy"


def initLucio():
    @Name "[lucio/init.opy]: initLucio()"
    
    setCustomHp(ADJ_LUCIO_HEALTH, 0, 0)
    setUltCost(ADJ_LUCIO_ULT_COST)
    removeSelfHealing()

    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_LUCIO_SOUNDWAVE_DAMAGE/OW2_LUCIO_SOUNDWAVE_DAMAGE)
    eventPlayer.setHealingDealt(100)

    eventPlayer.hero_initialized = true


rule "[lucio/init.opy]: Correct Lucio melee damage":
    @Event playerDealtDamage
    @Hero lucio
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[lucio/init.opy]: Correct Sonic Amplifier damage":
    @Event playerDealtDamage
    @Hero lucio
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_LUCIO_SOUND_GUN_DAMAGE/OW2_LUCIO_SOUND_GUN_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
