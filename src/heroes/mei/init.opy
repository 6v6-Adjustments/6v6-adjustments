#!mainFile "../../dev_main.opy"

#!include "heroes/mei/cryo_freeze.opy"


rule "[mei/init.opy]: Initialize Mei":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MEI

    setCustomHp(ADJ_MEI_HEALTH, 0, 0)
    setUltCost(ADJ_MEI_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_MEI_ICICLE_DAMAGE/OW2_MEI_ICICLE_DAMAGE)

    eventPlayer.setMaxAmmo(0, ADJ_MEI_AMMO_COUNT)
    eventPlayer.setAmmo(0, ADJ_MEI_AMMO_COUNT)

    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_MEI_ICEWALL_HP/OW2_MEI_ICEWALL_HP)


rule "[mei/init.opy]: Increase Mei other forms of damage":
    @Event playerDealtDamage
    @Hero mei
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
