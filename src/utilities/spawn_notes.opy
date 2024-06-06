#!mainFile "../dev_main.opy"

globalvar PATCH_NOTES = createWorkshopSetting(bool, "Patch Notes", "patch notes", true)


rule "Spawn Notes":
    @Condition PATCH_NOTES == true
    @Event eachPlayer
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition eventPlayer.isMoving() == false
    
    destroyAllInWorldTexts()
    createInWorldText(eventPlayer, eventPlayer.getCurrentHero(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 2 + vect(0, 0.2, 0), 2, Clip.NONE, WorldTextReeval.NONE, eventPlayer.getTeam(), SpecVisibility.NEVER)
    createInWorldText(eventPlayer, "Turn Around for Patch", eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 2 + vect(0, 0, 0), 1, Clip.NONE, WorldTextReeval.NONE, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(eventPlayer, "Stats", eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 2 + vect(0, -0.2, 0), 0.9, Clip.NONE, WorldTextReeval.NONE, Color.WHITE, SpecVisibility.DEFAULT)
    #Primary
    createInWorldText(eventPlayer, "Primary", eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * -2 + vect(0, 0.6, 0), 0.9, Clip.NONE, WorldTextReeval.NONE, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(eventPlayer, "Primary", eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * -2 + vect(0, 0.5, 0), 1, Clip.NONE, WorldTextReeval.NONE, Color.WHITE, SpecVisibility.DEFAULT)
    #Secondary
    createInWorldText(eventPlayer, "Secondary", eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * -2 + vect(0, 0.4, 0), 0.9, Clip.NONE, WorldTextReeval.NONE, Color.WHITE, SpecVisibility.DEFAULT)