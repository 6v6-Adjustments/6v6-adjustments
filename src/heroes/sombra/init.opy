#!mainFile "../../dev_main.opy"


def initSombra():
    @Name "[sombra/init.opy]: initSombra()"

    setCustomHp(ADJ_SOMBRA_HEALTH, null, null)
    setUltCost(ADJ_SOMBRA_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
        eventPlayer._self_healing_percent = 0.1 # set self healing to 0.1% such that 75hp healthpack becomes 0.075hp
        
    # setBaseDamage(eventPlayer, ADJ_SOMBRA_SMG_DAMAGE/OW2_SOMBRA_SMG_DAMAGE)

    eventPlayer.hero_initialized = true


# rule "[sombra/init.opy]: Correct Sombra Melee damage":
#     @Event playerDealtDamage
#     @Hero sombra
#     @Condition eventAbility == Button.MELEE

#     damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


# rule "[sombra/init.opy]: Correct Virus damage":
#     @Event playerDealtDamage
#     @Hero sombra
#     @Condition eventAbility == Button.ABILITY_1
#     @Condition eventDamage >= OW2_SOMBRA_VIRUS_IMPACT_DAMAGE*eventPlayer._base_damage_scalar

#     # heal(victim, null, ((eventDamage * (ADJ_SOMBRA_VIRUS_IMPACT_DAMAGE/OW2_SOMBRA_VIRUS_IMPACT_DAMAGE) - eventDamage) * -1) * eventPlayer._base_damage_scalar)
#     if eventDamage >= (30*eventPlayer._base_damage_scalar):
#         victim.startDoT(attacker, OW2_SOMBRA_VIRUS_DURATION/2, (ADJ_SOMBRA_VIRUS_DOT-(OW2_SOMBRA_VIRUS_DOT*eventPlayer._base_damage_scalar))/(OW2_SOMBRA_VIRUS_DURATION/2))
#         break
#     victim.startDoT(attacker, OW2_SOMBRA_VIRUS_DURATION, (ADJ_SOMBRA_VIRUS_DOT-(OW2_SOMBRA_VIRUS_DOT*eventPlayer._base_damage_scalar))/OW2_SOMBRA_VIRUS_DURATION)


rule "[sombra/init.opy]: Hacked health pack logic":
    @Event playerReceivedHealing
    @Hero sombra
    @Condition eventWasHealthPack == true
    
    heal(eventPlayer, eventPlayer, eventHealing/unpercent(eventPlayer._self_healing_percent) - eventHealing)
 