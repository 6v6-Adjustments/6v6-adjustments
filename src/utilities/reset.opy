#!mainFile "../dev_main.opy"

playervar overhealth_check
playervar balance_change_check
playervar hero_setup
playervar call_init
playervar max_health_scaler

subroutine resetUltCharge
subroutine resetSelfHealing
subroutine resetStats
subroutine disableAllAbilities
subroutine enableAllAbilities


def resetHero():
    @Name "[utilities/reset.opy]: resetHero()"

    clearCustomHp()
    disableAllAbilities()
    resetStats()
    async(resetUltCharge, AsyncBehavior.RESTART)
    resetSelfHealing()
    enableAllAbilities()


#!define initHero()\
    eventPlayer.call_init = true


def enableAllAbilities():
    @Name "[utilities/reset.opy]: enableAllAbilities()"

    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)

    eventPlayer.allowButton(Button.MELEE)
    # eventPlayer.allowButton(Button.JUMP)
    # eventPlayer.allowButton(Button.CROUCH)
    # eventPlayer.allowButton(Button.RELOAD)
    # eventPlayer.allowButton(Button.INTERACT)

    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setUltEnabled(true)

    eventPlayer.setMeleeEnabled(true)
    # eventPlayer.setJumpEnabled(true)
    # eventPlayer.setCrouchEnabled(true)
    # eventPlayer.setReloadEnabled(true)


def disableAllAbilities():
    @Name "[utilities/reset.opy]: disableAllAbilities()"

    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)

    eventPlayer.disallowButton(Button.MELEE)
    # eventPlayer.disallowButton(Button.JUMP)
    # eventPlayer.disallowButton(Button.CROUCH)
    # eventPlayer.disallowButton(Button.RELOAD)
    # eventPlayer.disallowButton(Button.INTERACT)

    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setUltEnabled(false)

    eventPlayer.setMeleeEnabled(false)
    # eventPlayer.setJumpEnabled(false)
    # eventPlayer.setCrouchEnabled(false)
    # eventPlayer.setReloadEnabled(false)


def resetStats():
    @Name "[utilities/reset.opy]: resetStats()"

    setBaseDamage(eventPlayer, 1)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setProjectileSpeed(100)
    # eventPlayer.setProjectileGravity(100)
    setBaseHealing(eventPlayer, 1)
    eventPlayer.setHealingReceived(100)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.setKnockbackDealt(100)
    # eventPlayer.setGravity(100)
    # eventPlayer.setJumpVerticalSpeed(100)
    eventPlayer.setMoveSpeed(100)

    eventPlayer.stopScalingSize()
    # eventPlayer.stopScalingBarriers()
    eventPlayer.max_health_scaler = 1


def resetStatuses():
    @Name "[utilities/reset.opy]: resetStatuses()"

    eventPlayer.clearStatusEffect(Status.ASLEEP)
    eventPlayer.clearStatusEffect(Status.BURNING)
    eventPlayer.clearStatusEffect(Status.FROZEN)
    eventPlayer.clearStatusEffect(Status.HACKED)
    eventPlayer.clearStatusEffect(Status.INVINCIBLE)
    eventPlayer.clearStatusEffect(Status.KNOCKED_DOWN)
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    eventPlayer.clearStatusEffect(Status.ROOTED)
    eventPlayer.clearStatusEffect(Status.STUNNED)
    eventPlayer.clearStatusEffect(Status.UNKILLABLE)


rule "[utilities/reset.opy]: Reinitialize hero on new round":
    @Event eachPlayer
    @Condition isMatchBetweenRounds()

    waitUntil(not isMatchBetweenRounds(), Math.INFINITY)
    resetHero()
    initHero()


# rule "[utilities/reset.opy]: Reinitialize hero on respawn":
#     @Event playerDied

#     waitUntil(eventPlayer.isAlive(), Math.INFINITY)
#     initHero()
