#!mainFile "../../dev_main.opy"


def initAshe():
    @Name "[ashe/init.opy]: initAshe()"

    setCustomHp(ADJ_ASHE_HEALTH, 0, 0)
    setUltCost(ADJ_ASHE_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
    
    eventPlayer.max_health_scaler = (ADJ_ASHE_BOB_HEALTH/OW2_ASHE_BOB_HEALTH)

    eventPlayer.hero_initialized = true


rule "[ashe/init.opy]: Correct Viper damage":
    @Event playerDealtDamage
    @Hero ashe
    @Condition eventAbility in Button.PRIMARY_FIRE
    @Condition not eventPlayer.isFiringSecondaryFire()

    damage(victim, attacker, eventDamage * (ADJ_ASHE_VIPER_DAMAGE/OW2_ASHE_VIPER_DAMAGE) - eventDamage)
