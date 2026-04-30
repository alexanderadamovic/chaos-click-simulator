local part = script.Parent

part.Anchored = true
part.CanCollide = false
part.CanTouch = true

local debounce = {}

part.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)

	if player and not debounce[player] then
		debounce[player] = true

		local leaderstats = player:WaitForChild("leaderstats")
		local coins = leaderstats:WaitForChild("Coins")
		local multiplier = player:WaitForChild("Multiplier")

		coins.Value += multiplier.Value

		print("Added", multiplier.Value, "coins to", player.Name)

		task.wait(0.5)
		debounce[player] = false
	end
end)
