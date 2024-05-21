#!mainFile "../../dev_main.opy"


rule "[sombra/init.opy]: Sombra":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SOMBRA

    setCustomHp(ADJ_SOMBRA_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer._self_healing_percent = 0.1 # set self healing to 0.1% such that 75hp healthpack becomes 0.075hp
    eventPlayer.call_init = false


rule "[sombra/init.opy]: hacked health packs":
    @Team 1
    @Event playerReceivedHealing
    @Condition eventPlayer.hero_setup == Hero.SOMBRA
    @Condition eventWasHealthPack == true
    
    heal(eventPlayer, eventPlayer, eventHealing/unpercent(eventPlayer._self_healing_percent) - eventHealing)
 