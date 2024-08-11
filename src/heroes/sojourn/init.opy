#!mainFile "../../dev_main.opy"


def initSojourn():
    @Name "[sojourn/init.opy]: initSojourn()"
    
    setCustomHp(ADJ_SOJOURN_HEALTH, 0, 0)
    setUltCost(ADJ_SOJOURN_ULT_COST)
    removeSelfHealing()

    eventPlayer.setAmmo(0, ADJ_SOJOURN_RAILGUN_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_SOJOURN_RAILGUN_AMMO)

    eventPlayer.hero_initialized = true
