-- Scene Menu - By Infinity Studios (123LladdCae/KJ)
-- This config file was created to help you configure the code in server.lua and client.lua a lot easier. Please do NOT edit those files.
Config = {}

Config.UsageMode = "ESX_Job" -- Who can use the menu? Options: 'Everyone', 'Steam', 'IP', 'Ped', 'ESX_Job'
Config.ActivationMode = "Key" -- Choose how the menu is opened, options are: 'Key','Command'. 
Config.ActivationKey = 104 -- Use the following link to find the numbers, default 166 = F5: https://docs.fivem.net/game-references/controls/
Config.ActivationCommand = "scenemenu" -- The command used to open the menu if ActivationMode is 'Command'. (Automatically adds /)


--[[

USED WITH 'Ped' MODE!

Array below is a list of peds that are allowed to use the menu.
If the player activating is not in a ped in here, the menu will not open.
Ignore if not using Ped mode
Add peds following the template below...

]]--
Config.WhitelistedPeds = {
    's_m_y_cop_01',
}

--[[

USED WITH 'IP' MODE!

Array below is a list of IPs that are allowed to use the menu.
If the player's IP isn't included in the list below, the menu will not open.
Ignore if not using the IP mode.
Add IPs following the template below...

]]--
Config.WhitelistedIPs = {
    'ip:127.0.0.1',
}

--[[

USED WITH 'Steam' MODE!

Array below is a list of steam ID's that are allowed to use the menu.
If the player's SteamID64 isn't included in the list below, the menu will not open.
Ignore if not using the Steam mode.
MUST USE STEAMID64!! Can be found in many sites like: https://steamid.io/
Add ID's following the template below...

]]--
Config.WhitelistedSteam = {
    '76561198191725723',
}


--[[

USED WITH 'Jobs' MODE!

]]--

Config.WhitelistedJobs = {
    "lsmd", "police", "lspd"
}


