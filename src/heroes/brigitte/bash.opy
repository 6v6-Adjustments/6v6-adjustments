#!mainFile "../../dev_main.opy"

playervar bash_cooldown

# Credit to oreoslurpee for Brigitte shield bash logic
# see https://workshop.codes/MR5QJ for oreslurpee's 2018 brig implementation

# rule "[brigitte/bash.opy]: Add stun to shield bash":
#     @Event playerDealtDamage
#     @Hero brigitte
#     @Condition attacker.isFiringSecondaryFire()
#     @Condition eventAbility == Button.PRIMARY_FIRE
#     # @Condition not attacker.shield_bash_through_barrier
    
#     victim.setStatusEffect(attacker, Status.STUNNED, ADJ_BRIGITTE_SHIELD_BASH_STUN_DURATION)


# rule "[brigitte/bash.opy]: Reduce shield bash distance":
#     @Event eachPlayer
#     @Hero brigitte
#     @Condition eventPlayer.isFiringSecondaryFire()
#     @Condition eventPlayer.isFiringPrimaryFire()
#     @Condition not eventPlayer.isUsingUltimate()
    
#     eventPlayer.setMoveSpeed(77.8) # arbitrarily decided based on trial and error
#     waitUntil(eventPlayer.getAbilityCooldown(Button.PRIMARY_FIRE) > 0, Math.INFINITY)
#     if eventPlayer.isUsingUltimate():
#         eventPlayer.setMoveSpeed(percent(ADJ_BRIGITTE_RALLY_SPEED_BUFF/OW2_BRIGITTE_RALLY_SPEED_BUFF))
#     else:
#         eventPlayer.setMoveSpeed(100)


rule "[brigitte/bash.opy]: Correct Shield Bash damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE
    @Condition eventPlayer.isFiringSecondaryFire()
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[brigitte/bash.opy]: Track Bash cooldown":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE
    @Condition eventPlayer.isFiringPrimaryFire()
    @Condition eventPlayer.isFiringSecondaryFire()
        
    wait(ADJ_BRIGITTE_BASH_DURATION)
    eventPlayer.bash_cooldown = ADJ_BRIGITTE_BASH_COOLDOWN
    chase(eventPlayer.bash_cooldown, 0, rate=1, ChaseReeval.NONE)


rule "[brigitte/bash.opy]: Force cooldown for Bash in Rally":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setAbilityCooldown(Button.PRIMARY_FIRE, eventPlayer.bash_cooldown)
