currentObjects = {};

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)


RegisterServerEvent('Disable')
AddEventHandler('Disable', function(blip)
    TriggerClientEvent('RemoveBlip', -1)
end)

RegisterServerEvent('GetData')
AddEventHandler('GetData', function(mode)
local identifiers = GetPlayerIdentifiers(source)
    if mode == "IP" then
        for k,v in pairs(identifiers) do
            if string.sub(v, 0, 3) == "ip:" then
                TriggerClientEvent('ReturnData', source, v)
            end
        end
    else
        for k,v in pairs(identifiers) do
            if string.sub(v, 0, 6) == "steam:" then
                TriggerClientEvent('ReturnData', source, v)
            end
        end
    end
end)


MySQL.query('SELECT * FROM scenemenu', {}, function(result)
    if result then
        for i = 1, #result do
            local row = result[i]
            vector = vector4(row.x, row.y, row.z, row.heading);
            table.insert(currentObjects, {id = row.id, vector = vector, objectName = row.objectName})
        end
    end
end)

RegisterServerEvent('scenemenu:getProps')
AddEventHandler('scenemenu:getProps', function()
    TriggerClientEvent('scenemenu:addPropsOnPlayer', source, currentObjects)
end)


RegisterNetEvent('scenemenu:addProp')
AddEventHandler('scenemenu:addProp', function(vector, objectName)
    local x, y, z, w = table.unpack(vector)

    local id = MySQL.insert.await('INSERT INTO scenemenu (x, y, z, heading, objectName) VALUES (?, ?, ?, ?, ?)', {x, y, z, w, objectName});
    table.insert(currentObjects, {id = id, vector = vector, objectName = objectName})

    TriggerClientEvent("scenemenu:addPropOnPlayer", -1, {id = id, vector = vector, objectName = objectName})
end);

RegisterNetEvent('scenemenu:removeProp')
AddEventHandler('scenemenu:removeProp', function(id, vector, objectName)
    local x, y, z = table.unpack(vector)

    MySQL.insert.await('DELETE FROM scenemenu WHERE id = ? AND objectName = ?', {id, objectName})
    table.insert(currentObjects, id);
    TriggerClientEvent("scenemenu:removePropOnPlayer", -1, {id = id, vector = vector, objectName = objectName})
end);

function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end
-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end