#!mainFile "../../dev_main.opy"

playervar bash_cooldown


rule "[brigitte/bash.opy]: Track Bash cooldown":
    @Event eachPlayer
    @Hero brigitte
    @Condition eventPlayer.isFiringPrimaryFire()
    @Condition eventPlayer.isFiringSecondaryFire()
        
    eventPlayer.bash_cooldown = (ADJ_BRIGITTE_BASH_COOLDOWN + ADJ_BRIGITTE_BASH_DURATION)
    chase(eventPlayer.bash_cooldown, 0, rate=1, ChaseReeval.NONE)


rule "[brigitte/bash.opy]: Force cooldown for Bash in Rally":
    @Event eachPlayer
    @Hero brigitte
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setAbilityCooldown(Button.PRIMARY_FIRE, eventPlayer.bash_cooldown)
