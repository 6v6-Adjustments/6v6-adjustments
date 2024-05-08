#!mainFile "../../dev_main.opy"

#!include "heroes/lucio/aura.opy"


rule "[lucio/init.opy]: Lucio":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.LUCIO
    
    newHero(ADJ_LUCIO_HEALTH, 0, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_LUCIO_SOUNDWAVE_DAMAGE/OW2_LUCIO_SOUNDWAVE_DAMAGE)
    eventPlayer.setHealingDealt(100)
    eventPlayer.setKnockbackDealt(89.286)

    eventPlayer.call_init = false


rule "[lucio/init.opy]: Correct Lucio melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.LUCIO
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[lucio/init.opy]: Correct Sonic Amplifier damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.LUCIO
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_LUCIO_SOUND_GUN_DAMAGE/OW2_LUCIO_SOUND_GUN_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
