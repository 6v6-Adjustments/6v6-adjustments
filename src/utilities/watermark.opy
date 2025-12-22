#!mainFile "../dev_main.opy"


globalvar SHOW_WATERMARK = createWorkshopSetting(bool, "Watermark", "Show Watermark", true, 0)
playervar watermark_pvar

macro infoVisible(player):
    SHOW_WATERMARK


rule "[utilities/watermark.opy]: Create watermark HUD":
    @Event eachPlayer
    @Condition SHOW_WATERMARK

    if eventPlayer.watermark_pvar == null:
        hudSubheader(
            eventPlayer if infoVisible(eventPlayer) else null, 
            GAMEMODE_NAME" "GAMEMODE_VERSION" ""("GAMEMODE_CODE")", 
            HudPosition.LEFT, 
            0, 
            Color.WHITE, 
            HudReeval.VISIBILITY)
        eventPlayer.watermark_pvar = getLastCreatedText()
