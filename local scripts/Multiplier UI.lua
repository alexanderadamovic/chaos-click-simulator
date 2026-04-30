# This Script goes under ScreenGUI and is a local script

local player = game.Players.LocalPlayer

local screenGui = script.Parent

local multiplierLabel = screenGui:WaitForChild("MultiplierLabel")
local upgradeCostLabel = screenGui:WaitForChild("UpgradeCostLabel")

local multiplier = player:WaitForChild("Multiplier")

multiplierLabel.Visible = true
upgradeCostLabel.Visible = true

multiplierLabel.Size = UDim2.new(0, 220, 0, 50)
multiplierLabel.Position = UDim2.new(0, 10, 0, 60)
multiplierLabel.BackgroundTransparency = 0
multiplierLabel.TextScaled = true

upgradeCostLabel.Size = UDim2.new(0, 260, 0, 50)
upgradeCostLabel.Position = UDim2.new(0, 10, 0, 115)
upgradeCostLabel.BackgroundTransparency = 0
upgradeCostLabel.TextScaled = true

local function updateUI()
	local value = multiplier.Value
	local cost = value * 10

	multiplierLabel.Text = "Multiplier: x" .. value
	upgradeCostLabel.Text = "Next Upgrade: " .. cost .. " coins"
end

multiplier:GetPropertyChangedSignal("Value"):Connect(updateUI)

updateUI()
