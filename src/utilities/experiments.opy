#!mainFile "../dev_main.opy"

globalvar ramattra_steadfast = createWorkshopSetting(bool, "Experimental", "Ramattra - Reduce Knockback In Nemesis", false, 0)
globalvar nemesis_meter = createWorkshopSetting(bool, "Experimental", "Ramattra - Blocking Uses Resource Meter", false, 1)
globalvar nemesis_maximum = createWorkshopSetting(float[0.5:8], 'Experimental', 'Ramattra - Blocking Maximum Duration', ADJ_RAMATTRA_MAX_BLOCK_DEFAULT, 2)
globalvar nemesis_recharge = createWorkshopSetting(int[1:100], 'Experimental', 'Ramattra - Blocking Resource % Recharge/Second', ADJ_RAMATTRA_BLOCK_RECHARGE_PERCENT_DEFAULT, 3)
globalvar slowly_dragonblade = createWorkshopSetting(bool, "Experimental", "Genji - Reduced Dragonblade Swing Speed", false, 4)
globalvar railgun_nocrit = createWorkshopSetting(bool, "Experimental", "Sojourn - Remove Critical Railgun Damage", false, 5)
globalvar widow_dot = createWorkshopSetting(bool, "Experimental", "Widowmaker - Convert Headshots to DoT", false, 6)
globalvar timed_pylon = createWorkshopSetting(bool, "Experimental", "Illari - Pylon Breaks Over Time", false, 7)
globalvar pylon_duration = createWorkshopSetting(float[2.5:30], 'Experimental', 'Illari - Pylon Maximum Duration', ADJ_PYLON_DURATION_DEFAULT, 8)
globalvar instant_rez = createWorkshopSetting(bool, "Experimental", "Mercy - Resurrect Only In Valkyrie", false, 9)
