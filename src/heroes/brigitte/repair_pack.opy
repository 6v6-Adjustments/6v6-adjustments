#!mainFile "../../dev_main.opy"


rule "[brigitte/repair_pack.opy]: Increase Repair Pack healing":
    @Event playerDealtHealing
    @Hero brigitte
    @Condition eventAbility == Button.ABILITY_2
    
    heal(healee, healer, eventHealing * (OW2_BRIGITTE_INSPIRE_TOTAL_HEALING/ADJ_BRIGITTE_INSPIRE_TOTAL_HEALING) - eventHealing)
