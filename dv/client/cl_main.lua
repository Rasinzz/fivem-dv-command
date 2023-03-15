RegisterCommand('dv', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(ped)

    if vehicle ~= 0 then
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)
    else
        local pedCoords = GetEntityCoords(ped)
        local vehicles = GetGamePool('CVehicle')

        for _, v in pairs(vehicles) do
            if #(pedCoords - GetEntityCoords(v)) <= 5.0 then
                SetEntityAsMissionEntity(v, true, true)
                DeleteVehicle(v)
            end
        end
    end
end, false)
