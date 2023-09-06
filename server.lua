ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

-- Define the job names for police and ambulance
local policeJobName = "police"
local ambulanceJobName = "ambulance"

ESX.RegisterUsableItem("darkweb_item", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem("darkweb_item", 1)

    TriggerClientEvent("darkweb:notify", source, "You have accessed the darkweb.")
end)

RegisterServerEvent("darkweb:use")
AddEventHandler("darkweb:use", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getInventoryItem("darkweb_item").count > 0 then
        TriggerClientEvent("darkweb:notify", _source, "You have accessed the darkweb.")
    else
        TriggerClientEvent("chatMessage", _source, "^1You need a darkweb item to access the darkweb.")
    end
end)

RegisterCommand("911", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    -- Send a chat message to all online players with the police or ambulance job
    local players = ESX.GetPlayers()

    for i = 1, #players do
        local target = ESX.GetPlayerFromId(players[i])
        if target.job.name == policeJobName or target.job.name == ambulanceJobName then
            TriggerClientEvent("chatMessage", target.source, "^3[911 Call] ^0" .. xPlayer.getName() .. ": " .. message)
        end
    end

    -- Discord webhook integration (replace 'WEBHOOK_URL' with your actual webhook URL)
    local webhookData = {
        content = "911 Call from " .. xPlayer.getName() .. ": " .. message,
    }

    PerformHttpRequest('WEBHOOK_URL', function(statusCode, text, headers)
    end, 'POST', json.encode(webhookData), { ['Content-Type'] = 'application/json' })
end, false)
