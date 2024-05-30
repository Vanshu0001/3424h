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

local canRoll = true

function Cum.network_cum(times)
    for i = 1, times do
        print("Cumming " .. i .. " time(s)")
        Cum.createCumAnimation()
    end
    Cum.showGui()
end

function Cum.createCumAnimation()
    -- Your particle effects code here
end

function Cum.summonEntity()
    -- Your entity summoning code here
end

function Cum.showGui()
    local player = game.Players.LocalPlayer
    local cooldown = 5

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CumGui"
    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false

    local guiFrame = Instance.new("Frame")
    guiFrame.Size = UDim2.new(0, 200, 0, 100)
    guiFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
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
    cooldownLabel.Text = ""

    local watermark = Instance.new("TextLabel")
    watermark.Size = UDim2.new(0, 100, 0, 20)
    watermark.Position = UDim2.new(0, 5, 0, 5)
    watermark.TextScaled = true
    watermark.BackgroundColor3 = Color3.new(1, 1, 1)
    watermark.BackgroundTransparency = 1
    watermark.TextColor3 = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    watermark.TextStrokeTransparency = 0.5
    watermark.Font = Enum.Font.SourceSans
    watermark.Parent = guiFrame
    watermark.Text = "UR MOM"

    local function roll()
        if not canRoll then
            return
        end
        canRoll = false
        resultLabel.Text = "Rolling..."
        wait(2) -- Simulate rolling animation
        local results = {"asian", "failure", "cpkq", player.Name}
        local randomResult = results[math.random(1, #results)]
        resultLabel.Text = "Result: " .. randomResult
        Cum.createCumAnimation()
        wait(cooldown)
        canRoll = true
    end

    guiFrame.MouseButton1Click:Connect(roll)
end

local function main()
    local condom = Condom:new()
    Cum.network_cum(2)
    condom:use()
    print("Result.....")
    print("cpkq")
end

main()
