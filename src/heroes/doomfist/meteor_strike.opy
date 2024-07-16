#!mainFile "../../dev_main.opy"


rule "[doomfist/meteor_strike.opy]: Correct Meteor Strike and Doomfist melee damage":
    @Event playerDealtDamage
    @Hero doomfist
    @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
