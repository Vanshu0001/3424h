-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local ContextActionService = game:GetService("ContextActionService")
local Workspace = game:GetService("Workspace")

-- Variables
local LocalPlayer = Players.LocalPlayer
local yeeting = false
local AutoUltEnabled = false
local SemiAfkEnabled = false
local ESPEnabled = false
local AutoComboEnabled = false
local NoStunEnabled = false
local InvisibilityEnabled = false
local GodModeEnabled = false
local WalkspeedModifier = 16
local JumpPowerModifier = 50
local FlyEnabled = false
local NoDashCooldownEnabled = false

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local MinimizeButton = Instance.new("TextButton")
local ScrollingFrame = Instance.new("ScrollingFrame")
local DeviceSelectLabel = Instance.new("TextLabel")
local DeviceSelectDropdown = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local SingleTargetButton = Instance.new("TextButton")
local AutofarmButton = Instance.new("TextButton")
local AutoUltCheckbox = Instance.new("TextButton")
local SemiAfkCheckbox = Instance.new("TextButton")
local ESPButton = Instance.new("TextButton")
local WalkspeedSlider = Instance.new("TextBox")
local JumpPowerSlider = Instance.new("TextBox")
local InvisibilityButton = Instance.new("TextButton")
local GodModeButton = Instance.new("TextButton")
local AutoComboButton = Instance.new("TextButton")
local NoStunButton = Instance.new("TextButton")
local ForceResetButton = Instance.new("TextButton")
local HitboxSizeButton = Instance.new("TextButton")
local FlyButton = Instance.new("TextButton")
local NoDashCooldownButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local Watermark = Instance.new("TextLabel")

ScreenGui.Name = "PenzHub"
ScreenGui.Parent = game.CoreGui

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Size = UDim2.new(0, 300, 0, 500)
Frame.Position = UDim2.new(0, 50, 0, 50)
Frame.Active = true
Frame.Draggable = true

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = Frame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Position = UDim2.new(1, -25, 0, 5)
MinimizeButton.Text = "-"

ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Parent = Frame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -40)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 30)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 3, 0)

DeviceSelectLabel.Name = "DeviceSelectLabel"
DeviceSelectLabel.Parent = ScrollingFrame
DeviceSelectLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DeviceSelectLabel.Size = UDim2.new(0, 260, 0, 30)
DeviceSelectLabel.Position = UDim2.new(0, 10, 0, 10)
DeviceSelectLabel.Text = "Select Device:"

DeviceSelectDropdown.Name = "DeviceSelectDropdown"
DeviceSelectDropdown.Parent = ScrollingFrame
DeviceSelectDropdown.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
DeviceSelectDropdown.Size = UDim2.new(0, 260, 0, 30)
DeviceSelectDropdown.Position = UDim2.new(0, 10, 0, 50)
DeviceSelectDropdown.Text = "PC"

TextBox.Name = "TargetTextBox"
TextBox.Parent = ScrollingFrame
TextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TextBox.Size = UDim2.new(0, 260, 0, 30)
TextBox.Position = UDim2.new(0, 10, 0, 90)
TextBox.PlaceholderText = "Enter target name (leave empty for auto-targeting)"

SingleTargetButton.Name = "SingleTargetButton"
SingleTargetButton.Parent = ScrollingFrame
SingleTargetButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
SingleTargetButton.Size = UDim2.new(0, 260, 0, 30)
SingleTargetButton.Position = UDim2.new(0, 10, 0, 130)
SingleTargetButton.Text = "Target Kill"

AutofarmButton.Name = "AutofarmButton"
AutofarmButton.Parent = ScrollingFrame
AutofarmButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
AutofarmButton.Size = UDim2.new(0, 260, 0, 30)
AutofarmButton.Position = UDim2.new(0, 10, 0, 170)
AutofarmButton.Text = "Autofarm Semi-AFK"

