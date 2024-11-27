#!mainFile "../../dev_main.opy"


# def initHazard():
#     @Name "[hazard/init.opy]: initHazard()"
    

#     setCustomHp(
#         ADJ_HAZARD_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() else ADJ_HAZARD_HEALTH,
#         ADJ_HAZARD_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() else ADJ_HAZARD_ARMOR,
#         0)
#     setUltCost(ADJ_HAZARD_ULT_COST)

#     if not eventPlayer.isDuplicatingAHero():
#         removeSelfHealing()
#         setBaseDamage(eventPlayer, ADJ_HAZARD_BONESPUR_DAMAGE/OW2_HAZARD_BONESPUR_DAMAGE)

#     eventPlayer.hero_initialized = true


# rule "[hazard/init.opy]: Correct Hazard other forms of damage":
#     @Event playerDealtDamage
#     @Hero juno #hazard
#     @Condition eventAbility in [Button.MELEE, Button.SECONDARY_FIRE, Button.ABILITY_2, Button.ULTIMATE]

#     damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


# rule "[hazard/init.opy]: Reduce Violent Leap damage":
#     @Event playerDealtDamage
#     @Hero juno #hazard
#     @Condition eventAbility == Button.ABILITY_1

#     heal(victim, null, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_HAZARD_SLASH_DAMAGE/OW2_HAZARD_SLASH_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar * -1)
