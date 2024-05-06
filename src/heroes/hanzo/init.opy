#!mainFile "../../dev_main.opy"


rule "[hanzo/init.opy]: Hanzo":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.HANZO
    
    eventPlayer.ult_change_check = 1.21
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(100)
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 199, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    setBaseDamage(eventPlayer, ADJ_HANZO_STORM_DAMAGE/OW2_HANZO_STORM_DAMAGE)
    
    removeSelfHealing()


rule "[hanzo/init.opy]: Correct Storm Bow, Sonic Arrow and melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.HANZO
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.MELEE, Button.ABILITY_1]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