AutoUltCheckbox.Name = "AutoUltCheckbox"
AutoUltCheckbox.Parent = ScrollingFrame
AutoUltCheckbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
AutoUltCheckbox.Size = UDim2.new(0, 260, 0, 30)
AutoUltCheckbox.Position = UDim2.new(0, 10, 0, 210)
AutoUltCheckbox.Text = "Auto Use Ult (Off)"

SemiAfkCheckbox.Name = "SemiAfkCheckbox"
SemiAfkCheckbox.Parent = ScrollingFrame
SemiAfkCheckbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
SemiAfkCheckbox.Size = UDim2.new(0, 260, 0, 30)
SemiAfkCheckbox.Position = UDim2.new(0, 10, 0, 250)
SemiAfkCheckbox.Text = "Semi-AFK (Off)"

ESPButton.Name = "ESPButton"
ESPButton.Parent = ScrollingFrame
ESPButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ESPButton.Size = UDim2.new(0, 260, 0, 30)
ESPButton.Position = UDim2.new(0, 10, 0, 290)
ESPButton.Text = "Toggle ESP (Off)"

WalkspeedSlider.Name = "WalkspeedSlider"
WalkspeedSlider.Parent = ScrollingFrame
WalkspeedSlider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
WalkspeedSlider.Size = UDim2.new(0, 260, 0, 30)
WalkspeedSlider.Position = UDim2.new(0, 10, 0, 330)
WalkspeedSlider.PlaceholderText = "Enter Walkspeed (default: 16)"

JumpPowerSlider.Name = "JumpPowerSlider"
JumpPowerSlider.Parent = ScrollingFrame
JumpPowerSlider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
JumpPowerSlider.Size = UDim2.new(0, 260, 0, 30)
JumpPowerSlider.Position = UDim2.new(0, 10, 0, 370)
JumpPowerSlider.PlaceholderText = "Enter Jump Power (default: 50)"

InvisibilityButton.Name = "InvisibilityButton"
InvisibilityButton.Parent = ScrollingFrame
InvisibilityButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
InvisibilityButton.Size = UDim2.new(0, 260, 0, 30)
InvisibilityButton.Position = UDim2.new(0, 10, 0, 410)
InvisibilityButton.Text = "Toggle Invisibility (Off)"

GodModeButton.Name = "GodModeButton"
GodModeButton.Parent = ScrollingFrame
GodModeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
GodModeButton.Size = UDim2.new(0, 260, 0, 30)
GodModeButton.Position = UDim2.new(0, 10, 0, 450)
GodModeButton.Text = "Toggle God Mode (Off)"

AutoComboButton.Name = "AutoComboButton"
AutoComboButton.Parent = ScrollingFrame
AutoComboButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
AutoComboButton.Size = UDim2.new(0, 260, 0, 30)
AutoComboButton.Position = UDim2.new(0, 10, 0, 490)
AutoComboButton.Text = "Toggle Auto Combo (Off)"

NoStunButton.Name = "NoStunButton"
NoStunButton.Parent = ScrollingFrame
NoStunButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
NoStunButton.Size = UDim2.new(0, 260, 0, 30)
NoStunButton.Position = UDim2.new(0, 10, 0, 530)
NoStunButton.Text = "Toggle No Stun (Off)"

HitboxSizeButton.Name = "HitboxSizeButton"
HitboxSizeButton.Parent = ScrollingFrame
HitboxSizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
HitboxSizeButton.Size = UDim2.new(0, 260, 0, 30)
HitboxSizeButton.Position = UDim2.new(0, 10, 0, 570)
HitboxSizeButton.Text = "Increase Hitbox Size"

FlyButton.Name = "FlyButton"
FlyButton.Parent = ScrollingFrame
FlyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
FlyButton.Size = UDim2.new(0, 260, 0, 30)
FlyButton.Position = UDim2.new(0, 10, 0, 610)
FlyButton.Text = "Toggle Fly (Off)"

