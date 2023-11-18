#!mainFile "../../../main.opy"


rule "[illari/init.opy]: Initialize Illari":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ILLARI)
    @Condition eventPlayer.call_init
    
    resetHero()
    # removeSelfHealing()
    eventPlayer.call_init = false


rule "[illari.opy]: Allow self healing during Pylon":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ILLARI)
    @Condition eventPlayer.isUsingAbility2()

    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    popSelfHealing(Button.ABILITY_2)
