#!mainFile "../dev_main.opy"

playervar overhealth_check
playervar balance_change_check

playervar reset_pvar
#!defineMember _reset_complete reset_pvar[0]
#!defineMember _hp_reset reset_pvar[8]
#!defineMember _stat_reset reset_pvar[9]
#!defineMember _status_reset reset_pvar[10]
#!defineMember _frenemy_reset reset_pvar[11]
#!defineMember _ult_charge_reset reset_pvar[12]
#!defineMember _self_healing_reset reset_pvar[13]
#!defineMember _ability_reset reset_pvar[14]

subroutine clearCustomHp
subroutine enableAllAbilities
subroutine disableAllAbilities
subroutine resetStats
subroutine resetStatuses
subroutine resetFrenemies
subroutine resetUltCharge
subroutine resetSelfHealing


macro isResetComplete(player):
    (player._hp_reset \
    and player._stat_reset \
    and player._status_reset \
    and player._ult_charge_reset \
    and player._self_healing_reset \
    and player._ability_reset)


def resetHero():
    @Name "[utilities/reset.opy]: resetHero()"

    async(clearCustomHp, AsyncBehavior.RESTART)
    async(resetStats, AsyncBehavior.RESTART)
    async(resetStatuses, AsyncBehavior.RESTART)
    async(resetUltCharge, AsyncBehavior.RESTART)
    async(resetSelfHealing, AsyncBehavior.RESTART)
    async(enableAllAbilities, AsyncBehavior.RESTART)

    wait() # wait at least 1 tick
    waitUntil(isResetComplete(eventPlayer), Math.INFINITY)

    eventPlayer.hero_initialized = false


def enableAllAbilities():
    @Name "[utilities/reset.opy]: enableAllAbilities()"

    eventPlayer._ability_reset = false

    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)

    eventPlayer.allowButton(Button.MELEE)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.CROUCH)
    eventPlayer.allowButton(Button.RELOAD)
    eventPlayer.allowButton(Button.INTERACT)

    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setUltEnabled(true)

    eventPlayer.setMeleeEnabled(true)
    eventPlayer.setJumpEnabled(true)
    eventPlayer.setCrouchEnabled(true)
    eventPlayer.setReloadEnabled(true)

    eventPlayer._ability_reset = true


def disableAllAbilities():
    @Name "[utilities/reset.opy]: disableAllAbilities()"

    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)

    eventPlayer.disallowButton(Button.MELEE)
    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.disallowButton(Button.CROUCH)
    eventPlayer.disallowButton(Button.RELOAD)
    eventPlayer.disallowButton(Button.INTERACT)

    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setUltEnabled(false)

    eventPlayer.setMeleeEnabled(false)
    eventPlayer.setJumpEnabled(false)
    eventPlayer.setCrouchEnabled(false)
    eventPlayer.setReloadEnabled(false)


def resetStats():
    @Name "[utilities/reset.opy]: resetStats()"

    eventPlayer._stat_reset = false

    setBaseDamage(eventPlayer, 1)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setProjectileSpeed(100)
    eventPlayer.setProjectileGravity(100)
    setBaseHealing(eventPlayer, 1)
    eventPlayer.setHealingReceived(100)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.setKnockbackDealt(100)
    # eventPlayer.setGravity(100)
    # eventPlayer.setJumpVerticalSpeed(100) # might be responsible for jump bug
    setCurrentSpeed(eventPlayer, 1)

    eventPlayer.stopScalingSize()
    eventPlayer.stopScalingBarriers()
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE) # prevent wholehog from keeping primary fire held
    eventPlayer.stopAllDoT()
    eventPlayer.stopAllHoT()

    eventPlayer._stat_reset = true


def resetStatuses():
    @Name "[utilities/reset.opy]: resetStatuses()"

    eventPlayer._status_reset = false

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

    eventPlayer._status_reset = true


rule "[utilities/reset.opy]: Stop DoT/HoT on death":
    @Event playerDied

    eventPlayer.stopAllDoT()
    eventPlayer.stopAllHoT()
    