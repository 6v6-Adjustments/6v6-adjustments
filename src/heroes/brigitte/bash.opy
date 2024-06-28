#!mainFile "../../dev_main.opy"

playervar bash_cooldown


rule "[brigitte/bash.opy]: Correct Shield Bash damage":
    @Event playerDealtDamage
    @Hero brigitte
    @Condition eventPlayer.isFiringSecondaryFire()
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[brigitte/bash.opy]: Track Bash cooldown":
    @Event eachPlayer
    @Hero brigitte
    @Condition eventPlayer.isFiringPrimaryFire()
    @Condition eventPlayer.isFiringSecondaryFire()
        
    wait(ADJ_BRIGITTE_BASH_DURATION)
    eventPlayer.bash_cooldown = ADJ_BRIGITTE_BASH_COOLDOWN
    chase(eventPlayer.bash_cooldown, 0, rate=1, ChaseReeval.NONE)


rule "[brigitte/bash.opy]: Force cooldown for Bash in Rally":
    @Event eachPlayer
    @Hero brigitte
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setAbilityCooldown(Button.PRIMARY_FIRE, eventPlayer.bash_cooldown)
