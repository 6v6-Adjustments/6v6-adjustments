#!mainFile "../main.opy"

playervar hero_switch_pvar
#!defineMember last_hero_played hero_switch_pvar[0]
#!defineMember hero_switched hero_switch_pvar[1]
#!defineMember hero_id hero_switch_pvar[2]


rule "[hero_switch.opy]: detect hero switch":
    @Event eachPlayer
    @Condition updateEveryTick(eventPlayer.last_hero_played != eventPlayer.getCurrentHero())
    
    eventPlayer.hero_switched = true
    wait()
    eventPlayer.last_hero_played = eventPlayer.getCurrentHero()
    eventPlayer.hero_id = heroID(eventPlayer.last_hero_played)
    eventPlayer.hero_switched = false


rule "[utilities/hero_switch.opy]: Detect switch to Ana":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ANA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Ashe":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ASHE)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Baptiste":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.BAPTISTE)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Bastion":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.BASTION)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Brigitte":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.BRIGITTE)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Doomfist":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.DOOMFIST)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Dva":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.DVA)
    @Condition eventPlayer.hero_switched
    # Apparently Pilot DVa and Mech DVA are 2 seperate heroes but workshop considers them both dva
    # Above condition is needed because otherwise, this rule activates every time dva transitions from pilot to mech and vice versa

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Echo":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ECHO)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Genji":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.GENJI)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Hanzo":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.HANZO)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Illari":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ILLARI)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to JunkerQueen":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.JUNKER_QUEEN)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Junkrat":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.JUNKRAT)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Kiriko":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.KIRIKO)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Lifeweaver":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.LIFEWEAVER)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Lucio":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.LUCIO)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Mccree":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.MCCREE)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Mei":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.MEI)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Mercy":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.MERCY)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Moira":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.MOIRA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Orisa":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ORISA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Pharah":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.PHARAH)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Ramattra":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.RAMATTRA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Reaper":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.REAPER)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Reinhardt":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.REINHARDT)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Roadhog":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ROADHOG)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Sigma":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.SIGMA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Sojourn":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.SOJOURN)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Soldier":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.SOLDIER)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Sombra":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.SOMBRA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Symmetra":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.SYMMETRA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Torbjorn":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.TORBJORN)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Tracer":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.TRACER)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Widowmaker":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.WIDOWMAKER)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Winston":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.WINSTON)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Hammond":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.HAMMOND)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Zarya":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ZARYA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Zenyatta":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.ZENYATTA)

    eventPlayer.call_init = true


rule "[utilities/hero_switch.opy]: Detect switch to Widowmaker":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.WIDOWMAKER)

    eventPlayer.call_init = true
