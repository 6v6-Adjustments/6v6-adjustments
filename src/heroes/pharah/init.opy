#!mainFile "../../dev_main.opy"


def initPharah():
    @Name "[pharah/init.opy]: initPharah()"
    
    setCustomHp(ADJ_PHARAH_HEALTH, 0, 0)
    setUltCost(ADJ_PHARAH_ULT_COST)
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    eventPlayer.hero_initialized = true


rule "[pharah/init.opy]: Reduce Primary Fire attack speed":
    @Event eachPlayer
    @Hero pharah
    @Condition eventPlayer.isFiringPrimaryFire()
    
    eventPlayer.setPrimaryFireEnabled(false)
    wait(ADJ_PHARAH_ATTACK_RECOVERY)
    eventPlayer.setPrimaryFireEnabled(true)
    if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE): # if the player is holding down primary fire, this is necessary to allow automatic firing
        eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    