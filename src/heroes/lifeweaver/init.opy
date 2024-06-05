#!mainFile "../../dev_main.opy"


rule "[lifeweaver/init.opy]: Lifeweaver":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.LIFEWEAVER
    
    setCustomHp(ADJ_LIFEWEAVER_HEALTH, 0, ADJ_LIFEWEAVER_SHIELDS)
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_LIFEWEAVER_THORN_VOLLEY_DAMAGE/OW2_LIFEWEAVER_THORN_VOLLEY_DAMAGE)

    eventPlayer.setMaxAmmo(0, ADJ_LIFEWEAVER_HEALING_BLOSSOM_AMMO)
    eventPlayer.setAmmo(0, ADJ_LIFEWEAVER_HEALING_BLOSSOM_AMMO)
    eventPlayer.setMaxAmmo(1, ADJ_LIFEWEAVER_THORN_VOLLEY_AMMO)
    eventPlayer.setAmmo(1, ADJ_LIFEWEAVER_THORN_VOLLEY_AMMO)

    eventPlayer.call_init = false


rule "[lifeweaver/init.opy]: Reduce Lifeweaver melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.LIFEWEAVER
    @Condition eventAbility == Button.MELEE

    heal(victim, null, eventDamage - (eventDamage/eventPlayer._base_damage_scalar))


rule "[lifeweaver/init.opy]: Reduce Tree of Life healing":
    @Event playerDealtHealing
    @Condition eventPlayer.hero_setup == Hero.LIFEWEAVER
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setHealingDealt(83.333)
    waitUntil(eventPlayer.getUltCharge() > 0, Math.INFINITY)
    eventPlayer.setHealingDealt(100)


rule "[lifeweaver/init.opy]: Reduce Tree of Life duration":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.LIFEWEAVER
    @Condition eventPlayer.isUsingUltimate()
    
    wait(ADJ_LIFEWEAVER_TREE_OF_LIFE_DURATION)
    eventPlayer.forceButtonPress(Button.ULTIMATE)


/*
rule "(Duplicate) Plat cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.LIFEWEAVER
    @Condition eventPlayer.isUsingAbility1() == true
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 10)
    waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_1) != 0, 99999)
*/
