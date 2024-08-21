#!mainFile "../dev_main.opy"

playervar hero_initialized

subroutine initHero
subroutine initAna
subroutine initAshe
subroutine initBaptiste
subroutine initBastion
subroutine initBrigitte
subroutine initDoomfist
subroutine initDva
subroutine initEcho
subroutine initGenji
subroutine initHanzo
subroutine initIllari
subroutine initJunkerQueen
subroutine initJunkrat
subroutine initJuno
subroutine initKiriko
subroutine initLifeweaver
subroutine initLucio
subroutine initMauga
subroutine initMccree
subroutine initMei
subroutine initMercy
subroutine initMoira
subroutine initOrisa
subroutine initPharah
subroutine initRamattra
subroutine initReaper
subroutine initReinhardt
subroutine initRoadhog
subroutine initSigma
subroutine initSojourn
subroutine initSoldier
subroutine initSombra
subroutine initSymmetra
subroutine initTorbjorn
subroutine initTracer
subroutine initVenture
subroutine initWidowmaker
subroutine initWinston
subroutine initWreckingBall
subroutine initZarya
subroutine initZenyatta


#!include "utilities/hero_switch.opy"


def initHero():
    @Name "[utilities/hero_init.opy]: initHero()"

    switch eventPlayer.hero_setup:
        case Hero.ANA:
            initAna()
            break
        case Hero.ASHE:
            initAshe()
            break
        case Hero.BAPTISTE:
            initBaptiste()
            break
        case Hero.BASTION:
            initBastion()
            break
        case Hero.BRIGITTE:
            initBrigitte()
            break
        case Hero.DOOMFIST:
            initDoomfist()
            break
        case Hero.DVA:
            initDva()
            break
        case Hero.ECHO:
            initEcho()
            break
        case Hero.GENJI:
            initGenji()
            break
        case Hero.HANZO:
            initHanzo()
            break
        case Hero.ILLARI:
            initIllari()
            break
        case Hero.JUNKER_QUEEN:
            initJunkerQueen()
            break
        case Hero.JUNKRAT:
            initJunkrat()
            break
        case Hero.JUNKRAT:
            initJuno()
            break
        case Hero.KIRIKO:
            initKiriko()
            break
        case Hero.LIFEWEAVER:
            initLifeweaver()
            break
        case Hero.LUCIO:
            initLucio()
            break
        case Hero.MAUGA:
            initMauga()
            break
        case Hero.CASSIDY:
            initMccree()
            break
        case Hero.MEI:
            initMei()
            break
        case Hero.MERCY:
            initMercy()
            break
        case Hero.MOIRA:
            initMoira()
            break
        case Hero.ORISA:
            initOrisa()
            break
        case Hero.PHARAH:
            initPharah()
            break
        case Hero.RAMATTRA:
            initRamattra()
            break
        case Hero.REAPER:
            initReaper()
            break
        case Hero.REINHARDT:
            initReinhardt()
            break
        case Hero.ROADHOG:
            initRoadhog()
            break
        case Hero.SIGMA:
            initSigma()
            break
        case Hero.SOJOURN:
            initSojourn()
            break
        case Hero.SOLDIER:
            initSoldier()
            break
        case Hero.SOMBRA:
            initSombra()
            break
        case Hero.SYMMETRA:
            initSymmetra()
            break
        case Hero.TORBJORN:
            initTorbjorn()
            break
        case Hero.TRACER:
            initTracer()
            break
        case Hero.VENTURE:
            initVenture()
            break
        case Hero.WIDOWMAKER:
            initWidowmaker()
            break
        case Hero.WINSTON:
            initWinston()
            break
        case Hero.HAMMOND:
            initWreckingBall()
            break
        case Hero.ZARYA:
            initZarya()
            break
        case Hero.ZENYATTA:
            initZenyatta()
            break
        default:
            break
    
    if not eventPlayer.hero_initialized: bigMessage(eventPlayer, "warning: {} not initialized properly!".format(eventPlayer.hero_setup))
