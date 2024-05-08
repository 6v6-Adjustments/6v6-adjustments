#!mainFile "../../dev_main.opy"


rule "[genji/init.opy]: Genji":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.GENJI
    
    newHero(ADJ_GENJI_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[genji/init.opy]: Correct Shurikens damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.GENJI
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.SECONDARY_FIRE]

    damage(victim, attacker, eventDamage * (ADJ_GENJI_SHURIKEN_DAMAGE/OW2_GENJI_SHURIKEN_DAMAGE) - eventDamage)
