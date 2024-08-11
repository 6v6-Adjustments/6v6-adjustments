#!mainFile "../../dev_main.opy"

# globalvar health_pool

# playervar hp_before_duplicate


#!include "utilities/hero_reset.opy"
#!include "utilities/hero_init.opy"


# rule "[echo/duplicate.opy]: Remember hp before duplicate":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.isHoldingButton(Button.ULTIMATE)

#     eventPlayer.hp_before_duplicate = eventPlayer.getHealth()


rule "[echo/duplicate.opy]: Override hero setup during duplicate":
    @Event eachPlayer
    @Hero echo
    @Condition eventPlayer.isDuplicatingAHero()
    
    eventPlayer.hero_setup = eventPlayer.getHeroOfDuplication()
    resetHero()
    initHero()


rule "[echo/duplicate.opy]: Revert hero setup when exiting Duplicate":
    @Event eachPlayer
    @Hero echo
    @Condition not eventPlayer.isDuplicatingAHero()

    eventPlayer.hero_setup = eventPlayer.getCurrentHero()
    resetHero()
    initHero()

    # waitUntil(not eventPlayer.call_init, Math.INFINITY)
    # damage(eventPlayer, null, ADJ_ECHO_HEALTH - max(eventPlayer.hp_before_duplicate, ADJ_ECHO_DUPLICATE_EXIT_HEALTH))


rule "[echo/duplicate.opy]: Death in Duplicate":
    @Event playerDied
    @Hero echo
    @Condition eventPlayer.getUltCharge() <= 4 # this is how we have to check if this was a duplicate death, isDuplicatingAHero won't be helpful because it returns false before we can run any actions

    waitUntil(eventPlayer.isInSpawnRoom() == true, Math.INFINITY)
    eventPlayer.hero_setup = eventPlayer.getCurrentHero()
    wait(0.64)
    resetHero()
    wait(0.64)
    initHero()


rule "[echo/duplicate.opy]: Force Reset Incorrect Echo Setup":
    @Event eachPlayer
    @Hero echo
    @Condition eventPlayer.getMaxHealth() == 499

    resetHero()
    initHero()


rule "[echo/duplicate.opy]: Correct duplicate ultimate charge rate":
    @Event eachPlayer
    @Hero echo
    @Condition eventPlayer.isDuplicatingAHero()
    @Condition eventPlayer.getUltCharge() == 0

    wait()
    eventPlayer.setUltCharge(max((percent(1 - (OW2_ECHO_DUPLICATE_ULT_CHARGE_MULTIPLIER/ADJ_ECHO_DUPLICATE_ULT_CHARGE_MULTIPLIER)))/OW2_ECHO_DUPLICATE_ULT_CHARGE_MULTIPLIER, 0))
