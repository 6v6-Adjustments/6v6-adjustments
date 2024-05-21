#!mainFile "../../dev_main.opy"

#!include "heroes/echo/duplicate.opy"

rule "[echo/init.opy]: Echo":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ECHO
    
    eventPlayer.removeAllHealthPools()
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.setMaxHealth(100)

    setCustomHp(ADJ_ECHO_HEALTH, 0, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_ECHO_STICKY_BOMBS_DAMAGE/OW2_ECHO_STICKY_BOMBS_DAMAGE)

    eventPlayer.call_init = false


rule "[echo/init.opy]: Correct Tri-Shot and Echo melee damage":
    @Event playerDealtDamage
    @Team 1
    @Condition eventPlayer.hero_setup == Hero.ECHO
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.MELEE]

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


# rule "(Duplicate) Seismic Slam cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.DOOMFIST
#     @Condition eventPlayer.isUsingAbility1() == true
    
#     waitUntil(not eventPlayer.isUsingAbility1(), 99999)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_1, 7)


# rule "(Duplicate) Power Block cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.DOOMFIST
#     @Condition eventPlayer.isUsingAbility2() == true
    
#     waitUntil(not eventPlayer.isUsingAbility2(), 99999)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_2, 9)


# rule "(Duplicate) Cardiac Overdrive cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.MAUGA
#     @Condition eventPlayer.isUsingAbility2() == true
    
#     waitUntil(not eventPlayer.isUsingAbility2(), 99999)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_2, 16)


# rule "(Duplicate) Overrun cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.MAUGA
#     @Condition eventPlayer.isUsingAbility1() == true
    
#     waitUntil(not eventPlayer.isUsingAbility1(), 99999)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_1, 10)


# rule "(Duplicate) Charge cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.REINHARDT
#     @Condition eventPlayer.isUsingAbility1() == true
    
#     waitUntil(not eventPlayer.isUsingAbility1(), 999999986991104)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_1, 10)


# rule "(Duplicate) Kinetic Grasp cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.SIGMA
#     @Condition eventPlayer.isUsingAbility1() == true
    
#     waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_1) != 0, 99999)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_1, 13)


# rule "(Duplicate) Storm Arrow cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.HANZO
#     @Condition eventPlayer.isUsingAbility2() == true
    
#     eventPlayer.setAbilityCooldown(Button.ABILITY_2, 10)


# rule "(Duplicate) Concussion Mine cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.JUNKRAT
#     @Condition eventPlayer.isUsingAbility1() == true
    
#     waitUntil(not eventPlayer.isUsingAbility1(), 99999)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_1, 8)


/*
rule "(Duplicate) Shadow Step cooldown":
    @Event eachPlayer
    @Hero echo
    @Condition eventPlayer.getHeroOfDuplication() == Hero.REAPER
    @Condition eventPlayer.isUsingAbility2() == true
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 8)
*/

# rule "(Duplicate) Biotic Field cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.SOLDIER
#     @Condition eventPlayer.isUsingAbility2() == true
    
#     eventPlayer.setAbilityCooldown(Button.ABILITY_2, 15)


# rule "(Duplicate) Recall cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.TRACER
#     @Condition eventPlayer.isUsingAbility2() == true
    
#     eventPlayer.setAbilityCooldown(Button.ABILITY_2, 12)


# rule "(Duplicate) Sleep Dart cooldown":
#     @Event eachPlayer
#     @Hero echo
#     @Condition eventPlayer.getHeroOfDuplication() == Hero.ANA
#     @Condition eventPlayer.isUsingAbility1() == true
    
#     waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_1) != 0, 99999)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_1, 12)
