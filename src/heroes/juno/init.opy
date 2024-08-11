#!mainFile "../../dev_main.opy"


def initJuno():
    @Name "[juno/init.opy]: initJuno()"
    
    setCustomHp(ADJ_JUNO_HEALTH, 0, ADJ_JUNK_SHIELDS)
    setUltCost(ADJ_JUNO_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, 0.9)
    setBaseHealing(eventPlayer, 0.85)

    eventPlayer.hero_initialized = true


rule "[juno/init.opy]: Correct Juno melee damage":
    @Event playerDealtDamage
    @Hero juno
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
