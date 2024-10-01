#!mainFile "../../dev_main.opy"
# Junkrat has a few assorted damage rules combined into one file (hence the weird title)

rule "[junkrat/mayhem.opy]: Correct Frag Launcher damage":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition eventAbility == Button.PRIMARY_FIRE

    # damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_JUNKRAT_FRAG_DAMAGE/OW2_JUNKRAT_FRAG_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    heal(victim, null, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_JUNKRAT_FRAG_DAMAGE/OW2_JUNKRAT_FRAG_DAMAGE) - eventDamage) * -1)


rule "[junkrat/mayhem.opy]: Correct Junkrat Melee damage":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[junkrat/mayhem.opy]: Correct Junkrat Trap damage":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition eventAbility == Button.ABILITY_2

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_JUNKRAT_STEEL_TRAP_DMG/OW2_JUNKRAT_STEEL_TRAP_DMG) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[junkrat/mayhem.opy]: Reset damage for Rip-Tire": # Rip-Tire damage is set as soon as the entity is created, this setup allows workshop logic to reset damage before the tire is spawned
    @Event eachPlayer
    @Hero junkrat
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE)
    @Condition eventPlayer.isOnGround()
    @Condition eventPlayer.getUltCharge() >= 100
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.allowButton(Button.ULTIMATE)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    eventPlayer.disallowButton(Button.ULTIMATE)
    wait(1)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar)) # revert damage back after Rip-Tire is deployed
