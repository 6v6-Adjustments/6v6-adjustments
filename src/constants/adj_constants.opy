#!mainFile "../dev_main.opy"

# Universal
#!define ADJ_TANK_KNOCKBACK_REDUCTION 0.12
#!define ADJ_THROWABLES_WAIT_TIME 11

# Ana
#!define ADJ_ANA_AMMO_COUNT 12
#!define ADJ_ANA_BIOTIC_GRENADE_DAMAGE 60
#!define ADJ_ANA_BIOTIC_GRENADE_HEALING 100
#!define ADJ_ANA_SLEEP_DART_COOLDOWN_TIME 12
#!define ADJ_ANA_HEALTH 200
#!define ADJ_ANA_ULT_COST 2100

# Ashe
#!define ADJ_ASHE_HEALTH 200
#!define ADJ_ASHE_ULT_COST 2240

# Baptiste
#!define ADJ_BAPTISTE_BIOTIC_LAUNCHER_HEALING_DIRECT 40
#!define ADJ_BAPTISTE_BIOTIC_LAUNCHER_HEALING_SPLASH 35
#!define ADJ_BAPTISTE_HEALTH 200
#!define ADJ_BAPTISTE_LAMP_HP 100
#!define ADJ_BAPTISTE_PRIMARY_DAMAGE 24
#!define ADJ_BAPTISTE_REGEN_BURST_ALLY_HPS (75/ADJ_BAPTISTE_REGEN_BURST_DURATION)
#!define ADJ_BAPTISTE_REGEN_BURST_COOLDOWN 13
#!define ADJ_BAPTISTE_REGEN_BURST_DURATION 4
#!define ADJ_BAPTISTE_REGEN_BURST_SELF_HPS (150/ADJ_BAPTISTE_REGEN_BURST_DURATION)
#!define ADJ_BAPTISTE_ULT_COST 2310

# Bastion
#!define ADJ_BASTION_ARMOR 100
#!define ADJ_BASTION_ASSAULT_CONFIG_DPS 320
#!define ADJ_BASTION_HEALTH 200
#!define ADJ_BASTION_IRONCLAD_RESISTANCE 0.9
#!define ADJ_BASTION_RECONFIGURE_COOLDOWN 12
#!define ADJ_BASTION_RECONFIGURE_MOVESPEED 55
#!define ADJ_BASTION_SELF_DAMAGE_SCALER 0.5
#!define ADJ_BASTION_SELF_KNOCKBACK_SCALER 1.25
#!define ADJ_BASTION_ULT_COST 2310

# Brigitte
#!define ADJ_BRIGITTE_ARMOR 50
#!define ADJ_BRIGITTE_BASH_DURATION 0.3
#!define ADJ_BRIGITTE_BASH_COOLDOWN 5
#!define ADJ_BRIGITTE_BONUS_PACK_HEALING 10
#!define ADJ_BRIGITTE_FLAIL_DAMAGE 35
#!define ADJ_BRIGITTE_HEALTH 150
#!define ADJ_BRIGITTE_INSPIRE_TOTAL_HEALING 60
#!define ADJ_BRIGITTE_REPAIR_PACK_COOLDOWN 5
#!define ADJ_BRIGITTE_ULT_COST 2800

# Cassidy
#!define ADJ_MCCREE_COMBAT_ROLL_DAMAGE_REDUCTION 50
#!define ADJ_MCCREE_FAN_THE_HAMMER_DAMAGE 45
#!define ADJ_MCCREE_HEALTH 225
#!define ADJ_MCCREE_ULT_COST 1680

# Doomfist
#!define ADJ_DOOMFIST_BEST_DEFENSE 25
#!define ADJ_DOOMFIST_HAND_CANNON_DAMAGE 45
#!define ADJ_DOOMFIST_HEALTH 400
#!define ADJ_DOOMFIST_HEALTH_DUPLICATE 350
#!define ADJ_DOOMFIST_POWER_BLOCK_COOLDOWN 8
#!define ADJ_DOOMFIST_POWER_BLOCK_DURATION 1.5
#!define ADJ_DOOMFIST_SEISMIC_SLAM_COOLDOWN 6
#!define ADJ_DOOMFIST_ULT_COST 1932

