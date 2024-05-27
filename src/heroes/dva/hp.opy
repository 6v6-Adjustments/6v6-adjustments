#!mainFile "../../dev_main.opy"


rule "[dva/hp.opy]: Correct DVa mech health":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition not eventPlayer.isInAlternateForm()
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) != ADJ_DVA_ARMOR

    setCustomHp(
        ADJ_DVA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_HEALTH,
        ADJ_DVA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_ARMOR,
        0)


rule "[dva/hp.opy]: Correct DVa pilot health":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isInAlternateForm()

    wait(0.1)
    eventPlayer.removeAllHealthPools()
    wait(0.1)
    eventPlayer.setMaxHealth(100.001) # DO NOT REMOVE THIS LINE
    wait(0.1) # DO NOT REMOVE THIS LINE
    eventPlayer.setMaxHealth(100)
