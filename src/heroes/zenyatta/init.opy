#!mainFile "../../dev_main.opy"

#!include "heroes/zenyatta/transc.opy"


rule "[zenyatta/init.opy]: Initialize Zenyatta":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ZENYATTA

    setCustomHp(ADJ_ZENYATTA_HEALTH, 0, ADJ_ZENYATTA_SHIELDS)
    setUltCost(ADJ_ZENYATTA_ULT_COST)
    removeSelfHealing()

    eventPlayer.setAmmo(0, 20)
    eventPlayer.setMaxAmmo(0, 20)

    eventPlayer.call_init = false


rule "[zenyatta/init.opy]: Correct Orb of Destruction damage":
    @Event playerDealtDamage
    @Hero zenyatta
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.SECONDARY_FIRE]

    damage(victim, attacker, eventDamage * (ADJ_ZENYATTA_ORB_DAMAGE/OW2_ZENYATTA_ORB_DAMAGE) - eventDamage)