NoDashCooldownButton.Name = "NoDashCooldownButton"
NoDashCooldownButton.Parent = ScrollingFrame
NoDashCooldownButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
NoDashCooldownButton.Size = UDim2.new(0, 260, 0, 30)
NoDashCooldownButton.Position = UDim2.new(0, 10, 0, 650)
NoDashCooldownButton.Text = "Toggle No Dash Cooldown (Off)"

ForceResetButton.Name = "ForceResetButton"
ForceResetButton.Parent = ScrollingFrame
ForceResetButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
ForceResetButton.Size = UDim2.new(0, 260, 0, 30)
ForceResetButton.Position = UDim2.new(0, 10, 0, 690)
ForceResetButton.Text = "Force Reset"

CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
CloseButton.Size = UDim2.new(0, 260, 0, 30)
CloseButton.Position = UDim2.new(0, 10, 1, -40)
CloseButton.Text = "Close"

Watermark.Name = "Watermark"
Watermark.Parent = Frame
Watermark.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Watermark.Size = UDim2.new(0, 300, 0, 30)
Watermark.Position = UDim2.new(0, 0, 1, -30)
Watermark.Text = "PenzHub by Imu and Nunez"
Watermark.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Function to create notifications
local function createNotification(text, duration)
    local notification = Instance.new("TextLabel")
    notification.Parent = ScreenGui
    notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    notification.Size = UDim2.new(0, 300, 0, 50)
    notification.Position = UDim2.new(1, 0, 0.5, 0)
    notification.AnchorPoint = Vector2.new(1, 0.5)
    notification.Text = text
    notification.Font = Enum.Font.SourceSans
    notification.TextSize = 24
    notification.Visible = true

    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Position = UDim2.new(1, -310, 0.5, 0)}
    local tween = TweenService:Create(notification, tweenInfo, goal)
    tween:Play()

    spawn(function()
        wait(duration)
        local tweenOut = TweenService:Create(notification, tweenInfo, {Position = UDim2.new(1, 0, 0.5, 0)})
        tweenOut:Play()
        tweenOut.Completed:Wait()
        notification:Destroy()
    end)
end

-- Popup notifications for the hub
createNotification("Feather X Penz Hub Online!", 5)
createNotification("PenzHub by Imu and Nunez", 5)
createNotification("https://discord.gg/getfeather", 5)

-- Function to simulate pressing a key
local function pressKey(key)
    ContextActionService:CallFunction(Enum.KeyCode[key], Enum.UserInputType.Keyboard)
end

-- Function to simulate skill usage by pressing keys 1, 2, 3, 4
local function simulateSkillUsage()
    for i = 1, 4 do
        pressKey(tostring(i))
        wait(0.1)
    end
    -- Use ultimate skill if auto ult is enabled
    if AutoUltEnabled then
        pressKey("G")  -- Assuming 'G' is the ultimate skill key
    end
end

