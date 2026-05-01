
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

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = leaderstats

	local multiplier = Instance.new("IntValue")
	multiplier.Name = "Multiplier"
	multiplier.Value = 1
	multiplier.Parent = player

	playerData[player] = {
		multiplier = 1
	}
end)

Players.PlayerRemoving:Connect(function(player)
	playerData[player] = nil
end)

coinClickEvent.OnServerEvent:Connect(function(player)
	local coins = player.leaderstats.Coins
	local multiplier = player.Multiplier

	coins.Value = coins.Value + multiplier.Value
end)

upgradeEvent.OnServerEvent:Connect(function(player, upgradeType)
	if upgradeType == "multiplier" then
		local coins = player.leaderstats.Coins
		local multiplier = player.Multiplier

		local cost = multiplier.Value * 10

		if coins.Value >= cost then
			coins.Value = coins.Value - cost
			multiplier.Value = multiplier.Value + 1
		end
	end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local purchaseEvent = ReplicatedStorage:WaitForChild("purchaseEvent")

local Upgrades = {
	smallUpgrade = { multiplierGain = 1,  cost = 50  },
	bigUpgrade   = { multiplierGain = 5,  cost = 200 },
	megaUpgrade  = { multiplierGain = 20, cost = 1000 },
}

purchaseEvent.OnServerEvent:Connect(function(player, upgradeName)
	local upgrade = Upgrades[upgradeName]
	if not upgrade then return end 

	local stats = player:FindFirstChild("leaderstats")
	if not stats then return end

	local coins = stats:FindFirstChild("Coins")
	local multiplier = stats:FindFirstChild("Multiplier")
	if not coins or not multiplier then return end

	
	if coins.Value < upgrade.cost then return end

	coins.Value -= upgrade.cost
	multiplier.Value += upgrade.multiplierGain
end)
