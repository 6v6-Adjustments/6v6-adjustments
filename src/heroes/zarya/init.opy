#!mainFile "../../dev_main.opy"

#!include "utilities/custom_hp.opy"
#!include "passives/tank/ult_charge.opy"
#!include "utilities/hero_switch.opy"
#!include "passives/tank/knockback.opy"

#!include "heroes/zarya/self_bubble.opy"
#!include "heroes/zarya/ally_bubble.opy"


def initZarya():
    @Name "[zarya/init.opy]: initZarya()"
    
    setCustomHp(
        ADJ_ZARYA_HEALTH,
        0,
        ADJ_ZARYA_SHIELDS_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ZARYA_SHIELDS
    )
    setUltCost(ADJ_ZARYA_ULT_COST)
    removeTankPassive()
    removeSelfHealing()
    initSelfBubble()
    initAllyBubble()

    setBaseDamage(eventPlayer, ADJ_ZARYA_CANNON_DAMAGE_MAX/OW2_ZARYA_CANNON_DAMAGE_MAX)

    eventPlayer.max_health_scaler = (ADJ_ZARYA_BARRIER_HEALTH/OW2_ZARYA_BARRIER_HEALTH)
    eventPlayer.hero_initialized = true


rule "[zarya/init.opy]: Clean up Zarya":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup != Hero.ZARYA

    hideSelfBubbleCD()
    hideAllyBubbleCD()


rule "[zarya/init.opy]: Increase Particle Cannon alternate fire damage":
    @Event playerDealtDamage
    @Hero zarya
    @Condition eventAbility == Button.SECONDARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_ZARYA_PARTICLE_DAMAGE_MIN / OW2_ZARYA_PARTICLE_DAMAGE_MIN) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[zarya/init.opy]: Correct Zarya Melee damage":
    @Event playerDealtDamage
    @Hero zarya
    @Condition eventAbility == Button.MELEE
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
