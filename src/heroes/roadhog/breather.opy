#!mainFile "../../dev_main.opy"

playervar breather_cooldown
playervar breather_cd_text

#!define initSelfBubble()\
    eventPlayer.breather_cooldown = 0

/*
Below HUD code is sourced from https://workshop.codes/wiki/articles/rendering-an-inworld-text-at-a-specific-onscreen-position

This HUD works by placing a in-world-text visible to only the zarya player.
The reason for doing this is to place the UI anywhere on the screen. 

Currently, HUD texts can only be placed on the top left/middle/right of the screen.
There's ways to move the text down to the bottom right using many new lines "\r\n" character,
but I personally don't like this approach, and find the in world text more elegant.

Because the text exists in the game world, when the player performs activities that shake the camera,
such as meleeing or reloading, the HUD moves/shakes around with the camera.

Below HUD is tuned for 16:9 aspect ratio monitors (typical PC Overwatch setup).
*/
#!define showBreatherCD()\
    if eventPlayer.breather_cd_text == null:\
        createInWorldText(eventPlayer,\
                        "{0}".format(ceil(eventPlayer.breather_cooldown)),\
                        updateEveryTick(eventPlayer.getEyePosition() + (100 * (2.71 * worldVector(Vector.RIGHT, eventPlayer, Transform.ROTATION) + ((-1.73 - 0.2) * (angleToDirection(horizontalAngleOfDirection(eventPlayer.getFacingDirection()),\
                        verticalAngleOfDirection(eventPlayer.getFacingDirection()) - 90))) + 3 * eventPlayer.getFacingDirection()))),\
                        3,\
                        Clip.NONE,\
                        WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR,\
                        Color.WHITE,\
                        SpecVisibility.DEFAULT)\
        eventPlayer.breather_cd_text = getLastCreatedText()

#!define hideBreatherCD()\
    destroyInWorldText(eventPlayer.breather_cd_text)\
    eventPlayer.breather_cd_text = null

# playervar breather_pvar
# #!defineMember _is_using_breather breather_pvar[0]

# rule "[roadhog/breather.opy]: Remove healing buff after breather":
#     @Event eachPlayer
#     @Hero roadhog
#     @Condition eventPlayer.isUsingAbility2()

#     wait(OW2_ROADHOG_BREATHER_DURATION, Wait.ABORT_WHEN_FALSE)
#     eventPlayer.setHealingReceived(percent(1/(1+OW2_ROADHOG_BREATHER_HEAL_BUFF)))
#     wait(OW2_ROADHOG_BREATHER_HEAL_BUFF_DURATION)
#     eventPlayer.setHealingReceived(100)

# rule "[roadhog/breather.opy]: OW1 Take a Breather":
#     @Event eachPlayer
#     @Hero roadhog
#     @Condition eventPlayer.isHoldingButton(Button.ABILITY_2)
#     @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) <= 0
#     @Condition not isCCd(eventPlayer)
#     @Condition not eventPlayer.isFiringPrimaryFire()
#     @Condition not eventPlayer.isUsingAbility1()
#     @Condition not eventPlayer.isUsingUltimate()
#     @Condition not eventPlayer.isMeleeing()

#     # activate ability
#     eventPlayer._is_using_breather = true
#     eventPlayer.setAbility2Enabled(false)
#     eventPlayer.setDamageReceived(percent((1-ADJ_ROADHOG_BREATHER_DAMAGE_REDUCTION)/(1-OW2_ROADHOG_BREATHER_DAMAGE_REDUCTION))) # reduce daamge intake
#     eventPlayer.allowButton(Button.SECONDARY_FIRE)
#     eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
#     wait(ADJ_ROADHOG_BREATHER_CAST_TIME)
#     wait(ADJ_ROADHOG_BREATHER_DURATION)
#     eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
#     eventPlayer.disallowButton(Button.SECONDARY_FIRE)
#     eventPlayer.setDamageReceived(100) # reset damage intake
#     wait(ADJ_ROADHOG_BREATHER_RECOVERY_TIME)
#     eventPlayer._is_using_breather = false

#     # cooldown
#     eventPlayer.setAbility2Enabled(true)
#     eventPlayer.setAbilityCooldown(Button.ABILITY_2, ADJ_ROADHOG_BREATHER_COOLDOWN)
#     eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_ROADHOG_BREATHER_COOLDOWN)

rule "[roadhog/breather.opy]: Breather cooldown logic":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isFiringSecondaryFire()
    
    waitUntil(not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    eventPlayer.breather_cooldown = ADJ_ROADHOG_BREATHER_COOLDOWN
    chase(eventPlayer.breather_cooldown, 0, rate=1, ChaseReeval.NONE)


rule "[roadhog/breather.opy]: Disable Breather if on cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.breather_cooldown > 0

    eventPlayer.setSecondaryFireEnabled(false)
    showBreatherCD()


rule "[roadhog/breather.opy]: Enable Breather if not on cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.breather_cooldown <= 0

    eventPlayer.setSecondaryFireEnabled(true)
    hideBreatherCD()


rule "[roadhog/breather.opy]: Allow self healing during Breather":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isFiringSecondaryFire()

    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    popSelfHealing(Button.ABILITY_2)
