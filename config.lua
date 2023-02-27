Config = {}


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-------------CHANGE ALERT IN policeAlert() TO YOUR LIKING-------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Config.Cash = false           
                            --use either cash or markedbills if u want cash then set true vice versa
Config.BlackMoney = true

Config.MinCash = 500 --if Config.Cash = true
Config.MaxCash = 2000

Config.MinMarkedBills = 1 --if Config.BlackMoney = true
Config.MaxMarkedBills = 5
Config.MarkedBillWorthMin = 100
Config.MarkedBillWorthMax = 500

Config.Models = {
    'prop_parknmeter_02',
    'prop_parknmeter_01'
}

Config.ModelHashes = {
    -1940238623,        --prop_parknmeter_02
    2108567945          --prop_parknmeter_01

}
