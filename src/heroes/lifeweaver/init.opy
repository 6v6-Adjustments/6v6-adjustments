#!mainFile "../../dev_main.opy"


rule "[lifeweaver/init.opy]: Initialize Lifeweaver":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.LIFEWEAVER
    
    setCustomHp(ADJ_LIFEWEAVER_HEALTH, 0, ADJ_LIFEWEAVER_SHIELDS)
    setUltCost(ADJ_LIFEWEAVER_ULT_COST)
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_LIFEWEAVER_THORN_VOLLEY_DAMAGE/OW2_LIFEWEAVER_THORN_VOLLEY_DAMAGE)

    eventPlayer.setMaxAmmo(0, ADJ_LIFEWEAVER_HEALING_BLOSSOM_AMMO)
    eventPlayer.setAmmo(0, ADJ_LIFEWEAVER_HEALING_BLOSSOM_AMMO)
    eventPlayer.setMaxAmmo(1, ADJ_LIFEWEAVER_THORN_VOLLEY_AMMO)
    eventPlayer.setAmmo(1, ADJ_LIFEWEAVER_THORN_VOLLEY_AMMO)

    eventPlayer.call_init = false


rule "[lifeweaver/init.opy]: Reduce Lifeweaver melee damage":
    @Event playerDealtDamage
    @Hero lifeweaver
    @Condition eventAbility == Button.MELEE

    heal(victim, null, eventDamage - (eventDamage/eventPlayer._base_damage_scalar))


# rule "[lifeweaver/init.opy]: Reduce Tree of Life healing":
#     @Event playerDealtHealing
#     @Hero lifeweaver
#     @Condition eventPlayer.isUsingUltimate()
    
#     eventPlayer.setHealingDealt(ADJ_LIFEWEAVER_TREE_HEALING / OW2_LIFEWEAVER_TREE_HEALING)
#     waitUntil(eventPlayer.getUltCharge() > 0, Math.INFINITY)
#     eventPlayer.setHealingDealt(100)


rule "[lifeweaver/init.opy]: Reduce Tree of Life duration":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isUsingUltimate()
    
    wait(ADJ_LIFEWEAVER_TREE_DURATION)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