-- Function to simulate mouse click
local function simulateMouseClick()
    VirtualUser:CaptureController()
    VirtualUser:Button1Down(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
    wait(0.1)
    VirtualUser:Button1Up(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
end

-- Function to get the closest player
local function getClosestPlayer()
    local closestDistance = math.huge
    local closestPlayer = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end
    return closestPlayer
end

-- Function to check if a player is dead
local function isPlayerDead(player)
    return not player.Character or not player.Character:FindFirstChild("HumanoidRootPart")
end

-- Function to yeet a player
local function yeetPlayer(targetPlayer)
    if not targetPlayer or isPlayerDead(targetPlayer) then
        return
    end
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local TargetHRP = targetPlayer.Character.HumanoidRootPart
    local LocalHRP = LocalPlayer.Character.HumanoidRootPart

    -- Start teleporting
    yeeting = true
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if yeeting and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalHRP.CFrame = TargetHRP.CFrame * CFrame.new(0, 0, 2) -- Minimal gap
        else
            connection:Disconnect()
        end
    end)

    while yeeting and not isPlayerDead(targetPlayer) do
        simulateSkillUsage()
        simulateMouseClick()
        wait(0.01) -- Short delay
    end

    yeeting = false
    local nextTarget = getClosestPlayer()
    if nextTarget then
        yeetPlayer(nextTarget)
    end
end

-- Function to continuously yeet players
local function autoYeet()
    while wait(0.1) do
        if not yeeting then
            local target = getClosestPlayer()
            if target then
                yeetPlayer(target)
            end
        end
    end
end

-- Function to enable ESP
local function enableESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, part in ipairs(player.Character:GetChildren()) do
                if part:IsA("BasePart") and not part:FindFirstChild("ESP") then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Name = "ESP"
                    box.Adornee = part
                    box.AlwaysOnTop = true
                    box.ZIndex = 1
                    box.Size = part.Size
                    box.Transparency = 0.5
                    box.Color3 = Color3.new(1, 0, 0)
                    box.Parent = part
                end
            end
        end
    end
end

-- Function to disable ESP
local function disableESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, part in ipairs(player.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    local esp = part:FindFirstChild("ESP")
                    if esp then
                        esp:Destroy()
                    end
                end
            end
        end
    end
end

-- Function to increase hitbox size
local function increaseHitboxSize()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, part in ipairs(player.Character:GetChildren()) do
                if part:IsA("BasePart") and part.Name == "HumanoidRootPart" then
                    part.Size = part.Size + Vector3.new(5, 5, 5)
                    part.Transparency = 0.5
                end
            end
        end
    end
end

-- Function to toggle fly
local function toggleFly()
    FlyEnabled = not FlyEnabled
    local BodyVelocity = Instance.new("BodyVelocity")
    local BodyGyro = Instance.new("BodyGyro")
    BodyVelocity.Velocity = Vector3.new(0, 0, 0)
    BodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    BodyGyro.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
    BodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
    BodyGyro.P = 3000

    if FlyEnabled then
        BodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
        BodyGyro.Parent = LocalPlayer.Character.HumanoidRootPart
        createNotification("Fly Enabled", 3)
    else
        BodyVelocity:Destroy()
        BodyGyro:Destroy()
        createNotification("Fly Disabled", 3)
    end

    RunService.RenderStepped:Connect(function()
        if FlyEnabled then
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.1, 0)
        end
    end)
end

-- Function to toggle no dash cooldown
local function toggleNoDashCooldown()
    NoDashCooldownEnabled = not NoDashCooldownEnabled
    createNotification(NoDashCooldownEnabled and "No Dash Cooldown Enabled" or "No Dash Cooldown Disabled", 3)
end

-- GUI Button Functions
MinimizeButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

SingleTargetButton.MouseButton1Click:Connect(function()
    local targetName = TextBox.Text
    if targetName == "" then
        local target = getClosestPlayer()
        if target then
            yeetPlayer(target)
        end
    else
        local targetPlayer = Players:FindFirstChild(targetName)
        if targetPlayer then
            yeetPlayer(targetPlayer)
        else
            createNotification("Player not found", 3)
        end
    end
end)

AutofarmButton.MouseButton1Click:Connect(function()
    autoYeet()
end)

AutoUltCheckbox.MouseButton1Click:Connect(function()
    AutoUltEnabled = not AutoUltEnabled
    AutoUltCheckbox.Text = AutoUltEnabled and "Auto Use Ult (On)" or "Auto Use Ult (Off)"
end)

SemiAfkCheckbox.MouseButton1Click:Connect(function()
    SemiAfkEnabled = not SemiAfkEnabled
    SemiAfkCheckbox.Text = SemiAfkEnabled and "Semi-AFK (On)" or "Semi-AFK (Off)"
    if SemiAfkEnabled then
        LocalPlayer.Idled:connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end)

ESPButton.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    ESPButton.Text = ESPEnabled and "Toggle ESP (On)" or "Toggle ESP (Off)"
    if ESPEnabled then
        enableESP()
    else
        disableESP()
    end
end)

