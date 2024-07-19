#!mainFile "../../dev_main.opy"


rule "[juno/init.opy]: Initialize Juno":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer
    
    setCustomHp(ADJ_JUNO_HEALTH, 0, 0)
    setUltCost(ADJ_JUNO_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, 0.85)
    setBaseHealing(eventPlayer, 0.85)

    eventPlayer.call_init = false


rule "[ana/init.opy]: Correct Juno melee damage":
    @Event playerDealtDamage
    @Hero 
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
