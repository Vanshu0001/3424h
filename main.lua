-- Condom class definition
local Condom = {}
Condom.__index = Condom

function Condom:new()
    local instance = {
        state = "Unused"
    }
    setmetatable(instance, Condom)
    return instance
end

function Condom:use()
    self.state = "Used"
    print("Condom is now used.")
end

-- Cum class definition
local Cum = {}
Cum.__index = Cum

local canRoll = true
local rollCooldown = 5

function Cum.network_cum(times)
    for i = 1, times do
        print("Cumming " .. i .. " time(s)")
        Cum.createCumAnimation()
    end
    Cum.showGui()
end

function Cum.createCumAnimation()
    print("Creating cum animation...")
end

function Cum.summonEntity()
    print("Summoning entity...")
end

function Cum.clearGui()
    local player = game.Players.LocalPlayer
    for _, child in ipairs(player:WaitForChild("PlayerGui"):GetChildren()) do
        if child:IsA("ScreenGui") and child.Name == "CumGui" then
            child:Destroy()
        end
    end
end

function Cum.showGui()
    local player = game.Players.LocalPlayer

    Cum.clearGui()

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CumGui"
    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false

    local guiFrame = Instance.new("Frame")
    guiFrame.Size = UDim2.new(0, 300, 0, 100)
    guiFrame.Position = UDim2.new(0.5, -150, 1, -110)
    guiFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    guiFrame.BackgroundTransparency = 0.5
    guiFrame.BorderSizePixel = 0
    guiFrame.Parent = screenGui

    local resultLabel = Instance.new("TextLabel")
    resultLabel.Size = UDim2.new(1, 0, 0.5, 0)
    resultLabel.Position = UDim2.new(0, 0, 0, 0)
    resultLabel.TextScaled = true
    resultLabel.BackgroundColor3 = Color3.new(1, 1, 1)
    resultLabel.BackgroundTransparency = 1
    resultLabel.TextColor3 = Color3.new(1, 1, 1)
    resultLabel.TextStrokeTransparency = 0.5
    resultLabel.Font = Enum.Font.SourceSans
    resultLabel.Parent = guiFrame
    resultLabel.Text = "Click to roll!"

    local cooldownLabel = Instance.new("TextLabel")
    cooldownLabel.Size = UDim2.new(1, 0, 0.5, 0)
    cooldownLabel.Position = UDim2.new(0, 0, 0.5, 0)
    cooldownLabel.TextScaled = true
    cooldownLabel.BackgroundColor3 = Color3.new(1, 1, 1)
    cooldownLabel.BackgroundTransparency = 1
    cooldownLabel.TextColor3 = Color3.new(1, 1, 1)
    cooldownLabel.TextStrokeTransparency = 0.5
    cooldownLabel.Font = Enum.Font.SourceSans
    cooldownLabel.Parent = guiFrame
    cooldownLabel.Text = "Cooldown: " .. (canRoll and "Ready" or rollCooldown .. "s")

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 50, 0, 20)
    minimizeButton.Position = UDim2.new(1, -55, 0, 5)
    minimizeButton.Text = "_"
    minimizeButton.TextScaled = true
    minimizeButton.BackgroundColor3 = Color3.new(1, 1, 1)
    minimizeButton.BackgroundTransparency = 0.5
    minimizeButton.Parent = guiFrame

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 50, 0, 20)
    closeButton.Position = UDim2.new(1, -55, 0, 30)
    closeButton.Text = "X"
    closeButton.TextScaled = true
    closeButton.BackgroundColor3 = Color3.new(1, 1, 1)
    closeButton.BackgroundTransparency = 0.5
    closeButton.Parent = guiFrame

    local minimized = false

    local function onClick()
        if canRoll then
            canRoll = false
            Cum.network_cum(1)  -- or however many times you want to cum
            resultLabel.Text = "Rolling..."
            cooldownLabel.Text = "Cooldown: " .. rollCooldown .. "s"
            for i = rollCooldown, 1, -1 do
                wait(1)
                cooldownLabel.Text = "Cooldown: " .. i .. "s"
            end
            canRoll = true
            resultLabel.Text = "Click to roll!"
            cooldownLabel.Text = "Cooldown: Ready"
        else
            resultLabel.Text = "Please wait for cooldown!"
        end
    end

    local function onMinimize()
        minimized = not minimized
        if minimized then
            guiFrame.Size = UDim2.new(0, 300, 0, 30)
            resultLabel.Visible = false
            cooldownLabel.Visible = false
            minimizeButton.Text = "+"
        else
            guiFrame.Size = UDim2.new(0, 300, 0, 100)
            resultLabel.Visible = true
            cooldownLabel.Visible = true
            minimizeButton.Text = "_"
        end
    end

    local function onClose()
        screenGui:Destroy()
    end

    guiFrame.MouseButton1Click:Connect(onClick)
    minimizeButton.MouseButton1Click:Connect(onMinimize)
    closeButton.MouseButton1Click:Connect(onClose)
end

return Cum
