local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


local coinClickEvent = ReplicatedStorage:WaitForChild("CoinClick")
local upgradeEvent = ReplicatedStorage:WaitForChild("BuyUpgrade")


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameGui"
screenGui.Parent = playerGui


local coinsLabel = Instance.new("TextLabel")
coinsLabel.Size = UDim2.new(0, 200, 0, 50)
coinsLabel.Position = UDim2.new(0, 10, 0, 10)
coinsLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
coinsLabel.TextColor3 = Color3.new(1, 1, 1)
coinsLabel.TextScaled = true
coinsLabel.Text = "Coins: 0"
coinsLabel.Parent = screenGui


local upgradeButton = Instance.new("TextButton")
upgradeButton.Size = UDim2.new(0, 200, 0, 50)
upgradeButton.Position = UDim2.new(0, 10, 0, 70)
upgradeButton.BackgroundColor3 = Color3.new(0, 0.5, 0)
upgradeButton.TextColor3 = Color3.new(1, 1, 1)
upgradeButton.TextScaled = true
upgradeButton.Text = "Buy Multiplier (Cost: 10)"
upgradeButton.Parent = screenGui


local function updateCoins()
	local coins = player.leaderstats.Coins.Value
	coinsLabel.Text = "Coins: " .. coins
end
