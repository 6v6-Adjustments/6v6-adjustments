#!mainFile "../../../main.opy"

globalvar  health_pool


rule "[echo/init.opy]: Initialize Echo":
    @Event eachPlayer
    @Hero echo
    @Condition eventPlayer.call_init
    
    resetHero()
    eventPlayer.call_init = false


rule "[echo/init.opy]: Deal OW1 echo focusing beam under 50% hp":
    @Event playerDealtDamage
    @Hero echo
    @Condition eventPlayer.isUsingAbility2()
    @Condition percent(victim.getHealth()/victim.getMaxHealth()) < OW1_ECHO_FOCUSING_BEAM_TRESHOLD 

    damage(victim, attacker, eventDamage*(OW1_ECHO_FOCUSING_BEAM_DMG/OW2_ECHO_FOCUSING_BEAM_DMG)-eventDamage)
