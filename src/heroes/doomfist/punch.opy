#!mainFile "../../dev_main.opy"

playervar punched_victims
playervar wall_impacted_victims


rule "[doomfist/punch.opy]: Initialize rocket punch":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventPlayer.isFiringSecondaryFire()
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)

    eventPlayer.punched_victims = []
    eventPlayer.wall_impacted_victims = []


# DO NOT switch the order of this rule with the next rule
# The order is functionally significant
rule "[doomfist/punch.opy]: Find wall impacted victims":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition victim in attacker.punched_victims
    @Condition victim not in attacker.wall_impacted_victims

    attacker.wall_impacted_victims.append(victim)
    victim.clearStatusEffect(Status.STUNNED)


# DO NOT switch the order of this rule with the previous rule
# The order is functionally significant
rule "[doomfist/punch.opy]: Best Defense for punched victims":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition victim not in attacker.punched_victims

    attacker.punched_victims.append(victim)
    damage(attacker, null, OW2_DOOMFIST_BEST_DEFENSE - ADJ_DOOMFIST_BEST_DEFENSE) # nerf shield gained per punch victim
