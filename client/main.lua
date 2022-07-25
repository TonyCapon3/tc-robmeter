local QBCore = exports['qb-core']:GetCoreObject()




RegisterNetEvent('tc-pmeter-rob', function()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            local time = math.random(7,10)
            local circles = math.random(2,4)
            local success = exports['qb-lock']:StartLockPickCircle(circles, time, success)
            if success then
                QBCore.Functions.Progressbar('rob_meter', 'Robbing Parking Meter', 15000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'anim@gangops@facility@servers@',
                anim = 'hotwire',
                flags = 16,
            }, {}, {}, function() 
                TriggerServerEvent('tc-pmeter-payout')
                ClearPedTasks(ped)
                TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lockpick"], "remove")
                policeAlert()
                delPmeter()

                if Config.Cash then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "coins", 0.5)
                end

                if Config.BlackMoney then
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["markedbills"], "add")
                end

            end, function() 
                ClearPedTasks(ped)
            end)
        else
            QBCore.Functions.Notify('Lockpick Bent Out Of Shape', 'error', 7500)
            TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lockpick"], "remove")
            policeAlert()
        end
        else
            QBCore.Functions.Notify('You Need A lockpick', 'error', 7500)
        end
    end, 'lockpick')
end)

function policeAlert()
    TriggerServerEvent("police:server:policeAlert", 'Parking Meter Robbery') --configure to your liking this is jus default
    -- exports['ps-dispatch']:ParkingMeterRobbery() -- or use ps-dispatch alert
end

function delPmeter()
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    for k, v in pairs(Config.ModelHashes) do
        local closestPark = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 1.5, v, false, 0, 0)
        SetEntityAsMissionEntity(closestPark, true, true)
        DeleteEntity(closestPark)
    end    
end


CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.Models, {
        options = {
            { 
                type = "client",
                event = "tc-pmeter-rob",
                icon = "fas fa-screwdriver",
                label = "Rob Parking Meter",
            },
        },
        distance = 1.5 
    })
end)


