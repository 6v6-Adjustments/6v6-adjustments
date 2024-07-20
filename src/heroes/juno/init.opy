#!mainFile "../../dev_main.opy"


rule "[juno/init.opy]: Initialize Juno":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNKRAT
    
    setCustomHp(ADJ_JUNO_HEALTH, 0, ADJ_JUNK_SHIELDS)
    setUltCost(ADJ_JUNO_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, 0.9)
    setBaseHealing(eventPlayer, 0.85)

    eventPlayer.call_init = false


rule "[juno/init.opy]: Correct Juno melee damage":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
