#!mainFile "../../dev_main.opy"

playervar punched_victims
playervar wall_impacted_victims


rule "[doomfist/punch.opy]: Initialize rocket punch":
    @Event eachPlayer
    @Hero doomfist
    @Condition eventPlayer.isFiringSecondaryFire()
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)

    eventPlayer.punched_victims = []
    eventPlayer.wall_impacted_victims = []


# DO NOT switch the order of this rule with the next rule
# The order is functionally significant
rule "[doomfist/punch.opy]: Find wall impacted victims":
    @Event playerDealtDamage
    @Hero doomfist
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition victim in attacker.punched_victims
    @Condition victim not in attacker.wall_impacted_victims

    attacker.wall_impacted_victims.append(victim)
    if (len(attacker.punched_victims) == 1): # OW1 single punch victim
        damage(victim, attacker, eventDamage * ADJ_DOOMFIST_ROCKET_PUNCH_PRIMARY_TARGET_MULTIPLIER)
    victim.clearStatusEffect(Status.STUNNED)


# DO NOT switch the order of this rule with the previous rule
# The order is functionally significant
rule "[doomfist/punch.opy]: Find punched victims":
    @Event playerDealtDamage
    @Hero doomfist
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition victim not in attacker.punched_victims

    attacker.punched_victims.append(victim)
    if (len(attacker.punched_victims) == 1): # OW1 single punch victim
        damage(victim, attacker, eventDamage * ADJ_DOOMFIST_ROCKET_PUNCH_PRIMARY_TARGET_MULTIPLIER)
    damage(attacker, null, OW2_DOOMFIST_BEST_DEFENSE - ADJ_DOOMFIST_BEST_DEFENSE) # nerf shield gained per punch victim
