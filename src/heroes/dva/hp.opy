#!mainFile "../../dev_main.opy"


rule "[dva/hp.opy]: Correct DVa mech health":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition not eventPlayer.isInAlternateForm()
    @Condition eventPlayer.hero_initialized

    setCustomHp(
        ADJ_DVA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_HEALTH,
        ADJ_DVA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_ARMOR,
        0)


rule "[dva/hp.opy]: Correct DVa pilot health":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isInAlternateForm()
    @Condition eventPlayer.getMaxHealthOfType(Health.NORMAL) != ADJ_DVA_PILOT_HEALTH
    @Condition eventPlayer.hero_initialized

    clearCustomHp()
