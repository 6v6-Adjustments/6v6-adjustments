#!mainFile "../../dev_main.opy"

#!include "utilities/macro_functions.opy"
#!include "passives/support/self_heal.opy"


rule "[baptiste/regen_burst.opy]: Remove initial burst healing from Regenerative Burst":
    @Event eachPlayer
    @Hero baptiste
    @Condition eventPlayer.isUsingAbility1()

    eventPlayer.setHealingDealt(0)
    waitUntil(eventPlayer.isUsingAbility1() == false, Math.INFINITY)
    eventPlayer.setHealingDealt(percent(eventPlayer._base_healing_scalar))


rule "[baptiste/regen_burst.opy]: Allow self healing during regenerative burst":
    @Event eachPlayer
    @Hero baptiste
    @Condition eventPlayer.isUsingAbility1()

    pushSelfHealing(Button.ABILITY_1)
    wait(ADJ_BAPTISTE_REGEN_BURST_DURATION, Wait.RESTART_WHEN_TRUE)
    popSelfHealing(Button.ABILITY_1)


rule "[baptiste/regen_burst.opy]: Correct regenerative burst hps":
    @Event playerDealtHealing
    @Hero baptiste
    @Condition eventAbility == Button.ABILITY_1
    
    if healee == healer: # self healing
        heal(
            healee, 
            healer, 
            ((eventHealing/eventPlayer._base_healing_scalar)*(ADJ_BAPTISTE_REGEN_BURST_SELF_HPS/OW2_BAPTISTE_REGEN_BURST_SELF_HPS) - eventHealing))
    else: # ally healing
        heal(
            healee, 
            healer, 
            ((eventHealing/eventPlayer._base_healing_scalar)*(ADJ_BAPTISTE_REGEN_BURST_ALLY_HPS/OW2_BAPTISTE_REGEN_BURST_ALLY_HPS) - eventHealing))
