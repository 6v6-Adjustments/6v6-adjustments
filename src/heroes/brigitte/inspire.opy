#!mainFile "../../dev_main.opy"


rule "[brigitte/inspire.opy]: Inspire self healing logic":
    @Event playerDealtDamage
    @Hero brigitte

    pushSelfHealing(Button.MELEE)
    wait(OW2_BRIGITTE_INSPIRE_DURATION, Wait.RESTART_WHEN_TRUE)
    popSelfHealing(Button.MELEE)


rule "[brigitte/inspire.opy]: Increase Inspire self healing":
    @Event playerDealtHealing
    @Hero brigitte
    @Condition healee == healer
    
    heal(healee, null, eventHealing * (OW2_BRIGITTE_INSPIRE_TOTAL_HEALING/ADJ_BRIGITTE_INSPIRE_TOTAL_HEALING) - eventHealing)
