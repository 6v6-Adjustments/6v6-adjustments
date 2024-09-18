#!mainFile "../../dev_main.opy"

globalvar orbitalray_dummy_id


def initJuno():
    @Name "[juno/init.opy]: initJuno()"
    
    setCustomHp(ADJ_JUNO_HEALTH, 0, ADJ_JUNO_SHIELDS)
    setUltCost(ADJ_JUNO_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
        # eventPlayer.disallowButton(Button.ULTIMATE)
    # if eventPlayer.isDummy():
        # eventPlayer.setHealingDealt(percent(ADJ_JUNO_ORBITAL_RAY_HPS/OW2_JUNO_ORBITAL_RAY_HPS))
        eventPlayer.setHealingDealt(5)

    eventPlayer.hero_initialized = true


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
#     # orbitalray_dummy_id.setHealingDealt(percent(ADJ_JUNO_ORBITAL_RAY_HPS/OW2_JUNO_ORBITAL_RAY_HPS))
#     # orbitalray_dummy_id.setHealingDealt(5)
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
