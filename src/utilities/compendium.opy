#!mainFile "../dev_main.opy"

#!define X_POS 0
#!define Y_POS 0

playervar compendium_pvar
#!defineMember _ability1_icon compendium_pvar[0]
#!defineMember _ability2_icon compendium_pvar[1]
#!defineMember _ability2_changes compendium_pvar[2]

# #!define compendiumVisible(player)\
#     (player.isInSpawnRoom()\
#  and player.isHoldingButton(Button.RELOAD))

 #!define compendiumVisible(player)\
 (player.isInSpawnRoom())

 #!define getChanges(hero, button)\
    ("100 damage, single charge")

def showCompendium():
    @Name "[utilities/compendium.opy]: showCompendium()"

    # ability 1
    if eventPlayer._ability1_icon == null:
        createInWorldText(
            eventPlayer if compendiumVisible(eventPlayer) else null,
            "{}".format(abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1)),
            updateEveryTick(eventPlayer.getEyePosition() + (100 * (
                -0.8 * worldVector(Vector.RIGHT, eventPlayer, Transform.ROTATION) + ((
                0.63 - 0.2) * (angleToDirection(horizontalAngleOfDirection(eventPlayer.getFacingDirection()),
            verticalAngleOfDirection(eventPlayer.getFacingDirection()) - 90))) + 3 * eventPlayer.getFacingDirection()))),
            7,
            Clip.NONE,
            WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR,
            Color.WHITE,
            SpecVisibility.DEFAULT)
        eventPlayer._ability1_icon = getLastCreatedText()

    # ability 2
    if eventPlayer._ability2_icon == null:
        createInWorldText(
            eventPlayer if compendiumVisible(eventPlayer) else null,
            "{}".format(abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2)),
            updateEveryTick(eventPlayer.getEyePosition() + (100 * (
                -0.8 * worldVector(Vector.RIGHT, eventPlayer, Transform.ROTATION) + ((
                0.13 - 0.2) * (angleToDirection(horizontalAngleOfDirection(eventPlayer.getFacingDirection()),
            verticalAngleOfDirection(eventPlayer.getFacingDirection()) - 90))) + 3 * eventPlayer.getFacingDirection()))),
            7,
            Clip.NONE,
            WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR,
            Color.WHITE,
            SpecVisibility.DEFAULT)
        eventPlayer._ability2_icon = getLastCreatedText()
    if eventPlayer._ability2_changes == null:
        createInWorldText(
            eventPlayer if compendiumVisible(eventPlayer) else null,
            "{}".format(getChanges(eventPlayer.getCurrentHero(), Button.ABILITY_1)),
            updateEveryTick(eventPlayer.getEyePosition() + (100 * (
                -0.4 * worldVector(Vector.RIGHT, eventPlayer, Transform.ROTATION) + ((
                0.63 - 0.2) * (angleToDirection(horizontalAngleOfDirection(eventPlayer.getFacingDirection()),
            verticalAngleOfDirection(eventPlayer.getFacingDirection()) - 90))) + 3 * eventPlayer.getFacingDirection()))),
            1.5,
            Clip.NONE,
            WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR,
            Color.WHITE,
            SpecVisibility.DEFAULT)
        eventPlayer._ability2_changes = getLastCreatedText()

def hideCompendium():
    @Name "[utilities/compendium.opy]: hideCompendium()"

    destroyInWorldText(eventPlayer._ability1_icon)
    eventPlayer._ability1_icon = null
    destroyInWorldText(eventPlayer._ability2_icon)
    eventPlayer._ability2_icon = null


rule "[utilities/compendium.opy]: Show Reinhardt Changes":
    @Event eachPlayer
    @Condition compendiumVisible(eventPlayer)

    showCompendium()
    waitUntil(not eventPlayer.isInSpawnRoom(), Math.INFINITY)
    hideCompendium()
