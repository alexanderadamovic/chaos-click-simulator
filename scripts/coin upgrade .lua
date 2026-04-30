local part = script.Parent

part.Anchored = true
part.CanCollide = false
part.CanTouch = true

local debounce = {}

part.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)

	if player and not debounce[player] then
		debounce[player] = true

		local coins = player.leaderstats.Coins
		local multiplier = player.Multiplier

		local cost = multiplier.Value * 10

		if coins.Value >= cost then
			coins.Value -= cost
			multiplier.Value += 1

			print(player.Name .. " upgraded! Multiplier is now " .. multiplier.Value)
		else
			print("Not enough coins")
		end

		task.wait(1)
		debounce[player] = false
	end
end)
