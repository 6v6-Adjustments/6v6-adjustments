#!mainFile "../../dev_main.opy"


rule "[dva/init.opy]: D.va (mech)":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition not eventPlayer.isInAlternateForm()

    newHero(
        ADJ_DVA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_HEALTH,
        ADJ_DVA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_ARMOR,
        0)
    removeTankPassive()
    removeSelfHealing()

    if eventPlayer.getMaxHealth() != ((ADJ_DVA_HEALTH_DUPLICATE + ADJ_DVA_ARMOR) if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else (ADJ_DVA_HEALTH + ADJ_DVA_ARMOR)):
        goto RULE_START

    eventPlayer.call_init = false


rule "[dva/init.opy]: D.va (pilot)":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isInAlternateForm()
    
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(85.714)
    eventPlayer.removeAllHealthPools()
    #resetHealth()
    #eventPlayer.addHealthPool(Health.NORMAL, 149, true, true)
    #resetStats()
    #resetStatuses()
    #resetUltCharge()
    #enableAllAbilities()
    removeTankPassive()
    removeSelfHealing()
    #Reset ultimate charge when DVa pops out of Mech
    if eventPlayer.isUsingUltimate():
        return
    resetUltCharge()

    eventPlayer.call_init = false


/*
rule "(Duplicate) d.va dm fix a":
    @Event eachPlayer
    @Condition eventPlayer.getHeroOfDuplication() == Hero.DVA
    @Condition eventPlayer.isFiringSecondaryFire() == true
    @Condition eventPlayer.getAbilityResource(Button.SECONDARY_FIRE) > 66
    
    eventPlayer.setAbilityResource(Button.SECONDARY_FIRE, 66)
*/

/*
rule "(Duplicate) d.va dm fix b":
    @Event eachPlayer
    @Condition eventPlayer.getHeroOfDuplication() == Hero.DVA
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition eventPlayer.getAbilityResource(Button.SECONDARY_FIRE) > 66
    
    eventPlayer.setAbilityResource(Button.SECONDARY_FIRE, 100)
*/
