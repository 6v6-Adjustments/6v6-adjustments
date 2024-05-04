#!mainFile "../../dev_main.opy"


rule "[tracer/init.opy]: Tracer":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.TRACER
    
    defaultHero()
    removeSelfHealing()

    eventPlayer.setDamageDealt(91.667)
    eventPlayer.startScalingSize(0.96, true)

    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 5)

    eventPlayer.ult_change_check = 1.18


rule "[tracer/init.opy]: Increase Tracer melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.TRACER
    @Condition eventAbility == Button.MELEE
    
    damage(victim, attacker, eventDamage * 1.117 - eventDamage)


rule "[tracer/init.opy]: Increase Pulse Bomb damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.TRACER
    @Condition eventAbility == Button.ULTIMATE
    
    damage(victim, attacker, eventDamage * 1.1 - eventDamage)
