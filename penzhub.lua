-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Variables
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local flying = false
local flySpeed = 50
local teleporting = false
local teleportTarget = nil
local autoFarm = false
local autoClick = false

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.Name = "PenzHubX_Feather"
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.BorderSizePixel = 0

-- Watermark
local Watermark = Instance.new("TextLabel", ScreenGui)
Watermark.Size = UDim2.new(0, 200, 0, 20)
Watermark.Position = UDim2.new(0, 10, 0, 10)
Watermark.Text = "PenzHubX | imu"
Watermark.TextColor3 = Color3.new(1, 1, 1)
Watermark.BackgroundColor3 = Color3.new(0, 0, 0)
Watermark.TextScaled = true
Watermark.BorderSizePixel = 0

-- Tabs
local Tabs = Instance.new("Frame", MainFrame)
Tabs.Size = UDim2.new(1, 0, 0, 30)
Tabs.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Tabs.BorderSizePixel = 0

local function createTab(name)
    local tab = Instance.new("TextButton", Tabs)
    tab.Size = UDim2.new(0, 100, 1, 0)
    tab.Text = name
    tab.TextColor3 = Color3.new(1, 1, 1)
    tab.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    tab.BorderSizePixel = 0
    return tab
end

local FlightTab = createTab("Flight")
local TeleportTab = createTab("Teleport")
local UtilitiesTab = createTab("Utilities")

-- Content Frames
local ContentFrames = {}

local function createContentFrame(name)
    local frame = Instance.new("Frame", MainFrame)
    frame.Size = UDim2.new(1, 0, 1, -30)
    frame.Position = UDim2.new(0, 0, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    ContentFrames[name] = frame
    return frame
end

local FlightFrame = createContentFrame("Flight")
local TeleportFrame = createContentFrame("Teleport")
local UtilitiesFrame = createContentFrame("Utilities")

local function updateSpeed(newSpeed)
    flySpeed = newSpeed
    SpeedText.Text = "Speed: " .. newSpeed
    Bar.Size = UDim2.new(newSpeed / 100, 0, 1, 0)
end

local function createButton(parent, text, position)
    local button = Instance.new("TextButton", parent)
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = position
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    button.BorderSizePixel = 0
    return button
end

local function enableFrame(name)
    for frameName, frame in pairs(ContentFrames) do
        frame.Visible = (frameName == name)
    end
end

FlightTab.MouseButton1Click:Connect(function() enableFrame("Flight") end)
TeleportTab.MouseButton1Click:Connect(function() enableFrame("Teleport") end)
UtilitiesTab.MouseButton1Click:Connect(function() enableFrame("Utilities") end)

-- Flight Controls
local SpeedSlider = Instance.new("Frame", FlightFrame)
SpeedSlider.Position = UDim2.new(0.5, -100, 0.1, 0)
SpeedSlider.Size = UDim2.new(0, 200, 0, 50)
SpeedSlider.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

local Bar = Instance.new("Frame", SpeedSlider)
Bar.Size = UDim2.new(0, 100, 1, 0)
Bar.BackgroundColor3 = Color3.new(0, 0.6, 0.8)

local SpeedText = Instance.new("TextLabel", SpeedSlider)
SpeedText.Size = UDim2.new(1, 0, 1, 0)
SpeedText.TextColor3 = Color3.new(1, 1, 1)
SpeedText.Text = "Speed: 50"
SpeedText.BackgroundTransparency = 1

SpeedSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local function updateInput()
            local newSpeed = math.clamp((input.Position.X - SpeedSlider.AbsolutePosition.X) / SpeedSlider.AbsoluteSize.X * 100, 0, 100)
            updateSpeed(newSpeed)
        end
        updateInput()
        input.Changed:Connect(updateInput)
    end
end)

-- Flight Button
local FlightButton = createButton(FlightFrame, "Toggle Flight", UDim2.new(0.5, -50, 0.4, 0))
FlightButton.MouseButton1Click:Connect(function()
    flying = not flying
    FlightButton.Text = flying and "Flight: ON" or "Flight: OFF"
    if flying then
        fly()
    end
end)

-- AutoFarm Button
local AutoFarmButton = createButton(FlightFrame, "AutoFarm Players", UDim2.new(0.5, -50, 0.6, 0))
AutoFarmButton.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    AutoFarmButton.Text = autoFarm and "AutoFarm: ON" or "AutoFarm: OFF"
    if autoFarm then
        autoFarmPlayers()
    end
end)

-- Auto Click M1 Button
local AutoClickButton = createButton(FlightFrame, "Auto Click M1", UDim2.new(0.5, -50, 0.8, 0))
AutoClickButton.MouseButton1Click:Connect(function()
    autoClick = not autoClick
    AutoClickButton.Text = autoClick and "Auto Click M1: ON" or "Auto Click M1: OFF"
end)

-- AutoFarm Function
local function autoFarmPlayers()
    while autoFarm do
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
                -- Move towards the target player's position
                humanoid:MoveTo(targetPlayer.Character.PrimaryPart.Position)
                
                -- Check if autoClick is enabled
                if autoClick then
                    -- Simulate left mouse button click
                    mouse1click()
                end
                
                -- Teleport to the target player's position every 0.1 seconds
                if teleporting then
                    teleportTo(targetPlayer.Character.PrimaryPart.Position)
                end
                
                wait(0.1)
            end
        end
    end
end

-- Fly Function
local function fly()
    local velocity = Vector3.new(0, 0, 0)
    local camera = workspace.CurrentCamera
    local newSpeed = flySpeed / 10
    while flying do
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            velocity = velocity + camera.CFrame.LookVector * newSpeed
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            velocity = velocity - camera.CFrame.RightVector * newSpeed
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            velocity = velocity - camera.CFrame.LookVector * newSpeed
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            velocity = velocity + camera.CFrame.RightVector * newSpeed
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            velocity = velocity + Vector3.new(0, newSpeed, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            velocity = velocity - Vector3.new(0, newSpeed, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
            character:BreakJoints()
            break
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.T) then
            player:LoadCharacter()
            break
        end
        
        -- Apply velocity
        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame + velocity)
        wait()
    end
end

-- Teleport Function
local function teleportTo(position)
    -- Teleport player to the given position
    character:SetPrimaryPartCFrame(CFrame.new(position))
end

-- Auto Click M1 Function
local function mouse1click()
    -- Simulate left mouse button click
    mouse1press()
    wait(0.05)
    mouse1release()
end

-- Listen for input to toggle features
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        flying = not flying
        if flying then
            fly()
        end
    elseif input.KeyCode == Enum.KeyCode.X then
        autoFarm = not autoFarm
        if autoFarm then
            autoFarmPlayers()
        end
    elseif input.KeyCode == Enum.KeyCode.Z then
        teleporting = not teleporting
    end
end)

