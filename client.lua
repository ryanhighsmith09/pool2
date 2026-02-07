CreateThread(function()
    for _,tableData in pairs(Config.Tables) do
        RequestModel(tableData.model)
        while not HasModelLoaded(tableData.model) do Wait(0) end

        local table = CreateObject(
            tableData.model,
            tableData.coords,
            false,
            false,
            false
        )
        SetEntityHeading(table, tableData.heading)
        FreezeEntityPosition(table, true)
    end
end)
