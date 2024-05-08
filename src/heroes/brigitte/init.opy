#!mainFile "../../dev_main.opy"

#!include "heroes/brigitte/inspire.opy"
#!include "heroes/brigitte/whipshot.opy"
#!include "heroes/brigitte/bash.opy"


rule "[brigitte/init.opy]: Brigitte":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE

    newHero(ADJ_BRIGITTE_HEALTH, ADJ_BRIGITTE_ARMOR, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_BRIGITTE_FLAIL_DAMAGE/OW2_BRIGITTE_FLAIL_DAMAGE)
    eventPlayer.setHealingDealt(80)

    eventPlayer.call_init = false


rule "[brigitte/init.opy]: Increase Inspire self healing":
    @Event playerDealtHealing
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE
    @Condition healee == healer
    
    heal(healee, null, eventHealing * 1.246 - eventHealing)


rule "[brigitte/init.opy]: Increase Repair Pack healing":
    @Event playerDealtHealing
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE
    @Condition eventAbility == Button.ABILITY_2
    
    heal(healee, healer, eventHealing * 1.25 - eventHealing)


rule "[brigitte/init.opy]: Extra Repair Pack burst healing":
    @Event playerDealtHealing
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE
    @Condition eventAbility == Button.ABILITY_2
    @Condition eventHealing >= 19
    
    heal(healee, healer, 10)
