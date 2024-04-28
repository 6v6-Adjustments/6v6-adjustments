#!mainFile "../dev_main.opy"

settings {
    "main": {
        "modeName": GAMEMODE_NAME + " " + GAMEMODE_VERSION,
        "description": GAMDMODE_DESCRIPTION,
    },
    "lobby": {
        "spectatorSlots": 12,
        "team1Slots": 6,
        "team2Slots": 0,
        "pauseGameOnDisconnect": true,
    },
    "gamemodes": {
        "practiceRange": {
            "enabledMaps": [ "practiceRange" ]
        },
        "general": {
            "heroLimit": "1PerTeam",
            "roleLimit": "2OfEachRolePerTeam",
            "gamemodeStartTrigger": "allSlotsFilled",
            "tankPassiveHealthBonus": "disabled",
            "randomHeroRoleLimitPerTeam": 2,
            "enableCompetitiveRules": true
        }
    },
    "heroes": {
        "allTeams": {
            "ana": {
                "ability1Cooldown%": percent(ADJ_ANA_SLEEP_DART_COOLDOWN_TIME/OW2_ANA_SLEEP_DART_COOLDOWN_TIME),
                "ultGen%": percent(OW2_ANA_ULT_COST/ADJ_ANA_ULT_COST)
            },
            "ashe": {
                "ultGen%": percent(OW2_ASHE_ULT_COST/ADJ_ASHE_ULT_COST)
            },
            "baptiste": {
                "ability1Cooldown%": percent(ADJ_BAPTISTE_REGEN_BURST_COOLDOWN/OW2_BAPTISTE_REGEN_BURST_COOLDOWN),
                "ultGen%": percent(OW2_BAPTISTE_ULT_COST/ADJ_BAPTISTE_ULT_COST)
            },
            "bastion": {
                "ultGen%": percent(OW2_BASTION_ULT_COST/ADJ_BASTION_ULT_COST)
            },
            "brigitte": {
                "ability2Cooldown%": percent(ADJ_BRIGITTE_REPAIR_PACK_COOLDOWN/OW2_BRIGITTE_REPAIR_PACK_COOLDOWN),
                "ultGen%": percent(OW2_BRIGITTE_ULT_COST/ADJ_BRIGITTE_ULT_COST)
            },
            "mccree": {
                "ultGen%": percent(OW2_MCCREE_ULT_COST/ADJ_MCCREE_ULT_COST)
            },
            "dva": {
                "secondaryFireMaximumTime%": percent(ADJ_DVA_MATRIX_DURATION/OW2_DVA_MATRIX_DURATION),
                "ultGen%": percent(OW2_DVA_ULT_COST/ADJ_DVA_ULT_COST)
            },
            "doomfist": {
                "ability1Cooldown%": percent(ADJ_DOOMFIST_SEISMIC_SLAM_COOLDOWN/OW2_DOOMFIST_SEISMIC_SLAM_COOLDOWN),
                "ability2Cooldown%": percent(ADJ_DOOMFIST_POWER_BLOCK_COOLDOWN/OW2_DOOMFIST_POWER_BLOCK_COOLDOWN),
                "secondaryFireKb%": 0,
                "ultGen%": percent(OW2_DOOMFIST_ULT_COST/ADJ_DOOMFIST_ULT_COST)
            },
            "echo": {
                "ultGen%": percent(OW2_ECHO_ULT_COST/ADJ_ECHO_ULT_COST)
            },
            "genji": {
                "ultGen%": percent(OW2_GENJI_ULT_COST/ADJ_GENJI_ULT_COST)
            },
            "hanzo": {
                "ability2Cooldown%": percent(ADJ_HANZO_STORM_COOLDOWN/OW2_HANZO_STORM_COOLDOWN),
                "ability2Quantity%": ADJ_HANZO_STORM_QUANTITY,
                "ultGen%": percent(OW2_HANZO_ULT_COST/ADJ_HANZO_ULT_COST)
            },
            "illari": {
                "ability2Cooldown%": percent(ADJ_ILLARI_PYLON_COOLDOWN/OW2_ILLARI_PYLON_COOLDOWN),
                "ultGen%": percent(OW2_ILLARI_ULT_COST/ADJ_ILLARI_ULT_COST)
            },
            "junkerQueen": {
                "ultGen%": 107
            },
            "junkrat": {
                "ability1Cooldown%": percent(ADJ_JUNKRAT_CONCUSSION_MINE_COOLDOWN/OW2_JUNKRAT_CONCUSSION_MINE_COOLDOWN),
                "ultGen%": 110
            },
            "kiriko": {
                "ultGen%": percent(OW2_KIRIKO_ULT_COST/ADJ_KIRIKO_ULT_COST)
            },
            "lifeweaver": {
                "secondaryFireCooldown%": 83,
                "secondaryFireHealth%": 75,
                "ultHealth%": 75,
                "ultGen%": 111
            },
            "lucio": {
                "ultGen%": 106
            },
            "mauga": {
                "primaryFireIgniteDamage": 152,
                "primaryFireIgniteRate": 125,
                "ability1Cooldown%": 166
            },
            "mei": {
                "ultFreezeMinimum%": 30,
                "ultGen%": 110
            },
            "moira": {
                "ultGen%": 95
            },
            "orisa": {
                "ultGen%": 116
            },
            "pharah": {
                "ability2Cooldown%": percent(ADJ_PHARAH_CONCUSSIVE_BLAST_COOLDOWN/OW2_PHARAH_CONCUSSIVE_BLAST_COOLDOWN),
                "ultGen%": 110
            },
            "ramattra": {
                "ability1Cooldown%": percent(ADJ_RAMATTRA_NEMESIS_COOLDOWN/OW2_RAMATTRA_NEMESIS_COOLDOWN)
            },
            "reaper": {
                "ability2Cooldown%": percent(ADJ_REAPER_SHADOW_STEP_COOLDOWN/OW2_REAPER_SHADOW_STEP_COOLDOWN),
                "ultGen%": 103
            },
            "reinhardt": {
                "secondaryFireRechargeRate%": percent(ADJ_REINHARDT_BARRIER_REGEN/OW2_REINHARDT_BARRIER_REGEN),
                "ability1Cooldown%": percent(ADJ_REINHARDT_CHARGE_COOLDOWN_TIME/OW2_REINHARDT_CHARGE_COOLDOWN_TIME),
                "ultGen%": 107
            },
            "roadhog": {
                "secondaryFireMaximumTime%": percent(ADJ_ROADHOG_BREATHER_DURATION/OW2_ROADHOG_BREATHER_DURATION),
                "secondaryFireRechargeRate%": percent(ADJ_ROADHOG_BREATHER_RECHARGE_DURATION/OW2_ROADHOG_BREATHER_RECHARGE_DURATION),
                "ultGen%": 107
            },
            "sigma": {
                "secondaryFireRechargeRate%": percent(ADJ_SIGMA_BARRIER_REGEN/OW2_SIGMA_BARRIER_REGEN),
                "ability1Cooldown%": percent(ADJ_SIGMA_KINETIC_GRASP_COOLDOWN/OW2_SIGMA_KINETIC_GRASP_COOLDOWN),
                "ultGen%": 107
            },
            "sojourn": {
                "ultGen%": 110
            },
            "soldier": {
                "ability2Cooldown%": percent(ADJ_SOLDIER_BIOTIC_FIELD_COOLDOWN/OW2_SOLDIER_BIOTIC_FIELD_COOLDOWN),
                "ultGen%": 111
            },
            "sombra": {
                "ultGen%": 95
            },
            "symmetra": {
                "ultGen%": 112
            },
            "torbjorn": {
                "ultGen%": 110
            },
            "tracer": {
                "ability2Cooldown%": percent(ADJ_TRACER_RECALL_COOLDOWN/OW2_TRACER_RECALL_COOLDOWN),
                "ultGen%": 110
            },
            "venture": {
                "secondaryFireCooldown%": percent(ADJ_VENTURE_DRILL_DASH_COOLDOWN/OW2_VENTURE_DRILL_DASH_COOLDOWN)
            },
            "widowmaker": {
                "ultGen%": 110
            },
            "winston": {
                "ultGen%": 113
            },
            "hammond": {
                "ability1Kb%": percent(ADJ_WRECKING_BALL_FIREBALL_KB/OW2_WRECKING_BALL_FIREBALL_KB),
                "ability3Cooldown%": percent(ADJ_WRECKING_BALL_PILEDRIVER_COOLDOWN_TIME/OW2_WRECKING_BALL_PILEDRIVER_COOLDOWN_TIME),
                "ultGen%": 109
            },
            "general": {
                "ultGen%": 108
            }
        }
    }
}
