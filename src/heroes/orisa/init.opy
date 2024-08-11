#!mainFile "../../dev_main.opy"

#!include "heroes/orisa/javelin.opy"
#!include "heroes/orisa/fortify.opy"
#!include "heroes/orisa/terra_surge.opy"


def initOrisa():
    @Name "[orisa/init.opy]: initOrisa()"
    
    setCustomHp(
        ADJ_ORISA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ORISA_HEALTH, 
        ADJ_ORISA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ORISA_ARMOR, 
        0)
    setUltCost(ADJ_ORISA_ULT_COST)
    removeTankPassive()
    removeSelfHealing()

    # if not eventPlayer.isDuplicatingAHero():
    #     setBaseDamage(eventPlayer, ADJ_ORISA_JAVELIN_DIRECT_DAMAGE / OW2_ORISA_JAVELIN_DIRECT_DAMAGE)

    eventPlayer.balance_change_check = true

    eventPlayer.hero_initialized = true


# rule "[orisa/init.opy]: Increase Orisa other forms of damage":
#     @Event playerDealtDamage
#     @Hero orisa
#     @Condition eventAbility in [Button.MELEE, Button.PRIMARY_FIRE, Button.ABILITY_2]

#     damage(victim, attacker, (eventDamage / eventPlayer._base_damage_scalar - eventDamage) / eventPlayer._base_damage_scalar)
