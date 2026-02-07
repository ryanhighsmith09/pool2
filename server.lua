local games = {}

RegisterNetEvent('pool:startGame', function(tableId)
    games[tableId] = {
        players = { source },
        turn = source,
        balls = {},
        assigned = {}
    }
end)

RegisterNetEvent('pool:joinGame', function(tableId)
    table.insert(games[tableId].players, source)
end)

RegisterNetEvent('pool:shotTaken', function(tableId, force, direction)
    local game = games[tableId]
    if game.turn ~= source then return end

    TriggerClientEvent('pool:applyShot', -1, tableId, force, direction)

    -- rotate turn
    local players = game.players
    for i=1,#players do
        if players[i] == source then
            game.turn = players[i % #players + 1]
            break
        end
    end
end)
