local GlobalData = ""

local currentObjectIndex = 1
local selectedObjectIndex = 1

local localObjects = {}
local resourcePropsLoaded = false

ESX = nil
if Config.UsageMode == "ESX_Job" then
    TriggerEvent('esx:getSharedObject', function(obj)
        ESX = obj
    end)
    ESX.PlayerData = ESX.GetPlayerData()
    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        ESX.PlayerData.job = job
    end)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent('scenemenu:getProps')
    resourcePropsLoaded = true;
    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('onResourceStart')
AddEventHandler('onResourceStart', function (resourceName)
    if resourcePropsLoaded == false then
        resourcePropsLoaded = true;
        TriggerServerEvent('scenemenu:getProps')
    end
end)

RegisterNetEvent('scenemenu:addPropsOnPlayer')
AddEventHandler('scenemenu:addPropsOnPlayer', function(props)
    Citizen.Wait(1000)
    for i in pairs(props) do
        Citizen.Wait(100)
        TriggerEvent('scenemenu:addPropOnPlayer', props[i])
    end
end);
RegisterNetEvent('scenemenu:addPropOnPlayer')
AddEventHandler('scenemenu:addPropOnPlayer', function(prop)
    local x, y, z, w = table.unpack(prop.vector)

    RequestModel(prop.objectName)
    while not HasModelLoaded(prop.objectName) do
        Citizen.Wait(1)
    end
    local hash = GetHashKey(prop.objectName);

    if DoesObjectOfTypeExistAtCoords(x, y, z, 0.9, hash, true) then
        return
    end

    local obj = CreateObject(hash, x, y, z, false, false);
    if(obj == 0) then
    else
        table.insert(localObjects, { id = prop.id, object = obj, objectName = prop.objectName })
        PlaceObjectOnGroundProperly(obj)
        SetEntityHeading(obj, w)
        FreezeEntityPosition(obj, true)
    end
end)
RegisterNetEvent('scenemenu:removePropOnPlayer')
AddEventHandler('scenemenu:removePropOnPlayer', function(prop)
    for k, v in pairs(localObjects) do
        if v.id == prop.id then
            table.remove(localObjects, k)
            DeleteObject(v.object)
        end
    end
end)

RegisterNetEvent('onResourceStop')
AddEventHandler('onResourceStop', function (resourceName)
    for k, v in pairs(localObjects) do
        DeleteObject(v.object)
    end
end)

