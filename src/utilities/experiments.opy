#!mainFile "../dev_main.opy"

globalvar timed_pylon = createWorkshopSetting(bool, "Experimental", "Illari: Pylon Breaks Over Time", false, 1)
globalvar pylon_duration = createWorkshopSetting(float[0.1:30], 'Experimental', 'Maximum Pylon Duration', ADJ_RESPAWN_ASSIST_REDUCTION_DEFAULT)
globalvar nemesis_meter createWorkshopSetting(bool, "Experimental", "Ramattra: Blocking Uses Resource Meter", false, 1)
globalvar widow_dot createWorkshopSetting(bool, "Experimental", "Widowmaker: Convert Headshots to DoT", false, 1)
