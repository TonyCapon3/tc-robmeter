local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('tc-pmeter-payout', function()
    if Config.Cash then
        local amount = math.random(Config.MinCash,Config.MaxCash)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', amount)
        TriggerClientEvent('QBCore:Notify', src, 'You got $ '..amount..'!', 'success') 
    end
    
    if Config.BlackMoney then
        local amount = math.random(1,5)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem('markedbills', amount)
        TriggerClientEvent('QBCore:Notify', src, 'You got '..amount..' marked bills!', 'success') 
    end

        
end)
