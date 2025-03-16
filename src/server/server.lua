lib.callback.register("atlas:remove:repair:kit", function(ped)
    exports.ox_inventory:RemoveItem(ped, config.repairkit, 1)
end)