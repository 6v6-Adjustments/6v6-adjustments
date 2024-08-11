#!mainFile "../../dev_main.opy"


def initGenji():
    @Name "[genji/init.opy]: initGenji()"
    
    setCustomHp(ADJ_GENJI_HEALTH, 0, 0)
    setUltCost(ADJ_GENJI_ULT_COST)
    removeSelfHealing()

    eventPlayer.hero_initialized = true


rule "[genji/init.opy]: Correct Shurikens damage":
    @Event playerDealtDamage
    @Hero genji
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.SECONDARY_FIRE]

    damage(victim, attacker, eventDamage * (ADJ_GENJI_SHURIKEN_DAMAGE/OW2_GENJI_SHURIKEN_DAMAGE) - eventDamage)


rule "[genji/init.opy]: Reduce Deflect duration":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.isUsingAbility2()

    wait(ADJ_GENJI_DEFLECT_DURATION)
    eventPlayer.forceButtonPress(Button.ABILITY_2)