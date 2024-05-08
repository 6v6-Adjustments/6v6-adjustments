#!mainFile "../../dev_main.opy"


rule "[hanzo/init.opy]: Hanzo":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.HANZO
    
    newHero(ADJ_HANZO_HEALTH, 0, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_HANZO_STORM_DAMAGE/OW2_HANZO_STORM_DAMAGE)

    eventPlayer.call_init = false


rule "[hanzo/init.opy]: Correct Storm Bow, Sonic Arrow and melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.HANZO
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.MELEE, Button.ABILITY_1]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
