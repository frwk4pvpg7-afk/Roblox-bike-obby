-- Put this script inside obstacles or the void floor to reset players
script.Parent.Touched:Connect(function(hit)
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    if player then
        hit.Parent:BreakJoints() -- Resets the character
    end
end)
