#!mainFile "../../dev_main.opy"

#!include "heroes/zarya/self_bubble.opy"
#!include "heroes/zarya/ally_bubble.opy"


rule "[zarya/init.opy]: Initialize Zarya":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ZARYA
    
    setCustomHp(
        ADJ_ZARYA_HEALTH,
        0,
        ADJ_ZARYA_SHIELDS_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ZARYA_SHIELDS
    )
    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_ZARYA_CANNON_DAMAGE_MAX/OW2_ZARYA_CANNON_DAMAGE_MAX)

    initSelfBubble()
    initAllyBubble()

    eventPlayer.call_init = false


rule "[zarya/init.opy]: Clean up Zarya":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup != Hero.ZARYA

    hideSelfBubbleCD()
    hideAllyBubbleCD()


rule "[zarya/init.opy]: Correct Alternate Fire and Melee damage":
    @Event playerDealtDamage
    @Hero zarya
    @Condition eventAbility in [Button.SECONDARY_FIRE, Button.MELEE]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
