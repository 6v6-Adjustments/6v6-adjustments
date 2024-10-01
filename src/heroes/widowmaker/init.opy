#!mainFile "../../dev_main.opy"


def initWidowmaker():
    @Name "[widowmaker/init.opy]: initWidowmaker()"
    
    setCustomHp(ADJ_WIDOWMAKER_HEALTH-50, 50, 0)
    setUltCost(ADJ_WIDOWMAKER_ULT_COST)
    removeSelfHealing()
    setBaseDamage(eventPlayer, 0.1)

    eventPlayer.hero_initialized = true


rule "[widowmaker/init.opy]: Correct Widowmaker Sniper Damage":
    @Event playerDealtDamage
    @Hero widowmaker
    @Condition eventPlayer.isFiringSecondaryFire() == true
    @Condition eventAbility == Button.PRIMARY_FIRE

    if raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + 1000 * eventPlayer.getFacingDirection(), victim, null, false).getPlayerHit() != null:
        damage(victim, null, 9*eventDamage)

rule "[widowmaker/init.opy]: Correct SMG Damage":
    @Event playerDealtDamage
    @Hero widowmaker
    @Condition eventPlayer.isFiringSecondaryFire() != true
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, null, 9*eventDamage)

rule "[widowmaker/init.opy]: Correct Venom Mine Damage":
    @Event playerDealtDamage
    @Hero widowmaker
    @Condition eventAbility != Button.PRIMARY_FIRE

    damage(victim, null, 9*eventDamage)

