#!mainFile "../dev_main.opy"

playervar hero_setup


rule "[utilities/hero_setup.opy]: Check for hero setup":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup != eventPlayer.getCurrentHero()
    @Condition not eventPlayer.isDuplicatingAHero()
    @Condition not isMatchBetweenRounds()
    @Condition eventPlayer.isAlive()
    
    #This wait time may be needed for some gameodes 
    wait(0.024)
    eventPlayer.hero_setup = eventPlayer.getCurrentHero()


# rule "[utilities/hero_setup.opy]: Hero reset on death":
#     @Event playerDied
    
#     waitUntil(eventPlayer.isAlive(), Math.INFINITY)
#     eventPlayer.hero_setup = null


rule "[utilities/hero_setup.opy]: Hero reset after round":
    @Event eachPlayer
    @Condition isMatchBetweenRounds() == true
    
    eventPlayer.hero_setup = null


/*
rule "Hero reset after game starts (needed for gamemodes with no hero select/bots)":
    @Event eachPlayer
    @Condition isInSetup() == true
    
    eventPlayer.hero_setup = -1
*/
