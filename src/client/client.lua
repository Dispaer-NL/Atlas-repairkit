exports.ox_target:addGlobalVehicle({
    {
        name = "repair_vehicle",
        label = "Repair vehicle",
        icon = "fa-solid fa-wrench",
        onSelect = function(data)
            local ped = PlayerPedId()
            local veh = data.entity 
            
            RequestAnimDict(config.anim.dict)
            while not HasAnimDictLoaded(config.anim.dict) do 
                Wait(100)
            end 
            TaskPlayAnim(ped, config.anim.dict, config.anim.name, 8.0, -8.0, -1, 50, 0, false, false, false)
            


            local vehCoords = GetEntityCoords(veh)
            SetEntityCoordsNoOffset(veh, vehCoords.x, vehCoords.y, vehCoords.z, true, true, true)
            SetEntityVelocity(veh, 0.0, 0.0, 0.0)


            SetVehicleDoorOpen(veh, 4, false, false)
            if lib.progressCircle({
                name = "vehicle_repair",
                duration = config.duration * 1000,
                label = "Repairing vehicle",
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                    combat = true
                },
            }) then  
                lib.callback.await("atlas:remove:repair:kit", ped)
                SetEntityHealth(veh, 1000)
                SetVehicleFixed(veh)

                SetVehicleDoorShut(veh, 4, false)
                ClearPedTasks(ped)

                
            else 
                SetVehicleDoorShut(veh, 4, false)
                ClearPedTasks(ped)
            end

            SetEntityVelocity(veh, 0.0, 0.0, 0.0)

            
        end,
        canInteract = function(entity)
            local health = GetEntityHealth(entity)
            local count = exports.ox_inventory:Search('count', config.repairkit)
            local driverPed = GetPedInVehicleSeat(entity, -1) 
            return health < 1000 and count > 0 and driverPed == 0 
        end
    }
})
