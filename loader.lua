-- Lunax Fly GUI Script
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Create GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "FlyGUI"

local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 120, 0, 40)
button.Position = UDim2.new(0.5, -60, 0.85, 0)
button.Text = "Fly: OFF"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.BorderSizePixel = 0
button.AutoButtonColor = true

-- Fly variables
local flying = false
local speed = 50
local bv, bg = nil, nil
local moveVec = Vector3.zero

-- Movement input handler
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if not flying then return end

	if input.KeyCode == Enum.KeyCode.W then moveVec = Vector3.new(0, 0, -1) end
	if input.KeyCode == Enum.KeyCode.S then moveVec = Vector3.new(0, 0, 1) end
	if input.KeyCode == Enum.KeyCode.A then moveVec = Vector3.new(-1, 0, 0) end
	if input.KeyCode == Enum.KeyCode.D then moveVec = Vector3.new(1, 0, 0) end
	if input.KeyCode == Enum.KeyCode.Space then moveVec
