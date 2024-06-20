#!mainFile "../../dev_main.opy"


rule "[sombra/init.opy]: Initialize Sombra":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SOMBRA

    setCustomHp(ADJ_SOMBRA_HEALTH, null, null)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_SOMBRA_SMG_DAMAGE/OW2_SOMBRA_SMG_DAMAGE)

    eventPlayer._self_healing_percent = 0.1 # set self healing to 0.1% such that 75hp healthpack becomes 0.075hp
    eventPlayer.call_init = false


rule "[sombra/init.opy]: Increase Sombra Melee damage": # This doesn't include damage dealt by virus due to it being taxing on script load for an extended period of time
    @Event playerDealtDamage
    @Hero sombra
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[sombra/init.opy]: hacked health packs":
    @Event playerReceivedHealing
    @Hero sombra
    @Condition eventWasHealthPack == true
    
    heal(eventPlayer, eventPlayer, eventHealing/unpercent(eventPlayer._self_healing_percent) - eventHealing)
 