# DVa
#!define ADJ_DVA_ARMOR 250
#!define ADJ_DVA_ARMOR_DUPLICATE 200
#!define ADJ_DVA_BOOSTER_DAMAGE 10
#!define ADJ_DVA_CANNON_DAMAGE 20.5
#!define ADJ_DVA_HEALTH 300
#!define ADJ_DVA_HEALTH_DUPLICATE 250
#!define ADJ_DVA_MATRIX_COOLDOWN 1.5
#!define ADJ_DVA_MATRIX_DURATION 2
#!define ADJ_DVA_PILOT_HEALTH 150
#!define ADJ_DVA_ULT_COST 1540

# Echo
globalvar SETTING_ECHO_TANK_HP = createWorkshopSetting(bool, "General Changes", "Full Echo Tank HP", false, 0)
#!define ADJ_ECHO_DUPLICATE_EXIT_HEALTH 100
#!define ADJ_ECHO_DUPLICATE_ULT_CHARGE_MULTIPLIER 5
#!define ADJ_ECHO_HEALTH 200
#!define ADJ_ECHO_STICKY_BOMBS_DAMAGE 170
#!define ADJ_ECHO_ULT_COST 2028

# Genji
#!define ADJ_GENJI_DEFLECT_DURATION 1.5
#!define ADJ_GENJI_HEALTH 200
#!define ADJ_GENJI_SHURIKEN_DAMAGE 29
#!define ADJ_GENJI_ULT_COST 1932

# Hanzo
#!define ADJ_HANZO_ARROW_DAMAGE 125
#!define ADJ_HANZO_HEALTH 200
#!define ADJ_HANZO_STORM_COOLDOWN 10
#!define ADJ_HANZO_STORM_DAMAGE 70
#!define ADJ_HANZO_STORM_QUANTITY 4
#!define ADJ_HANZO_ULT_COST 1680

# Illari
#!define ADJ_ILLARI_HEALTH 200
#!define ADJ_ILLARI_PYLON_COOLDOWN 8
#!define ADJ_ILLARI_PYLON_HEALING 35
#!define ADJ_ILLARI_PYLON_HEALTH 100
#!define ADJ_ILLARI_SOLAR_RIFLE_AMMO 12
#!define ADJ_ILLARI_SOLAR_RIFLE_DAMAGE 70
#!define ADJ_ILLARI_SOLAR_RIFLE_DAMAGE_CRIT 110
#!define ADJ_ILLARI_SOLAR_RIFLE_HEALING 115
#!define ADJ_ILLARI_SUNSTRUCK_DAMAGE 120
#!define ADJ_ILLARI_ULT_COST 2226

# JunkerQueen
#!define ADJ_JUNKERQUEEN_AMMO_COUNT 8
#!define ADJ_JUNKERQUEEN_ADRENALINE_HEAL_MOD 120
#!define ADJ_JUNKERQUEEN_BLADE_PULL_SCALER 0.60
#!define ADJ_JUNKERQUEEN_CARNAGE_BONUS_HEALING 25
#!define ADJ_JUNKERQUEEN_CARNAGE_IMPACT_DAMAGE 90
#!define ADJ_JUNKERQUEEN_HEALTH 425
#!define ADJ_JUNKERQUEEN_HEALTH_DUPLICATE 349.9
#!define ADJ_JUNKERQUEEN_RAMPAGE_WOUND_DAMAGE 60
#!define ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE 75
#!define ADJ_JUNKERQUEEN_SHOUT_COOLDOWN_TIME 14
#!define ADJ_JUNKERQUEEN_SHOUT_OVERHEALTH 100
#!define ADJ_JUNKERQUEEN_ULT_COST 2450

# Junkrat
#!define ADJ_JUNKRAT_CONCUSSION_MINE_COOLDOWN 8
#!define ADJ_JUNKRAT_FRAG_DAMAGE 115
#!define ADJ_JUNKRAT_HEALTH 200
#!define ADJ_JUNKRAT_ULT_COST 1925

# Kiriko
#!define ADJ_KIRIKO_HEALTH 200
#!define ADJ_KIRIKO_KUNAI_COUNT 12
#!define ADJ_KIRIKO_SWIFT_STEP_COOLDOWN 7
#!define ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN 5
#!define ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL 40
#!define ADJ_KIRIKO_SWIFT_STEP_SELF_HEAL_DURATION 0.25
#!define ADJ_KIRIKO_ULT_COST 2400

