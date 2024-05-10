#!mainFile "../../dev_main.opy"


rule "[illari/init.opy]: Illari":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    
    newHero(ADJ_ILLARI_HEALTH, 0, 0)
    removeRegenPassive()

    eventPlayer.setDamageDealt(75)

    eventPlayer.setMaxAmmo(0, 14)
    eventPlayer.setAmmo(0, 14)

    eventPlayer.call_init = false


rule "[illari/init.opy]: Increase Illari melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    @Condition eventAbility == Button.MELEE
    
    damage(victim, attacker, eventDamage * 1.34 - eventDamage)


rule "[illari/init.opy]: Increase Solar Rifle damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    @Condition eventWasCriticalHit == false
    @Condition eventDamage < 119
    @Condition eventAbility != Button.MELEE
    
    damage(victim, attacker, eventDamage * 1.267 - eventDamage)


rule "[illari/init.opy]: Increase Solar Rifle critical hit damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    @Condition eventWasCriticalHit == true
    
    damage(victim, attacker, eventDamage * 1.327 - eventDamage)


rule "[illari/init.opy]: Reduce Solar Rifle healing":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ILLARI
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    
    eventPlayer.setHealingDealt(91.27)
    waitUntil(not eventPlayer.isHoldingButton(Button.SECONDARY_FIRE), 99999)
    eventPlayer.setHealingDealt(100)


/*
rule "(Duplicate) Healing Pylon cooldown":
    @Event eachPlayer
    @Hero echo
    @Condition eventPlayer.getHeroOfDuplication() == Hero.ILLARI
    @Condition eventPlayer.isUsingAbility1() == true
    
    waitUntil(not eventPlayer.isUsingAbility1(), 99999)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 10)
*/
