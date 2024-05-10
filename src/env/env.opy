#!mainFile "../main.opy"

# Environment Variables
#!define GAMEMODE_VERSION "Internal Build"
#!define GAMEMODE_NAME "6v6 Adjustments"
#!define GAMDMODE_DESCRIPTION (GAMEMODE_NAME + " " + GAMEMODE_VERSION + " " + "(" + GAMEMODE_CODE + ")" + "\n" + \
                               "\n" + \
                               "Intended for 6v6 gameplay, by Toastie#11770" + "\n" + \
                               "\n" + \
                               "Primary workshop development provided" + "\n" + \
                               "by LemonHead#11820 and ecksdee#11729" + "\n" + \
                               "\n" + \
                               "Gamemode originally forked from" + "\n" + \
                               "Overwatch 1 Emulator v1.12.2 (KHTG0)" + "\n" + \
                               "by ecksdee#11729" + "\n" + \
                               "\n" + \
                               "Come join the discord server!" + "\n" + \
                               "We host 6v6 custom lobbies every weekend!" + "\n" + \
                               "\n" + \
                               DISCORD_SHORT_LINK + "\n" + \
                               DISCORD_LONG_LINK + "\n" + \
                               SOURCE_CODE_LINK)
#!define GAMEMODE_CODE "7HSKW"
#!define DEV_CODE "NSQSSS"
#!define DISCORD_SHORT_LINK "6v6.info"
#!define DISCORD_LONG_LINK "https://discord.gg/uzFUQu7G4s"
#!define SOURCE_CODE_LINK "github.com/6v6-Adjustments/6v6-adjustments"

rule "Copyright (c) 2024 Overwatch 1 Emulator & 6v6 Adjustments. See github.com/6v6-Adjustments/6v6-adjustments for license to use this code.":
    disableInspector()
