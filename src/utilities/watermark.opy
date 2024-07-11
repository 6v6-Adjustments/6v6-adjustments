#!mainFile "../dev_main.opy"

globalvar rgb_list = [
    vect(255, 0, 0), # red
    vect(255, 255, 0), # yellow
    vect(0, 255, 0), # green
    vect(0, 255, 255), # cyan
    vect(0, 0, 255), # blue
    vect(255, 0, 255)] # magenta
globalvar SHOW_WATERMARK = createWorkshopSetting(bool, "Watermark", "Show Watermark", true, 0)
globalvar CYCLE_RGB = createWorkshopSetting(bool, "Watermark", "Cycle RGB", true, 1)

playervar watermark_pvar
#!defineMember _rgb_i watermark_pvar[0]
#!defineMember _gamemode_name_watermark_id watermark_pvar[1]
#!defineMember _discord_link_watermark_id watermark_pvar[2]
playervar rgb_vect
#!define RGB_DURATION 0.5

# #!define infoVisible(player) \
#     ((player.isInSpawnRoom()) \
#   or (player.isDead()) \
#   or (isInSetup()))

#!define infoVisible(player) (SHOW_WATERMARK)


rule "[utilities/watermark.opy]: Create watermark HUD":
    @Event eachPlayer
    @Condition SHOW_WATERMARK

    if eventPlayer._gamemode_name_watermark_id == null:
        hudSubheader(
            eventPlayer if infoVisible(eventPlayer) else null, 
            GAMEMODE_NAME" "GAMEMODE_VERSION" ""("GAMEMODE_CODE")", 
            HudPosition.LEFT, 
            0, 
            Color.WHITE, 
            HudReeval.VISIBILITY)
        eventPlayer._gamemode_name_watermark_id = getLastCreatedText()

    if eventPlayer._discord_link_watermark_id == null:
        hudSubheader(
            eventPlayer if infoVisible(eventPlayer) else null, 
            "Discord: " DISCORD_SHORT_LINK, 
            HudPosition.LEFT, 
            1, 
            rgb(eventPlayer.rgb_vect.x, eventPlayer.rgb_vect.y, eventPlayer.rgb_vect.z) if CYCLE_RGB else Color.WHITE, 
            HudReeval.VISIBILITY_AND_COLOR)
        eventPlayer._discord_link_watermark_id = getLastCreatedText()
    
    eventPlayer._rgb_i = 0
    eventPlayer.rgb_vect = rgb_list[eventPlayer._rgb_i]


rule "[utilities/watermark.opy]: Cycle watermark RGB":
    @Event eachPlayer
    @Condition infoVisible(eventPlayer)
    @Condition CYCLE_RGB

    do:
        eventPlayer._rgb_i = (eventPlayer._rgb_i + 1)%(len(rgb_list))
        chase(eventPlayer.rgb_vect, rgb_list[eventPlayer._rgb_i], duration=RGB_DURATION, ChaseReeval.NONE)
        waitUntil(eventPlayer.rgb_vect == rgb_list[eventPlayer._rgb_i], Math.INFINITY)
    while RULE_CONDITION
