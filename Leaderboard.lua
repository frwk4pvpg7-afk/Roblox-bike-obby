local DataStoreService = game:GetService("DataStoreService")
local levelStore = DataStoreService:GetDataStore("BikeObbyLevels_v1")

game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local level = Instance.new("IntValue")
    level.Name = "Level"
    level.Value = 1
    level.Parent = leaderstats

    -- Load player's saved level
    local savedLevel
    local success, err = pcall(function()
        savedLevel = levelStore:GetAsync(player.UserId)
    end)
    
    if success and savedLevel then
        level.Value = savedLevel
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    pcall(function()
        levelStore:SetAsync(player.UserId, player.leaderstats.Level.Value)
    end)
end)
