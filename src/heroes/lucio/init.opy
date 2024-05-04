#!mainFile "../../dev_main.opy"

#!include "heroes/lucio/aura.opy"


rule "[lucio/init.opy]: Lucio":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.LUCIO
    
    newHero(200, 0, 0)
    removeSelfHealing()

    eventPlayer.setKnockbackDealt(89.286)
    eventPlayer.setDamageDealt(66.667)

    eventPlayer.ult_change_check = 1.02


rule "[lucio/init.opy]: Increase Lucio melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.LUCIO
    @Condition eventAbility == Button.MELEE
    
    damage(victim, attacker, eventDamage * 1.778 - eventDamage)


rule "[lucio/init.opy]: Increase Sonic Amplifier damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.LUCIO
    @Condition eventAbility == Button.PRIMARY_FIRE
    
    damage(victim, attacker, eventDamage * 2.018 - eventDamage)