# Lifeweaver
#!define ADJ_LIFEWEAVER_HEALTH 100
#!define ADJ_LIFEWEAVER_HEALING_BLOSSOM_AMMO 14
#!define ADJ_LIFEWEAVER_PLATFORM_COOLDOWN 10
#!define ADJ_LIFEWEAVER_PLATFORM_HEALTH 300
#!define ADJ_LIFEWEAVER_SHIELDS 125
#!define ADJ_LIFEWEAVER_THORN_VOLLEY_AMMO 60
#!define ADJ_LIFEWEAVER_THORN_VOLLEY_DAMAGE 15
#!define ADJ_LIFEWEAVER_TREE_HEALTH 900
#!define ADJ_LIFEWEAVER_TREE_OF_LIFE_DURATION 12
#!define ADJ_LIFEWEAVER_ULT_COST 2000

# Lucio
#!define ADJ_LUCIO_HEALTH 200
#!define ADJ_LUCIO_SOUND_GUN_DAMAGE 20
#!define ADJ_LUCIO_SOUNDWAVE_DAMAGE 30
#!define ADJ_LUCIO_SOUNDWAVE_COOLDOWN 4
#!define ADJ_LUCIO_SOUNDWAVE_KNOCKBACK 6
#!define ADJ_LUCIO_ULT_COST 2940

# Mauga
#!define ADJ_MAUGA_ARMOR 150
#!define ADJ_MAUGA_ARMOR_DUPLICATE 125
#!define ADJ_MAUGA_BURN_DPS 20
#!define ADJ_MAUGA_BURN_RATE 7.9
# burn rate needs to be set slightly lower than target variable due to a rounding error
#!define ADJ_MAUGA_CAGE_DURATION 7
#!define ADJ_MAUGA_CARDIAC_COOLDOWN 16
#!define ADJ_MAUGA_CARDIAC_LIFESTEAL 0.5
#!define ADJ_MAUGA_CHAINGUN_DAMAGE 3.5
#!define ADJ_MAUGA_HEALTH 350
#!define ADJ_MAUGA_HEALTH_DUPLICATE 250
#!define ADJ_MAUGA_OVERRUN_COOLDOWN 8
#!define ADJ_MAUGA_ULT_COST 2400

# Mei
#!define ADJ_MEI_AMMO_COUNT 120
#!define ADJ_MEI_CRYO_HEALING 50
#!define ADJ_MEI_HEALTH 250
#!define ADJ_MEI_ICEWALL_HP 275
#!define ADJ_MEI_ICICLE_DAMAGE 75
#!define ADJ_MEI_ULT_COST 1610

# Mercy
#!define ADJ_MERCY_AMMO 20
#!define ADJ_MERCY_HEALTH 200
#!define ADJ_MERCY_ULT_COST 1820

# Moira
#!define ADJ_MOIRA_COALESCENCE_SPEED_BUFF 1.5
#!define ADJ_MOIRA_HEALTH 200
#!define ADJ_MOIRA_ULT_COST 2800

# Orisa
#!define ADJ_ORISA_ARMOR 250
#!define ADJ_ORISA_ARMOR_DUPLICATE 175
#!define ADJ_ORISA_FORTIFY_COOLDOWN 13
#!define ADJ_ORISA_FORTIFY_MOVESPEED 100
#!define ADJ_ORISA_HEALTH 200
#!define ADJ_ORISA_HEALTH_DUPLICATE 175
#!define ADJ_ORISA_JAVELIN_DIRECT_DAMAGE 70
#!define ADJ_ORISA_JAVELIN_SPIN_COOLDOWN 7
#!define ADJ_ORISA_TERRA_SURGE_MAX_DAMAGE 400
#!define ADJ_ORISA_ULT_COST 1814

# Pharah
#!define ADJ_PHARAH_ATTACK_RECOVERY 0.83
# slightly lower recovery speed to account for script execution time
#!define ADJ_PHARAH_CONCUSSIVE_BLAST_COOLDOWN 8
#!define ADJ_PHARAH_HEALTH 200
#!define ADJ_PHARAH_ULT_COST 2100

# Ramattra
#!define ADJ_RAMATTRA_ANNIHILATION_MOVESPEED 110
#!define ADJ_RAMATTRA_BARRIER_HEALTH 650
#!define ADJ_RAMATTRA_HEALTH 400
#!define ADJ_RAMATTRA_HEALTH_DUPLICATE 350
#!define ADJ_RAMATTRA_NEMESIS_ARMOR 200
#!define ADJ_RAMATTRA_NEMESIS_COOLDOWN 9
#!define ADJ_RAMATTRA_NEMESIS_MOVESPEED 100
#!define ADJ_RAMATTRA_PUMMEL_DAMAGE 70
#!define ADJ_RAMATTRA_ULT_COST 2016
#!define ADJ_RAMATTRA_VORTEX_COOLDOWN 12

