-- Mobile Fly GUI by GPTScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- GUI Setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "FlyGUI"
gui.ResetOnSpawn = false

-- Draggable Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 140, 0, 50)
frame.Position = UDim2.new(0.5, -70, 0.85, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Toggle Button
