#!mainFile "../../dev_main.opy"


rule "Sombra":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.SOMBRA
    
    eventPlayer.ult_change_check = 1.14
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(100)
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 199, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()

    removeSelfHealing()
    eventPlayer._self_healing_percent = 0.1 # set self healing to 0.1% such that 75hp healthpack becomes 0.075hp


rule "hacked health packs":
    @Event playerReceivedHealing
    @Condition eventPlayer.hero_setup == Hero.SOMBRA
    @Condition eventWasHealthPack == true
    
    heal(eventPlayer, eventPlayer, eventHealing/unpercent(eventPlayer._self_healing_percent) - eventHealing)
 