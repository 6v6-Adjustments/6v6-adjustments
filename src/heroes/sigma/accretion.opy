#!mainFile "../../dev_main.opy"


rule "[sigma/init.opy]: Reduce Accretion stun duration":
    @Event playerDealtDamage
    @Hero sigma
    @Condition victim.hasStatusEffect(Status.KNOCKED_DOWN)

    wait(ADJ_SIGMA_ACCRETION_STUN_DURATION)
    victim.clearStatusEffect(Status.KNOCKED_DOWN)
