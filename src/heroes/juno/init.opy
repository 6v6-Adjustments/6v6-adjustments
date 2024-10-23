#!mainFile "../../dev_main.opy"

#!include "heroes/juno/torpedoes.opy"
#!include "heroes/juno/orbital_ray.opy"

def initJuno():
    @Name "[juno/init.opy]: initJuno()"
    
    setCustomHp(ADJ_JUNO_HEALTH, 0, ADJ_JUNO_SHIELDS)
    setUltCost(ADJ_JUNO_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
        setBaseDamage(eventPlayer, ADJ_JUNO_MEDIGUN_DAMAGE/OW2_JUNO_MEDIGUN_DAMAGE)
        setBaseHealing(eventPlayer, ADJ_JUNO_MEDIGUN_HEALING/OW2_JUNO_MEDIGUN_HEALING)
    #     eventPlayer.disallowButton(Button.ULTIMATE)
    # if eventPlayer.isDummy():
    #     eventPlayer.setHealingDealt(percent(ADJ_JUNO_ORBITAL_RAY_HPS/OW2_JUNO_ORBITAL_RAY_HPS))
    #     eventPlayer.setHealingDealt(5)
    eventPlayer.setMoveSpeed(percent(ADJ_KIRIKO_SPEED/OW2_KIRIKO_SPEED))

    eventPlayer.setAmmo(0, ADJ_JUNO_MEDIGUN_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_JUNO_MEDIGUN_AMMO)
    eventPlayer.hero_initialized = true


rule "[juno/init.opy]: Correct Juno Melee damage":
    @Event playerDealtDamage
    @Hero juno
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
