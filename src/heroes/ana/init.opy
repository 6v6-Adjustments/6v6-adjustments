#!mainFile "../../dev_main.opy"

#!include "utilities/custom_hp.opy"
#!include "utilities/hero_init.opy"
#!include "heroes/ana/sleep.opy"
#!include "heroes/ana/nade.opy"


def initAna():
    @Name "[ana/init.opy]: initAna()"
    
    setCustomHp(ADJ_ANA_HEALTH, 0, 0)
    setUltCost(ADJ_ANA_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    eventPlayer.hero_initialized = true


rule "[ana/init.opy]: Increase Biotic Rifle damage":
    @Event playerDealtDamage
    @Hero ana
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, eventDamage * (ADJ_ANA_BIOTIC_RIFLE_DAMAGE/OW2_ANA_BIOTIC_RIFLE_DAMAGE) - eventDamage)


rule "[ana/init.opy]: Increase Biotic Rifle healing":
    @Event playerDealtHealing
    @Hero ana
    @Condition eventAbility == Button.PRIMARY_FIRE

    heal(healee, healer, eventHealing * (ADJ_ANA_BIOTIC_RIFLE_HEALING/OW2_ANA_BIOTIC_RIFLE_HEALING) - eventHealing)
