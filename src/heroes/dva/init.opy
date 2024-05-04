#!mainFile "../../dev_main.opy"


rule "[dva/init.opy]: D.va (mech)":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isInAlternateForm() == false

    newHero(
        ADJ_DVA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else ADJ_DVA_HEALTH,
        ADJ_DVA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else ADJ_DVA_ARMOR,
        0)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.ult_change_check = 1

    if eventPlayer.getMaxHealth() != ((ADJ_DVA_HEALTH_DUPLICATE + ADJ_DVA_ARMOR) if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else (ADJ_DVA_HEALTH + ADJ_DVA_ARMOR)):
        goto RULE_START


rule "[dva/init.opy]: D.va (pilot)":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isInAlternateForm() == true
    
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
