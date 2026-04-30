
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")


local coinClickEvent = Instance.new("RemoteEvent")
coinClickEvent.Name = "CoinClick"
coinClickEvent.Parent = ReplicatedStorage

local upgradeEvent = Instance.new("RemoteEvent")
upgradeEvent.Name = "BuyUpgrade"
upgradeEvent.Parent = ReplicatedStorage


local playerData = {}


Players.PlayerAdded:Connect(function(player)
	-
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = leaderstats


	playerData[player] = {
		multiplier = 1
	}
end)


coinClickEvent.OnServerEvent:Connect(function(player)
	local coins = player.leaderstats.Coins
	local multiplier = playerData[player].multiplier
	coins.Value = coins.Value + multiplier
end)


upgradeEvent.OnServerEvent:Connect(function(player, upgradeType)
	if upgradeType == "multiplier" then
		local coins = player.leaderstats.Coins
		local cost = playerData[player].multiplier * 10

		if coins.Value >= cost then
			coins.Value = coins.Value - cost
			playerData[player].multiplier = playerData[player].multiplier + 1
		end
	end
end)
