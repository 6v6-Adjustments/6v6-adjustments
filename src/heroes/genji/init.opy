#!mainFile "../../dev_main.opy"


rule "[genji/init.opy]: Genji":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.GENJI
    
    eventPlayer.ult_change_check = 1.2
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(100)
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 199, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    
    removeSelfHealing()


rule "[genji/init.opy]: Correct Shurikens damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.GENJI
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.SECONDARY_FIRE]

    damage(victim, attacker, eventDamage * (ADJ_GENJI_SHURIKEN_DAMAGE/OW2_GENJI_SHURIKEN_DAMAGE) - eventDamage)
