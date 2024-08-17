#!mainFile "../../dev_main.opy"

playervar stormbow_distance


rule "[hanzo/stormbow.opy]: Increase Storm Bow/Sonic Arrow damage in effective range":
    @Event playerDealtDamage
    @Hero hanzo
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_1]

    # this code makes me want to cry but it works
    eventPlayer.stormbow_distance = distance(attacker.getEyePosition(), centerMass(victim)) - 0.25
    if eventPlayer.stormbow_distance <= ADJ_HANZO_DAMAGE_FALLOFF_START_DISTANCE:
        damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_HANZO_ARROW_DAMAGE / OW2_HANZO_ARROW_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    else if eventPlayer.stormbow_distance <= ADJ_HANZO_DAMAGE_FALLOFF_END_DISTANCE:
        damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_HANZO_ARROW_DAMAGE / OW2_HANZO_ARROW_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar * ((ADJ_HANZO_DAMAGE_FALLOFF_END_DISTANCE-eventPlayer.stormbow_distance)/(ADJ_HANZO_DAMAGE_FALLOFF_END_DISTANCE-ADJ_HANZO_DAMAGE_FALLOFF_START_DISTANCE)))


rule "[hanzo/stormbow.opy]: Increase Storm Arrow damage":
    @Event playerDealtDamage
    @Hero hanzo
    @Condition eventAbility == Button.ABILITY_2

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_HANZO_STORM_DAMAGE / OW2_HANZO_STORM_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