--[[ OBJECT CONFIGURATION! --

This is the configuration section to add objects to the object menu and remove existing ones too!

To add an object, simply follow the below template and add it between the dashed lines below...

 { Displayname = "OBJECTNAME", Object = "SPAWNCODE" },

]]--
Config.Objects = {
    { Displayname = "Police Barrier", Object = "prop_barrier_work05" },
    { Displayname = "Big Cone", Object = "prop_roadcone01a" },
    { Displayname = "Small Cone", Object = "prop_roadcone02b" },
    { Displayname = "Gazebo", Object = "prop_gazebo_02" },
    { Displayname = "Scene Lights", Object = "prop_worklight_03b" },

    { Displayname = "Small Road Cone", Object =  "prop_roadcone02c", stopPeds = true}, -- 1
    { Displayname = "Large Road Cone", Object =  "prop_roadcone01a", stopPeds = true}, -- 2
    { Displayname = "Road Closed", Object =  "prop_barrier_work05", stopPeds = true}, -- 3
    { Displayname = "Scene Light", Object =  "prop_worklight_04d", stopPeds = false}, -- 4
    { Displayname = "Flagger Paddle", Object =  "prop_flagger_sign_01" },
    { Displayname = "Scene Lights", Object =  "prop_worklight_03b" },
    { Displayname = "Large Striped Cone", Object =  "prop_roadcone01a" },
    { Displayname = "Large Cone", Object =  "prop_roadcone01c" },
    { Displayname = "Medium Striped Cone", Object =  "prop_roadcone02a" },
    { Displayname = "Medium Cone", Object =  "prop_roadcone02c" },
    { Displayname = "Delineator", Object =  "prop_mp_cone_04" },
    { Displayname = "Road Work Flag", Object =  "prop_consign_flag_01" },
    { Displayname = "Work Crew Flag", Object =  "prop_consign_flag_21" },
    { Displayname = "Utility Work Flag", Object =  "prop_consign_flag_18" },
    { Displayname = "Shoulder Work Flag", Object =  "prop_consign_flag_19" },
    { Displayname = "Right Lane Closed Flag", Object =  "prop_consign_flag_02" },
    { Displayname = "Left Lane Closed Flag", Object =  "prop_consign_flag_03" },
    { Displayname = "Right Lane Ends Flag", Object =  "prop_consign_flag_04" },
    { Displayname = "Left Lane Ends Flag", Object =  "prop_consign_flag_05" },
    { Displayname = "Keep Left Flag", Object =  "prop_consign_flag_13" },
    { Displayname = "Keep Right Flag", Object =  "prop_consign_flag_14" },
    { Displayname = "Flagger Ahead Flag", Object =  "prop_consign_flag_08" },
    { Displayname = "Flagger Symbol Flag", Object =  "prop_consign_flag_06" },
    { Displayname = "Prepare to Stop Flag", Object =  "prop_consign_flag_07" },
    { Displayname = "Road Closed Ahead Flag", Object =  "prop_consign_flag_10" },
    { Displayname = "Road Closed Flag", Object =  "prop_consign_flag_09" },
    { Displayname = "Detour Ahead Flag", Object =  "prop_consign_flag_25" },
    { Displayname = "Detour Left/Right Flag", Object =  "prop_consign_flag_26" },
    { Displayname = "Detour Left Flag", Object =  "prop_consign_flag_27" },
    { Displayname = "Detour Right Flag", Object =  "prop_consign_flag_28" },
    { Displayname = "Detour Straight Flag", Object =  "prop_consign_flag_29" },
    { Displayname = "Traffic Incident Flag", Object =  "prop_consign_flag_11" },
    { Displayname = "Emergency Scene Flag", Object =  "prop_consign_flag_22" },
    { Displayname = "Road Flooded Flag", Object =  "prop_consign_flag_15" },
    { Displayname = "Fire Activity Flag", Object =  "prop_consign_flag_16" },
    { Displayname = "Tow Truck Flag", Object =  "prop_consign_flag_17" },
    { Displayname = "Check Point Flag", Object =  "prop_consign_flag_12" },
    { Displayname = "Pilot Car Flag", Object =  "prop_consign_flag_23" },
    { Displayname = "Fines Doubled Flag", Object =  "prop_consign_flag_24" },
    { Displayname = "Mower Ahead Flag", Object =  "prop_consign_flag_20" },
    { Displayname = "Slow Flag", Object =  "prop_consign_flag_30" },
    { Displayname = "Stop Flag", Object =  "prop_consign_flag_stop" },
    { Displayname = "custom Flag", Object =  "prop_consign_flag_custom" },
    { Displayname = "Road Work Barrier", Object =  "prop_barrier_sign_01" },
    { Displayname = "Work Crew Barrier", Object =  "prop_barrier_sign_21" },
    { Displayname = "Utility Work Barrier", Object =  "prop_barrier_sign_18" },
    { Displayname = "Shoulder Work Barrier", Object =  "prop_barrier_sign_19" },
    { Displayname = "Right Lane Closed Barrier", Object =  "prop_barrier_sign_02" },
    { Displayname = "Left Lane Closed Barrier", Object =  "prop_barrier_sign_03" },
    { Displayname = "Right Lane Ends Barrier", Object =  "prop_barrier_sign_04" },
    { Displayname = "Left Lane Ends Barrier", Object =  "prop_barrier_sign_05" },
    { Displayname = "Keep Left Barrier", Object =  "prop_barrier_sign_13" },
    { Displayname = "Keep Right Barrier", Object =  "prop_barrier_sign_14" },
    { Displayname = "Flagger Ahead Barrier", Object =  "prop_barrier_sign_08" },
    { Displayname = "Flagger Symbol Barrier", Object =  "prop_barrier_sign_06" },
    { Displayname = "Prepare to Stop Barrier", Object =  "prop_barrier_sign_07" },
    { Displayname = "Road Closed Ahead Barrier", Object =  "prop_barrier_sign_10" },
    { Displayname = "Road Closed Barrier", Object =  "prop_barrier_sign_09" },
    { Displayname = "Detour Ahead Barrier", Object =  "prop_barrier_sign_25" },
    { Displayname = "Detour Arrow Barricade", Object =  "prop_barrier_sign_detour" },
    { Displayname = "Detour Left/Right Barrier", Object =  "prop_barrier_sign_26" },
    { Displayname = "Detour Left Barrier", Object =  "prop_barrier_sign_27" },
    { Displayname = "Detour Right Barrier", Object =  "prop_barrier_sign_28" },
    { Displayname = "Detour Straight Barrier", Object =  "prop_barrier_sign_29" },
    { Displayname = "Traffic Incident Barrier", Object =  "prop_barrier_sign_11" },
    { Displayname = "Emergency Scene Barrier", Object =  "prop_barrier_sign_22" },
    { Displayname = "Road Flooded Barrier", Object =  "prop_barrier_sign_15" },
    { Displayname = "Fire Activity Barrier", Object =  "prop_barrier_sign_16" },
    { Displayname = "Tow Truck Barrier", Object =  "prop_barrier_sign_17" },
    { Displayname = "Check Point Barrier", Object =  "prop_barrier_sign_12" },
    { Displayname = "Pilot Car Barrier", Object =  "prop_barrier_sign_23" },
    { Displayname = "Fines Doubled Barrier", Object =  "prop_barrier_sign_24" },
    { Displayname = "Mower Ahead Barrier", Object =  "prop_barrier_sign_20" },
    { Displayname = "Slow Barrier", Object =  "prop_barrier_sign_30" },
    { Displayname = "Custom Barrier", Object =  "prop_barrier_sign_custom" },
    { Displayname = "Stop Barrier", Object =  "prop_barrier_sign_stop" },
    { Displayname = "Police Barricade", Object =  "prop_barrier_work05" },
    { Displayname = "Striped Barricade", Object =  "prop_barrier_work06a" },
    { Displayname = "Road Work Barricade", Object =  "prop_barrier_work06b" },
    { Displayname = "Street Closed Barricade", Object =  "prop_barrier_work06c" },
    { Displayname = "Sidewalk Closed Barricade", Object =  "prop_barrier_work06d" },
    { Displayname = "Road Barrel w/ Base", Object =  "prop_barrier_wat_03a" },
    { Displayname = "Road Barrel", Object =  "prop_barrier_wat_03b" },
    { Displayname = "Small Barricade", Object =  "prop_barrier_work01a" },
    { Displayname = "Small Barricade w/ Light", Object =  "prop_barrier_work02a" },
    { Displayname = "Road Work Type-III Barricade", Object =  "prop_barrier_work04a" },
    { Displayname = "Type-III Barricade (Left)", Object =  "prop_barrier_work04b" },
    { Displayname = "Type-III Barricade (Right)", Object =  "prop_barrier_work04br" },
    { Displayname = "Type-III Barricade (Left w/ lights)", Object =  "prop_barrier_work04c" },
    { Displayname = "Type-III Barricade (Right w/ lights)", Object =  "prop_barrier_work04cr" },
    { Displayname = "Type-III Road Closed (Left)", Object =  "prop_barrier_work04dx" },
    { Displayname = "Type-III Road Closed (Right)", Object =  "prop_barrier_work04drx" },
    { Displayname = "Type-III Road Closed (Left w/ lights)", Object =  "prop_barrier_work04d" },
    { Displayname = "Type-III Road Closed (Right w/ light)", Object =  "prop_barrier_work04dr" },
    { Displayname = "Type-III Detour (Left)", Object =  "prop_barrier_work04ex" },
    { Displayname = "Type-III Detour (Right)", Object =  "prop_barrier_work04erx" },
    { Displayname = "Type-III Detour (Left w/ lights)", Object =  "prop_barrier_work04e" },
    { Displayname = "Type-III Detour (Right w/ lights)", Object =  "prop_barrier_work04er" },
    { Displayname = "Left Arrow Board", Object =  "prop_trafficdiv_01" },
    { Displayname = "Right Arrow Board", Object =  "prop_trafficdiv_02" }

    ---------------------------------------------------------------
    ---------------------- Add more below! ------------------------
    -----------------------v-------------v-------------------------

    ---------------------------------------------------------------
}

-- Watch this space! ;)