#!mainFile "../../dev_main.opy"


rule "[genji/init.opy]: Genji":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.GENJI
    
    setCustomHp(ADJ_GENJI_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[genji/init.opy]: Correct Shurikens damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.GENJI
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.SECONDARY_FIRE]

    damage(victim, attacker, eventDamage * (ADJ_GENJI_SHURIKEN_DAMAGE/OW2_GENJI_SHURIKEN_DAMAGE) - eventDamage)


rule "[genji/init.opy]: Reduce Deflect duration":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.GENJI
    @Condition eventPlayer.isUsingAbility2()

    wait(ADJ_GENJI_DEFLECT_DURATION)
    eventPlayer.forceButtonPress(Button.ABILITY_2)