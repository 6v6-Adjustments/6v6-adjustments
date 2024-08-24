#!mainFile "../../dev_main.opy"


def initJunkrat():
    @Name "[junkrat/init.opy]: initJunkrat()"

    #Version or the "resetHealth" subroutine that keeps tire at 100 hp
    eventPlayer.removeAllHealthPools()
    wait()
    eventPlayer.setMaxHealth(100.001) # DO NOT REMOVE THIS LINE
    wait() # DO NOT REMOVE THIS LINE
    eventPlayer.setMaxHealth(100)

    eventPlayer.setHealingReceived(0)
    eventPlayer.setHealth(ADJ_JUNKRAT_HEALTH)
    eventPlayer.addHealthPool(Health.NORMAL, 1, true, true)
    eventPlayer.addHealthPool(Health.ARMOR, 1, true, true)
    eventPlayer.addHealthPool(Health.SHIELDS, 1, true, true)
    eventPlayer.removeAllHealthPools()
    #eventPlayer.addHealthPool(Health.NORMAL, 199, true, true)
    heal(eventPlayer, null, 1)

    resetStats()
    resetStatuses()
    enableAllAbilities()

    setUltCost(ADJ_JUNKRAT_ULT_COST)
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
        setBaseDamage(eventPlayer, ADJ_JUNKRAT_CONCUSSION_MINE_MAX_DAMAGE / OW2_JUNKRAT_CONCUSSION_MINE_MAX_DAMAGE)
        eventPlayer.setKnockbackDealt(percent(ADJ_JUNKRAT_FRAG_KNOCKBACK_SCALAR)) # half knockback to greatly reduce displacement from frag launcher

    eventPlayer.hero_initialized = true


rule "[junkrat/init.opy]: Correct Junkrat invalid health": # Sometimes Junkrat can retain 250 HP between rounds
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.JUNKRAT
    @Condition eventPlayer.getMaxHealthOfType(Health.NORMAL) != ADJ_JUNKRAT_HEALTH
    @Condition eventPlayer.hero_initialized

    initJunkrat()


# rule "[junkrat/init.opy]: Reduce Frag Launcher attack speed":
#     @Event eachPlayer
#     @Hero junkrat
#     @Condition eventPlayer.isFiringPrimaryFire()
    
#     eventPlayer.setPrimaryFireEnabled(false)
#     wait(ADJ_PHARAH_ATTACK_RECOVERY)
#     eventPlayer.setPrimaryFireEnabled(true)
#     if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE): # if the player is holding down primary fire, this is necessary to allow automatic firing
#         eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)


rule "[junkrat/init.opy]: Correct Frag Launcher damage":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_JUNKRAT_FRAG_DAMAGE / OW2_JUNKRAT_FRAG_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[junkrat/init.opy]: Correct Junkrat other forms of damage":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
