#!mainFile "../../dev_main.opy"

#!include "heroes/zarya/self_bubble.opy"
#!include "heroes/zarya/ally_bubble.opy"


rule "[zarya/init.opy]: Zarya":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ZARYA
    
    newHero(
        200,
        0,
        150 if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else 200
    )
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.setKnockbackDealt(73.607)
    setBaseDamage(eventPlayer, ADJ_ZARYA_CANNON_DAMAGE_MAX/OW2_ZARYA_CANNON_DAMAGE_MAX)

    initSelfBubble()
    initAllyBubble()

    eventPlayer.call_init = false


rule "[zarya/init.opy]: Clean up Zarya":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup != Hero.ZARYA

    hideSelfBubbleCD()
    hideAllyBubbleCD()


rule "[zarya/init.opy]: Correct Alternate Fire, melee, Graviton damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.ZARYA
    @Condition eventAbility in [Button.SECONDARY_FIRE, Button.MELEE, Button.ULTIMATE]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
