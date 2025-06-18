-- Lunax Vehicle Speed GUI
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "VehicleSpeedGUI"

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 140)
frame.Position = UDim2.new(0.5, -125, 0.4, -70)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Vehicle Speed Changer"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- Speed Input
local speedBox = Instance.new("TextBox", frame)
speedBox.Size = UDim2.new(0.8, 0, 0, 30)
speedBox.Position = UDim2.new(0.1, 0, 0.4, 0)
speedBox.PlaceholderText = "Enter speed"
speedBox.Text = ""
speedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 14

-- Apply Button
local applyButton = Instance.new("TextButton", frame)
applyButton.Size = UDim2.new(0.8, 0, 0, 30)
applyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
applyButton.Text = "Apply Speed"
applyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
applyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
applyButton.Font = Enum.Font.GothamBold
applyButton.TextSize = 14

-- Apply speed logic
applyButton.MouseButton1Click:Connect(function()
    local speed = tonumber(speedBox.Text)
    if not speed then return end

    -- Find the vehicle seat the player is in
    local seat
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("VehicleSeat") and v.Occupant == player.Character:FindFirstChildOfClass("Humanoid") then
                seat = v
                break
            end
        end
    end

    if seat then
        seat.MaxSpeed = speed
        seat.Torque = 50000
        seat.TurnSpeed = 75
    end
end)
