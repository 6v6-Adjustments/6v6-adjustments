#!mainFile "../../dev_main.opy"


rule "[brigitte/inspire.opy]: Inspire self healing logic":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE

    pushSelfHealing(Button.MELEE)
    wait(OW2_BRIGITTE_INSPIRE_DURATION, Wait.RESTART_WHEN_TRUE)
    popSelfHealing(Button.MELEE)
