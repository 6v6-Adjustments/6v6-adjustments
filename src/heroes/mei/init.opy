#!mainFile "../../dev_main.opy"

#!include "heroes/mei/cryo_freeze.opy"


def initMei():
    @Name "[mei/init.opy]: initMei()"

    setCustomHp(ADJ_MEI_HEALTH, 0, 0)
    setUltCost(ADJ_MEI_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
    setBaseDamage(eventPlayer, ADJ_MEI_ICICLE_DAMAGE/OW2_MEI_ICICLE_DAMAGE)

    # eventPlayer.setMaxAmmo(0, ADJ_MEI_AMMO_COUNT)
    # eventPlayer.setAmmo(0, ADJ_MEI_AMMO_COUNT)

    eventPlayer.max_health_scaler = (ADJ_MEI_ICEWALL_HP/OW2_MEI_ICEWALL_HP)
    eventPlayer.hero_initialized = true


rule "[mei/init.opy]: Increase Mei other forms of damage":
    @Event playerDealtDamage
    @Hero mei
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
