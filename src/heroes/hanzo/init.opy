#!mainFile "../../dev_main.opy"


rule "[hanzo/init.opy]: Hanzo":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.HANZO
    
    newHero(200, 0, 0)
    removeSelfHealing()
    eventPlayer.setDamageDealt(93.333)

    eventPlayer.ult_change_check = 1.21


rule "[hanzo/init.opy]: Increase Storm Bow and Hanzo melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.HANZO
    @Condition (eventAbility == Button.PRIMARY_FIRE or eventAbility == Button.MELEE) == true
    
    damage(victim, attacker, eventDamage * 1.085 - eventDamage)
