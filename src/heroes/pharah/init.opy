#!mainFile "../../dev_main.opy"


rule "[pharah/init.opy]: Initialize Pharah":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.PHARAH
    
    setCustomHp(ADJ_PHARAH_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[pharah/init.opy]: Reduce Primary Fire attack speed":
    @Event eachPlayer
    @Hero pharah
    @Condition eventPlayer.isFiringPrimaryFire()
    
    eventPlayer.setPrimaryFireEnabled(false)
    wait(ADJ_PHARAH_ATTACK_RECOVERY)
    eventPlayer.setPrimaryFireEnabled(true)
    if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE): # if the player is holding down primary fire, this is necessary to allow automatic firing
        eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    