Citizen.CreateThread(function()

    --[[ Initialize Menus / Submenus ]]--
    WarMenu.CreateMenu('mainmenu', 'Scene Menu')
    WarMenu.SetTitleBackgroundColor('mainmenu', 60, 137, 214, 255)
    WarMenu.SetMenuTextColor('mainmenu', 60, 137, 214, 255)
    -- Object Spawn Menu
    WarMenu.CreateSubMenu('objectsub', 'mainmenu', 'Objects Menu')
    WarMenu.SetTitleBackgroundColor('objectsub', 60, 137, 214, 255)
    WarMenu.SetMenuTextColor('objectsub', 60, 137, 214, 255)

    -- Close Menu
    WarMenu.CreateSubMenu('close', 'mainmenu', 'Close')
    WarMenu.SetTitleBackgroundColor('close', 60, 137, 214, 255)
    WarMenu.SetMenuTextColor('close', 60, 137, 214, 255)
    ------------------------
    --[[ Menu Building ]]--
    ------------------------

    while true do

        if WarMenu.IsMenuOpened('mainmenu') then

            if WarMenu.MenuButton('Object Menu', 'objectsub') then
            elseif WarMenu.MenuButton('Close', 'close') then
            end

            WarMenu.Display()

        end if WarMenu.IsMenuOpened('close') then
        WarMenu.CloseMenu()
    elseif WarMenu.IsMenuOpened('objectsub') then


        local objects = { }

        for k, v in pairs(Config.Objects) do
            for k, v in pairs(v) do
                if k == "Displayname" then
                    table.insert(objects, v)
                end
            end
        end

        if WarMenu.ComboBox('Object', objects, currentObjectIndex, selectedObjectIndex, function(currentIndex, selectedIndex)
            currentObjectIndex = currentIndex
            selectedObjectIndex = selectedIndex
        end) then

            local Player = GetPlayerPed(-1)
            local heading = GetEntityHeading(Player)
            local x, y, z = table.unpack(GetEntityCoords(Player, true))
            local object = objects[selectedObjectIndex]
            local hash = GetHashKey(Config.Objects[selectedObjectIndex].Object);
            if not DoesObjectOfTypeExistAtCoords(x, y, z, 0.9, hash, true) then
                TriggerServerEvent('scenemenu:addProp', vector4(x, y, z, heading), Config.Objects[selectedObjectIndex].Object)
            end

            Citizen.Wait(100);

        elseif WarMenu.Button('Delete', 'Nearest') then
            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))

            for k, v in pairs(localObjects) do
                local hash = GetHashKey(v.objectName)
                if DoesObjectOfTypeExistAtCoords(x, y, z, 0.9, hash, true) then
                    TriggerServerEvent('scenemenu:removeProp', v.id, vector, v.obj)
                    break;
                end
            end
            Citizen.Wait(100);

        end
        WarMenu.Display()
    end


        --[[ Menu Opening Functions ]]--

        if Config.ActivationMode == "Key" then

            if IsControlJustReleased(0, Config.ActivationKey) and GetLastInputMethod(0) then

                if Config.UsageMode == "ESX_Job" then
                    if ESX.GetPlayerData().job == nil then
                        ShowNotification("^1You are not in the correct Job to use this. 1")
                    else
                        if inArray(ESX.GetPlayerData().job.name, Config.WhitelistedJobs) then
                            WarMenu.OpenMenu('mainmenu')
                        else
                            ShowNotification("^1You are not in the correct Job to use this.")
                        end
                    end
                elseif Config.UsageMode == "Ped" then
                    pmodel = GetEntityModel(PlayerPedId())
                    if inArrayPed(pmodel, Config.WhitelistedPeds) then
                        WarMenu.OpenMenu('mainmenu')
                    else
                        ShowNotification("^1You are not in the correct ped to use this.")
                    end
                elseif Config.UsageMode == "IP" then

                    TriggerServerEvent("GetData", "IP")
                    Wait(100)
                    if inArray(GlobalData, Config.WhitelistedIPs) then
                        WarMenu.OpenMenu('mainmenu')
                    else
                        ShowNotification("^1You are not whitelisted to use this.")
                    end
                elseif Config.UsageMode == "Steam" then

                    TriggerServerEvent("GetData", "Steam")
                    Wait(100)
                    if inArraySteam(GlobalData, Config.WhitelistedSteam) then
                        WarMenu.OpenMenu('mainmenu')
                    else
                        ShowNotification("^1You are not whitelisted to use this.")
                    end

                elseif Config.UsageMode == "Everyone" then
                    WarMenu.OpenMenu('mainmenu')
                end

            end

        elseif Config.ActivationMode == "Command" then

            RegisterCommand(Config.ActivationCommand, function(source, args, rawCommand)

                if Config.UsageMode == "ESX_Job" then
                    if ESX.GetPlayerData().job == nil then
                        ShowNotification("^1You are not in the correct Job to use this.")
                    else
                        if inArray(ESX.GetPlayerData().job.name, Config.WhitelistedJobs) then
                            WarMenu.OpenMenu('mainmenu')
                        else
                            ShowNotification("^1You are not in the correct Job to use this.")
                        end
                    end
                elseif Config.UsageMode == "Ped" then

                    pmodel = GetEntityModel(PlayerPedId())
                    if inArrayPed(pmodel, Config.WhitelistedPeds) then
                        WarMenu.OpenMenu('mainmenu')
                    else
                        ShowNotification("^1You are not in the correct ped to use this.")
                    end
                elseif Config.UsageMode == "IP" then

                    TriggerServerEvent("GetData", "IP")
                    Wait(100)
                    if inArray(GlobalData, Config.WhitelistedIPs) then
                        WarMenu.OpenMenu('mainmenu')
                    else
                        ShowNotification("^1You are not whitelisted to use this.")
                    end
                elseif Config.UsageMode == "Steam" then

                    TriggerServerEvent("GetData", "Steam")
                    Wait(100)
                    if inArraySteam(GlobalData, Config.WhitelistedSteam) then
                        WarMenu.OpenMenu('mainmenu')
                    else
                        ShowNotification("^1You are not whitelisted to use this.")
                    end

                elseif Config.UsageMode == "Everyone" then
                    WarMenu.OpenMenu('mainmenu')
                end

            end, false)

        end

        Citizen.Wait(0)
    end

end)


------------------------
--[[ Network Events ]]--
------------------------

RegisterNetEvent('ReturnData')
AddEventHandler('ReturnData', function(data)

    GlobalData = data

end)

--------------------------
--[[ Useful Functions ]]--
--------------------------

function inArrayPed(value, array)
    for _, v in pairs(array) do
        if GetHashKey(v) == value then
            return true
        end
    end
    return false
end

function inArray(value, array)
    for _, v in pairs(array) do
        if v == value then
            return true
        end
    end
    return false
end

function inArraySteam(value, array)
    for _, v in pairs(array) do
        v = getSteamId(v)
        if v == value then
            return true
        end
    end
    return false
end

function isNativeSteamId(steamId)
    if string.sub(steamId, 0, 6) == "steam:" then
        return true
    end
    return false
end

function getSteamId(steamId)
    if not isNativeSteamId(steamId) then
        -- FiveM SteamID conversion
        steamId = "steam:" .. string.format("%x", tonumber(steamId))
    else
        steamId = string.lower(steamId) -- Lowercase conversion
    end
    return steamId
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