WalkspeedSlider.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newWalkspeed = tonumber(WalkspeedSlider.Text)
        if newWalkspeed then
            WalkspeedModifier = newWalkspeed
            LocalPlayer.Character.Humanoid.WalkSpeed = WalkspeedModifier
        else
            createNotification("Invalid Walkspeed", 3)
        end
    end
end)

JumpPowerSlider.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newJumpPower = tonumber(JumpPowerSlider.Text)
        if newJumpPower then
            JumpPowerModifier = newJumpPower
            LocalPlayer.Character.Humanoid.JumpPower = JumpPowerModifier
        else
            createNotification("Invalid Jump Power", 3)
        end
    end
end)

InvisibilityButton.MouseButton1Click:Connect(function()
    InvisibilityEnabled = not InvisibilityEnabled
    InvisibilityButton.Text = InvisibilityEnabled and "Toggle Invisibility (On)" or "Toggle Invisibility (Off)"
    if InvisibilityEnabled then
        LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Transparency = 1
    else
        LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Transparency = 0
    end
end)

GodModeButton.MouseButton1Click:Connect(function()
    GodModeEnabled = not GodModeEnabled
    GodModeButton.Text = GodModeEnabled and "Toggle God Mode (On)" or "Toggle God Mode (Off)"
    if GodModeEnabled then
        LocalPlayer.Character:FindFirstChild("Humanoid").Health = math.huge
    else
        LocalPlayer.Character:FindFirstChild("Humanoid").Health = 100
    end
end)

AutoComboButton.MouseButton1Click:Connect(function()
    AutoComboEnabled = not AutoComboEnabled
    AutoComboButton.Text = AutoComboEnabled and "Toggle Auto Combo (On)" or "Toggle Auto Combo (Off)"
    if AutoComboEnabled then
        RunService.RenderStepped:Connect(function()
            simulateSkillUsage()
        end)
    end
end)

NoStunButton.MouseButton1Click:Connect(function()
    NoStunEnabled = not NoStunEnabled
    NoStunButton.Text = NoStunEnabled and "Toggle No Stun (On)" or "Toggle No Stun (Off)"
    if NoStunEnabled then
        -- Anti-stun logic here
    end
end)

HitboxSizeButton.MouseButton1Click:Connect(function()
    increaseHitboxSize()
end)

FlyButton.MouseButton1Click:Connect(function()
    toggleFly()
end)

NoDashCooldownButton.MouseButton1Click:Connect(function()
    toggleNoDashCooldown()
end)

ForceResetButton.MouseButton1Click:Connect(function()
    LocalPlayer.Character.Humanoid.Health = 0
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Device selection
DeviceSelectDropdown.MouseButton1Click:Connect(function()
    local dropdown = Instance.new("Frame")
    dropdown.Parent = Frame
    dropdown.Size = UDim2.new(0, 260, 0, 60)
    dropdown.Position = UDim2.new(0, 10, 0, 80)
    dropdown.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    
    local pcButton = Instance.new("TextButton")
    pcButton.Parent = dropdown
    pcButton.Size = UDim2.new(1, 0, 0.5, 0)
    pcButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    pcButton.Text = "PC"
    pcButton.MouseButton1Click:Connect(function()
        DeviceSelectDropdown.Text = "PC"
        -- Apply PC settings
        dropdown:Destroy()
    end)

    local mobileButton = Instance.new("TextButton")
    mobileButton.Parent = dropdown
    mobileButton.Size = UDim2.new(1, 0, 0.5, 0)
    mobileButton.Position = UDim2.new(0, 0, 0.5, 0)
    mobileButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    mobileButton.Text = "Mobile"
    mobileButton.MouseButton1Click:Connect(function()
        DeviceSelectDropdown.Text = "Mobile"
        -- Apply mobile settings
        dropdown:Destroy()
    end)
end)

-- Key bindings for fly and no dash cooldown
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        toggleFly()
    elseif input.KeyCode == Enum.KeyCode.C then
        toggleNoDashCooldown()
    end
end)
