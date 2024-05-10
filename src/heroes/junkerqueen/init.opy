#!mainFile "../../dev_main.opy"


rule "[junkerqueen/init.opy]: Junker Queen":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN

    newHero(ADJ_JUNKERQUEEN_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_JUNKERQUEEN_HEALTH, 0, 0)
    removeTankPassive()
    removeRegenPassive()

    eventPlayer.setHealingDealt(74.29)
    eventPlayer.setDamageDealt(87.5)

    eventPlayer.setMaxAmmo(0, 6)
    eventPlayer.setAmmo(0, 6)

    eventPlayer.overhealth_check = false

    eventPlayer.call_init = false


rule "[junkerqueen/init.opy]: Correct Commanding Shout overhealth while outside spawn rooms":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition eventPlayer.overhealth_check == false
    
    damage(eventPlayer, null, 50)
    eventPlayer.overhealth_check = true
    waitUntil(eventPlayer.isUsingAbility1() == false, 99999)
    eventPlayer.overhealth_check = false


# rule "Correct Commanding Shout overhealth while inside spawn rooms":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN
#     @Condition eventPlayer.isUsingAbility1() == true
#     @Condition eventPlayer.isInSpawnRoom() == true
#     @Condition eventPlayer.overhealth_check == false
    
#     eventPlayer.setHealth(eventPlayer.getMaxHealth() - 50)
#     eventPlayer.overhealth_check = true
#     waitUntil(eventPlayer.isUsingAbility1() == false, 99999)
#     eventPlayer.overhealth_check = false


rule "[junkerqueen/init.opy]: Reduce Rampage Damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN
    @Condition eventPlayer.isUsingUltimate() == true
    
    eventPlayer.setDamageDealt(66.777)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setDamageDealt(87.5)
