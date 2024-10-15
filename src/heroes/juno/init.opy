#!mainFile "../../dev_main.opy"

#!include "heroes/juno/torpedoes.opy"

# globalvar orbitalray_dummy_id


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


# rule "[juno/init.opy]: Spawn dummy for Orbital Ray":
#     @Event eachPlayer
#     @Hero juno
#     @Condition eventPlayer.isHoldingButton(Button.ULTIMATE)
#     @Condition eventPlayer.getUltCharge() >= 100
#     @Condition not eventPlayer.isDummy()
#     @Condition eventPlayer.isAlive()
#     @Condition not eventPlayer.hasStatusEffect(Status.ASLEEP)
#     @Condition not eventPlayer.hasStatusEffect(Status.FROZEN)
#     @Condition not eventPlayer.hasStatusEffect(Status.KNOCKED_DOWN)
#     @Condition not eventPlayer.hasStatusEffect(Status.STUNNED)

#     createDummy(Hero.JUNO, eventPlayer.getTeam(), 7, eventPlayer.getPosition() + 1 * angleToDirection(eventPlayer.getHorizontalFacingAngle(), 180), eventPlayer.getFacingDirection())
#     orbitalray_dummy_id = getLastCreatedEntity()
#     orbitalray_dummy_id.setStatusEffect(null, Status.PHASED_OUT, Math.INFINITY)
#     wait(0.1)
#     eventPlayer.setUltCharge(0)
#     orbitalray_dummy_id.allowButton(Button.ULTIMATE)
#     orbitalray_dummy_id.setUltCharge(100)
#     orbitalray_dummy_id.forceButtonPress(Button.ULTIMATE)
#     wait(0.5)
#     orbitalray_dummy_id.teleport(vect(0, 1000, 0))
#     orbitalray_dummy_id.setGravity(0)
#     wait(OW2_JUNO_ORBITAL_RAY_DURATION - 0.15)
#     destroyDummy(eventPlayer.getTeam(), 7)
