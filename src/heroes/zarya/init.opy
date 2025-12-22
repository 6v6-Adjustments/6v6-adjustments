#!mainFile "../../dev_main.opy"

#!include "../../heroes/zarya/self_bubble.opy"
#!include "../../heroes/zarya/ally_bubble.opy"


def initZarya():
    @Name "[zarya/init.opy]: initZarya()"
    
    setCustomHp(
        ADJ_ZARYA_HEALTH,
        0,
        ADJ_ZARYA_SHIELDS_DUPLICATE if eventPlayer.isDuplicatingAHero() else ADJ_ZARYA_SHIELDS
    )
    setUltCost(ADJ_ZARYA_ULT_COST)

    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_ZARYA_CANNON_DAMAGE_MAX/OW2_ZARYA_CANNON_DAMAGE_MAX)

    eventPlayer.max_health_scaler = (ADJ_ZARYA_BARRIER_HEALTH/OW2_ZARYA_BARRIER_HEALTH)

    initSelfBubble()
    initAllyBubble()

    eventPlayer.hero_initialized = true


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
