local cooldowns = {
    darkweb = 0,
    emergency = 0,
}

RegisterCommand("darkweb", function()
    local currentTime = GetGameTimer()
    local cooldown = cooldowns.darkweb

    if currentTime >= cooldown then
        TriggerServerEvent("darkweb:use")
        cooldowns.darkweb = currentTime + 60000 -- 60 seconds cooldown
    else
        TriggerEvent("chatMessage", "^1Darkweb is on cooldown.")
    end
end, false)

RegisterCommand("911", function(source, args)
    local message = table.concat(args, " ")
    local currentTime = GetGameTimer()
    local cooldown = cooldowns.emergency

    if currentTime >= cooldown then
        TriggerServerEvent("emergency:report", message)
        cooldowns.emergency = currentTime + 300000 -- 300 seconds cooldown
    else
        TriggerEvent("chatMessage", "^1You must wait before sending another 911 message.")
    end
end, false)

RegisterNetEvent("darkweb:notify")
AddEventHandler("darkweb:notify", function(message)
    TriggerEvent("chatMessage", "^3[Darkweb] ^0" .. message)
end)

-- CSS for notifications
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.5, 0.5)
        SetTextColour(255, 255, 255, 255)
        SetTextOutline()
        SetTextEntry("STRING")

        AddTextComponentString("Your notification message here")

        DrawText(0.15, 0.8)
    end
end)

