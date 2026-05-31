local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SpawnBikeEvent = ReplicatedStorage:WaitForChild("SpawnBikeEvent")

SpawnBikeEvent.OnServerEvent:Connect(function(player)
    local level = player.leaderstats.Level.Value
    local bikeName = "Level1_Bike" -- Default bike

    -- Level checking logic
    if level >= 20 then
        bikeName = "Level20_Bike"
    elseif level >= 10 then
        bikeName = "Level10_Bike"
    elseif level >= 5 then
        bikeName = "Level5_Bike"
    end

    local bikeFolder = ReplicatedStorage:WaitForChild("Bikes")
    local selectedBike = bikeFolder:FindFirstChild(bikeName)

    if selectedBike then
        -- Clean up their old bike if it exists
        local existingBike = workspace:FindFirstChild(player.Name .. "_Bike")
        if existingBike then existingBike:Destroy() end

        -- Clone and spawn the new bike
        local newBike = selectedBike:Clone()
        newBike.Name = player.Name .. "_Bike"
        
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            -- Position the bike slightly above the player's checkpoint
            newBike:MoveTo(character.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
            newBike.Parent = workspace
        end
    else
        warn("Bike model not found in ReplicatedStorage: " .. bikeName)
    end
end)