# Reaper
#!define ADJ_REAPER_DEATH_BLOSSON_DAMAGE 170
#!define ADJ_REAPER_HEALTH 250
#!define ADJ_REAPER_HELLFIRE_SHOTGUNS_DAMAGE (5.8*20)
#!define ADJ_REAPER_SHADOW_STEP_COOLDOWN 8
#!define ADJ_REAPER_ULT_COST 2100

# Reinhardt
#!define ADJ_REINHARDT_ARMOR 250
#!define ADJ_REINHARDT_ARMOR_DUPLICATE 100
#!define ADJ_REINHARDT_BARRIER_HEALTH 1600
#!define ADJ_REINHARDT_BARRIER_REGEN 180
#!define ADJ_REINHARDT_CHARGE_COOLDOWN_TIME 10
#!define ADJ_REINHARDT_CHARGE_PIN_DAMAGE 300
#!define ADJ_REINHARDT_EARTHSHATTER_BASE_DAMAGE 50
#!define ADJ_REINHARDT_EARTHSHATTER_BONUS_DAMAGE 125
#!define ADJ_REINHARDT_FIRE_STRIKE_COOLDOWN_TIME 6
#!define ADJ_REINHARDT_FIRESTRIKE_DAMAGE 100
#!define ADJ_REINHARDT_HAMMER_DAMAGE 85
#!define ADJ_REINHARDT_HEALTH 300
#!define ADJ_REINHARDT_STEADAST_KNOCKBACK_REDUCTION 0.20
#!define ADJ_REINHARDT_ULT_COST 1540

# Roadhog
#!define ADJ_ROADHOG_BREATHER_COOLDOWN 3.5
#!define ADJ_ROADHOG_BREATHER_DURATION 1.075
#!define ADJ_ROADHOG_BREATHER_HEAL_TOTAL 299.5
#!define ADJ_ROADHOG_BREATHER_RECHARGE_DURATION 10
#!define ADJ_ROADHOG_HEALTH 600
#!define ADJ_ROADHOG_HEALTH_DUPLICATE 500
#!define ADJ_ROADHOG_HOOK_COOLDOWN_TIME 7
#!define ADJ_ROADHOG_HOOK_DAMAGE 5
#!define ADJ_ROADHOG_PIGPEN_DAMAGE 150
#!define ADJ_ROADHOG_SCRAP_GUN_DAMAGE 140
#!define ADJ_ROADHOG_ULT_COST 2240

# Sigma
#!define ADJ_SIGMA_ACCRETION_DAMAGE 90
#!define ADJ_SIGMA_ACCRETION_STUN_DURATION 0.7
#!define ADJ_SIGMA_BARRIER_REGEN 80
#!define ADJ_SIGMA_HEALTH 250
#!define ADJ_SIGMA_HEALTH_DUPLICATE 150
#!define ADJ_SIGMA_KINETIC_GRASP_COOLDOWN 13
#!define ADJ_SIGMA_KINETIC_GRASP_OVERHEALTH 0.4
#!define ADJ_SIGMA_SHIELDS 150
#!define ADJ_SIGMA_ULT_COST 1960

# Sojourn
#!define ADJ_SOJOURN_HEALTH 200
#!define ADJ_SOJOURN_ULT_COST 2100
#!define ADJ_SOJOURN_RAILGUN_AMMO 45
#!define ADJ_SOJOURN_SLIDE_COOLDOWN 9

# Soldier 76
#!define ADJ_SOLDIER_BIOTIC_FIELD_COOLDOWN 15
#!define ADJ_SOLDIER_BIOTIC_FIELD_DURATION 5
#!define ADJ_SOLDIER_HEALTH 200
#!define ADJ_SOLDIER_PULSE_RIFLE_DAMAGE 19.5
#!define ADJ_SOLDIER_ULT_COST 2310

# Sombra
#!define ADJ_SOMBRA_HEALTH 200
#!define ADJ_SOMBRA_SMG_DAMAGE 7.5
#!define ADJ_SOMBRA_VIRUS_COOLDOWN 7
#!define ADJ_SOMBRA_ULT_COST 1484

