#!mainFile "../../dev_main.opy"


rule "[genji/init.opy]: Genji":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.GENJI
    
    newHero(ADJ_GENJI_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.ult_change_check = 1.2


rule "[genji/init.opy]: Increase Shurikens damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.GENJI
    @Condition (eventAbility == Button.PRIMARY_FIRE or eventAbility == Button.SECONDARY_FIRE) == true
    
    damage(victim, attacker, eventDamage * 1.074 - eventDamage)
