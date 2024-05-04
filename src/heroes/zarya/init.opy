#!mainFile "../../dev_main.opy"

#!include "heroes/zarya/self_bubble.opy"
#!include "heroes/zarya/ally_bubble.opy"


rule "[zarya/init.opy]: Zarya":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ZARYA
    
    newHero(
        200,
        0,
        150 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 200
    )
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.setKnockbackDealt(73.607)
    eventPlayer.setDamageDealt(84.211)

    initSelfBubble()
    initAllyBubble()

    eventPlayer.ult_change_check = 1


rule "[zarya/init.opy]: Clean up Zarya":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup != Hero.ZARYA

    hideSelfBubbleCD()
    hideAllyBubbleCD()


rule "[zarya/init.opy]: Increase Zarya Alternate Fire and melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ZARYA
    @Condition (eventAbility == Button.MELEE or eventAbility == Button.SECONDARY_FIRE) == true
    
    damage(victim, attacker, eventDamage * 1.188 - eventDamage)
