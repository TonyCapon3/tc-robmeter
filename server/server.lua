local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('tc-pmeter:server:final', function(item, amt)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amt)
end)

RegisterNetEvent('tc-pmeter-payout', function()
    if Config.Cash then
        local amount = math.random(Config.MinCash,Config.MaxCash)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', amount)
        TriggerClientEvent('QBCore:Notify', src, 'You got $ '..amount..'!', 'success') 
    end
    
    if Config.BlackMoney then
        local amount = math.random(Config.MinMarkedBills,Config.MaxMarkedBills)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local info = {
            worth = math.random(Config.MarkedBillWorthMin,Config.MarkedBillWorthMax)
        }
        Player.Functions.AddItem('markedbills', amount, false, info)
        --Player.Functions.AddItem('markedbills', amount, false, info)
        TriggerClientEvent('QBCore:Notify', src, 'You got '..amount..' marked bills!', 'success') 
    end

        
end)
