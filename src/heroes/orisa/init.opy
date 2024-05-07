#!mainFile "../../dev_main.opy"


rule "[orisa/init.opy]: Orisa":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ORISA
    
    newHero(
        250 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 300, 
        150 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 200, 
        0)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[orisa/init.opy]: Correct Fortify overhealth while outside spawn rooms":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ORISA
    @Condition eventPlayer.isUsingAbility1()
    @Condition not eventPlayer.isInSpawnRoom()
    @Condition not eventPlayer.overhealth_check
    #@Condition eventPlayer.getHealthOfType(Health.ARMOR) >= 0.1
    
    damage(eventPlayer, null, 181.8)
    eventPlayer.overhealth_check = true
    waitUntil(eventPlayer.isUsingAbility1() == false, 99999)
    eventPlayer.overhealth_check = false


# rule "Correct Fortify overhealth while inside spawn rooms":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.ORISA
#     @Condition eventPlayer.isUsingAbility1() == true
#     @Condition eventPlayer.isInSpawnRoom() == true
#     @Condition eventPlayer.overhealth_check == false
    
#     eventPlayer.setHealth(eventPlayer.getMaxHealth() - 100)
#     eventPlayer.overhealth_check = true
#     waitUntil(eventPlayer.isUsingAbility1() == false, 99999)
#     eventPlayer.overhealth_check = false


rule "[orisa/init.opy]: Reduce Terra Surge damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ORISA
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(80)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setDamageDealt(100)
