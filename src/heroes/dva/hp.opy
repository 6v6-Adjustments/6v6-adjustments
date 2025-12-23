#!mainFile "../../dev_main.opy"

playervar remech_damage_taken

rule "[dva/hp.opy]: Correct DVa mech health":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition not eventPlayer.isInAlternateForm()
    @Condition eventPlayer.hero_initialized

    eventPlayer.remech_damage_taken = eventPlayer.getMaxHealth() - eventPlayer.getHealth()
    clearCustomHp()
    setCustomHp(
        ADJ_DVA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() else ADJ_DVA_HEALTH,
        ADJ_DVA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() else ADJ_DVA_ARMOR,
        0)
    eventPlayer.setHealth(eventPlayer.getMaxHealth() - eventPlayer.remech_damage_taken)


rule "[dva/hp.opy]: Correct DVa pilot health":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isInAlternateForm()
    @Condition eventPlayer.getMaxHealthOfType(Health.NORMAL) != ADJ_DVA_PILOT_HEALTH
    @Condition eventPlayer.hero_initialized

    clearCustomHp()
    setCustomHp(ADJ_DVA_PILOT_HEALTH, 0, 0)
