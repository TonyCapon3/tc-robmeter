# TC-ROBMETER
Parking Meter Robbery Script For QBCORE, Easy To Config! 

# PREVIEW
https://medal.tv/games/gta-v/clips/tKBvjwlp_WAJf/d1337015oUAD?invite=cr-MSxJN3AsNDIxNDM3MTcs

# DEPENDENCIES/INSTALLATION
https://github.com/qbcore-framework/qb-core

https://github.com/qbcore-framework/qb-target

https://github.com/Nathan-FiveM/qb-lock

DRAG coins.ogg FILE INTO [standalone]/interact-sound/html/sounds

# OPTIONAL
IF USING ps-dispatch THEN GO INTO THE client/main.lua and go to policeAlert() and uncomment the export
----------------------------------------------------------------------------------
PASTE THIS INTO ps-dispatch/server/sv_dispatchcodes.lua

`["parkingmeterrobbery"] =  {displayCode = '10-90', description = "Parking Meter(s) Being Robbed", radius = 0, recipientList = {'police'}, blipSprite = 267, blipColour = 4, blipScale = 1.5, blipLength = 2, sound = "robberysound", offset = "false"},`


PASTE THIS INTO ps-dispatch/client/cl_extraalerts.lua

```
local function ParkingMeterRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "parkingmeterrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = 'Parking Meter Robbery', -- message
        job = {"police"} -- jobs that will get the alerts
    })
end exports('ParkingMeterRobbery', ParkingMeterRobbery)

