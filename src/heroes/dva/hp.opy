#!mainFile "../../dev_main.opy"


rule "[dva/hp.opy]: Correct DVa mech health":
    @Event eachPlayer
    @Hero dva
    @Condition not eventPlayer.isInAlternateForm()
    @Condition not eventPlayer.call_init

    setCustomHp(
        ADJ_DVA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_HEALTH,
        ADJ_DVA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_ARMOR,
        0)


rule "[dva/hp.opy]: Correct DVa pilot health":
    @Event eachPlayer
    @Hero dva
    @Condition eventPlayer.isInAlternateForm()
    @Condition eventPlayer.getMaxHealthOfType(Health.NORMAL) != ADJ_DVA_PILOT_HEALTH
    @Condition not eventPlayer.call_init

    clearCustomHp()
