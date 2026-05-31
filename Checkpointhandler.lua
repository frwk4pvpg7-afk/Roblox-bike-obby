-- Name your checkpoint parts "Checkpoint1", "Checkpoint2", etc., in the workspace
for _, checkpoint in pairs(workspace:GetChildren()) do
    if string.sub(checkpoint.Name, 1, 10) == "Checkpoint" then
        checkpoint.Touched:Connect(function(hit)
            local player = game.Players:GetPlayerFromCharacter(hit.Parent)
            if player then
                local checkpointNum = tonumber(string.sub(checkpoint.Name, 11))
                local currentLevel = player.leaderstats.Level.Value
                
                -- Only level up if they are reaching a new, higher checkpoint
                if checkpointNum == currentLevel + 1 then
                    player.leaderstats.Level.Value = checkpointNum
                end
            end
        end)
    end
end
