#!mainFile "../../dev_main.opy"


rule "[torbjorn/init.opy]: Torbjorn":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.TORBJORN

    newHero(ADJ_TORBJORN_HEALTH, ADJ_TORBJORN_ARMOR, 0)
    removeSelfHealing()

    eventPlayer.setAmmo(0, 15)
    eventPlayer.setMaxAmmo(0, 15)

    eventPlayer.overhealth_check = false
    eventPlayer.call_init = false


rule "[torbjorn/init.opy]: Increase Rivet Gun alternate fire ammo cost":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.TORBJORN
    @Condition eventPlayer.isFiringSecondaryFire() == true
    
    eventPlayer.setAmmo(0, eventPlayer.getAmmo(0) - 1)


# rule "Correct Overload overhealth while outside spawn rooms":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.TORBJORN
#     @Condition eventPlayer.isUsingAbility2() == true
#     @Condition eventPlayer.isInSpawnRoom() == false
#     @Condition eventPlayer.overhealth_check == false
    
#     damage(eventPlayer, null, 12)
#     eventPlayer.overhealth_check = true
#     waitUntil(eventPlayer.isUsingAbility2() == false, 99999)
#     eventPlayer.overhealth_check = false


# rule "Correct Overload overhealth while inside spawn rooms":
#     @Event eachPlayer
#     @Condition eventPlayer.hero_setup == Hero.TORBJORN
#     @Condition eventPlayer.isUsingAbility2() == true
#     @Condition eventPlayer.isInSpawnRoom() == true
#     @Condition eventPlayer.overhealth_check == false
    
#     eventPlayer.setHealth(eventPlayer.getMaxHealth() - 12)
#     eventPlayer.overhealth_check = true
#     waitUntil(eventPlayer.isUsingAbility2() == false, 99999)
#     eventPlayer.overhealth_check = false
