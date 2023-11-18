#!mainFile "../../../main.opy"


rule "[reaper/init.opy]: Initialize Reaper":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.REAPER)
    @Condition eventPlayer.call_init

    resetHero()
    eventPlayer.call_init = false


rule "[reaper.opy]: Deal OW1 Reaper primary fire damage":
    @Event playerDealtDamage
    @Condition isHero(eventPlayer, Hero.REAPER)
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, eventDamage*(OW1_REAPER_HELLFIRE_SHOTGUNS_DAMAGE/OW2_REAPER_HELLFIRE_SHOTGUNS_DAMAGE)-eventDamage)
