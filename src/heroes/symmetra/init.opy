#!mainFile "../../dev_main.opy"


def initSymmetra():
    @Name "[symmetra/init.opy]: initSymmetra()"

    setCustomHp(ADJ_SYMMETRA_HEALTH, 0, ADJ_SYMMETRA_SHIELDS)
    setUltCost(ADJ_SYMMETRA_ULT_COST)
    removeSelfHealing()

    eventPlayer.max_health_scaler = (ADJ_SYMMETRA_TURRET_HEALTH/OW2_SYMMETRA_TURRET_HEALTH)

    eventPlayer.hero_initialized = true


rule "[symmetra/init.opy]: Correct Photon projector damage":
    @Event playerDealtDamage
    @Hero symmetra
    @Condition eventAbility == Button.SECONDARY_FIRE

    damage(victim, attacker, eventDamage * (ADJ_SYMMETRA_ORB_DAMAGE/OW2_SYMMETRA_ORB_DAMAGE) - eventDamage)