# Symmetra
#!define ADJ_SYMMETRA_HEALTH 100
#!define ADJ_SYMMETRA_SHIELDS 100
#!define ADJ_SYMMETRA_TURRET_HEALTH 30
#!define ADJ_SYMMETRA_ULT_COST 1680

# Torbjorn
#!define ADJ_TORBJORN_ARMOR 50
#!define ADJ_TORBJORN_HEALTH 200
#!define ADJ_TORBJORN_TURRET_HEALTH 225
#!define ADJ_TORBJORN_ULT_COST 2142

# Tracer
#!define ADJ_TRACER_HEALTH 150
#!define ADJ_TRACER_PULSE_PISTOL_DAMAGE 5.5
#!define ADJ_TRACER_RECALL_COOLDOWN 12.35
#!define ADJ_TRACER_ULT_COST 1260

# Venture
#!define ADJ_VENTURE_BURROW_DAMAGE 80
#!define ADJ_VENTURE_CLOBBER_DAMAGE 65
#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN 6.5
#!define ADJ_VENTURE_DRILL_DASH_DAMAGE 65
#!define ADJ_VENTURE_EXCAVATOR_DAMAGE 75
#!define ADJ_VENTURE_EXPLORER_SHIELDS 25
#!define ADJ_VENTURE_EXPLORER_SHIELDS_ULTIMATE 50
#!define ADJ_VENTURE_HEALTH 200
#!define ADJ_VENTURE_SPEED 6
#!define ADJ_VENTURE_TECTONIC_SHOCK_CRIT_MULTIPLIER 1.5
#!define ADJ_VENTURE_TECTONIC_SHOCK_CRIT_RADIUS 2.5
#!define ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE 110
#!define ADJ_VENTURE_ULT_COST 1925

# Widowmaker
#!define ADJ_WIDOWMAKER_HEALTH 175
#!define ADJ_WIDOWMAKER_ULT_COST 1540

# Winston
#!define ADJ_WINSTON_ARMOR 150
#!define ADJ_WINSTON_ARMOR_DUPLICATE 100
#!define ADJ_WINSTON_HEALTH 400
#!define ADJ_WINSTON_HEALTH_DUPLICATE 350
#!define ADJ_WINSTON_JUMP_PACK_COOLDOWN_TIME 6
#!define ADJ_WINSTON_TESLA_DAMAGE 60
#!define ADJ_WINSTON_ULT_COST 1540

# Wrecking Ball
#!define ADJ_WRECKING_BALL_ARMOR 100
#!define ADJ_WRECKING_BALL_ARMOR_DUPLICATE 50
#!define ADJ_WRECKING_BALL_FIREBALL_KB 1.13
#!define ADJ_WRECKING_BALL_FIREBALL_DAMAGE 50
#!define ADJ_WRECKING_BALL_GRAPPLE_COOLDOWN 5
#!define ADJ_WRECKING_BALL_HEALTH 450
#!define ADJ_WRECKING_BALL_HEALTH_DUPLICATE 400
#!define ADJ_WRECKING_BALL_MINEFIELD_DAMAGE 130
#!define ADJ_WRECKING_BALL_MINEFIELD_KNOCKBACK 5
#!define ADJ_WRECKING_BALL_PILEDRIVER_COOLDOWN_TIME 10
#!define ADJ_WRECKING_BALL_PILEDRIVER_DAMAGE 90
#!define ADJ_WRECKING_BALL_SHIELD_PER_TARGET 75
#!define ADJ_WRECKING_BALL_ULT_COST 1540

# Zarya
#!define ADJ_ZARYA_BUBBLE_DURATION 2
#!define ADJ_ZARYA_BARRIER_HEALTH 200
#!define ADJ_ZARYA_CANNON_DAMAGE_MAX 160
#!define ADJ_ZARYA_HEALTH 200
#!define ADJ_ZARYA_PARTICLE_BARRIER_COOLDOWN_TIME 10
#!define ADJ_ZARYA_PROJECTED_BARRIER_COOLDOWN_TIME 8
#!define ADJ_ZARYA_SHIELDS 200
#!define ADJ_ZARYA_SHIELDS_DUPLICATE 150
#!define ADJ_ZARYA_ULT_COST 2100

# Zenyatta
#!define ADJ_ZENYATTA_HEALTH 50
#!define ADJ_ZENYATTA_SHIELDS 150
#!define ADJ_ZENYATTA_ULT_COST 2310
