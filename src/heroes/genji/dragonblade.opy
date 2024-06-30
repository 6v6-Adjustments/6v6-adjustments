#!mainFile "../../dev_main.opy"

playervar dragonblade_prep


rule "[genji/dragonblade.opy]: Reduce Dragonblade attack speed":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.dragonblade_prep == true

    wait(0.064) # necessary delay otherwise this logic crashes the server
    waitUntil(eventPlayer.isFiringPrimaryFire() or not eventPlayer.isUsingUltimate(), Math.INFINITY)
    if eventPlayer.isUsingUltimate():
        eventPlayer.disallowButton([Button.PRIMARY_FIRE, Button.SECONDARY_FIRE, Button.MELEE])
    waitUntil(eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2(), ADJ_GENJI_DRAGONBLADE_ATTACK_RECOVERY)
    eventPlayer.allowButton([Button.PRIMARY_FIRE, Button.SECONDARY_FIRE, Button.MELEE])
    if eventPlayer.isUsingUltimate():
        goto RULE_START

    
rule "[genji/dragonblade.opy]: Prepare/conclude Dragonblade logic":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.isUsingUltimate()

    wait(OW2_GENJI_DRAGONBLADE_UNSHEATH_DURATION)
    eventPlayer.dragonblade_prep = true
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.allowButton([Button.PRIMARY_FIRE, Button.SECONDARY_FIRE, Button.MELEE])
    eventPlayer.dragonblade_prep = false
    eventPlayer.allowButton([Button.PRIMARY_FIRE, Button.SECONDARY_FIRE, Button.MELEE])


rule "[genji/dragonblade.opy]: Correct Dragonblade damage":
    @Event playerDealtDamage
    @Hero genji
    @Condition eventAbility == Button.ULTIMATE

    damage(victim, attacker, eventDamage * (ADJ_GENJI_DRAGONBLADE_DAMAGE/OW2_GENJI_DRAGONBLADE_DAMAGE) - eventDamage)
