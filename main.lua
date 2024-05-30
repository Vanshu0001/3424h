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
local currentPage = 1
local totalPages = 3
local cooldown = 5
local guiCooldown = false

function Cum.network_cum(times)
    for i = 1, times do
        print("Cumming " .. i .. " time(s)")
        Cum.createCumAnimation()
    end
    Cum.showGui()
end

function Cum.createCumAnimation()
    local particle = Instance.new("Part")
    particle.Size = Vector3.new(1, 1, 1)
    particle.Position = Vector3.new(math.random(-50, 50), 50, math.random(-50, 50))
    particle.Anchored = true
    particle.BrickColor = BrickColor.new("Institutional white")
    particle.Parent = game.Workspace

    local tweenService = game:GetService("TweenService")
    local goal = {}
    goal.Position = particle.Position - Vector3.new(0, 50, 0)
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    local tween = tweenService:Create(particle, tweenInfo, goal)
    tween:Play()

    tween.Completed:Connect(function()
        particle:Destroy()
    end)
end

function Cum.summonEntity()
    local entity = Instance.new("Model")
    entity.Name = "u r mom"

    local humanoid = Instance.new("Humanoid", entity)
    local head = Instance.new("Part", entity)
    head.Name = "Head"
    head.Size = Vector3.new(2, 1, 1)
    head.Position = Vector3.new(0, 5, 0)
    head.Anchored = true
    head.BrickColor = BrickColor.new("Bright red")

    local torso = Instance.new("Part", entity)
    torso.Name = "Torso"
    torso.Size = Vector3.new(2, 2, 1)
    torso.Position = Vector3.new(0, 3, 0)
    torso.Anchored = true
    torso.BrickColor = BrickColor.new("Bright blue")

    entity.PrimaryPart = torso
    entity:SetPrimaryPartCFrame(CFrame.new(0, 3, 0))

    entity.Parent = game.Workspace
end

function Cum.showGui()
    local player = game.Players.LocalPlayer

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

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 20, 0, 20)
    minimizeButton.Position = UDim2.new(0, 5, 1, -25)
    minimizeButton.Text = "-"
    minimizeButton.TextScaled = true
    minimizeButton.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)
    minimizeButton.Parent = guiFrame

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -25, 1, -25)
    closeButton.Text = "X"
    closeButton.TextScaled = true
    closeButton.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
    closeButton.TextColor3 = Color3.new(1, 1, 1)
    closeButton.Parent = guiFrame

    local function roll()
        if not canRoll or guiCooldown then
            return
        end
        canRoll = false
        guiCooldown = true
        resultLabel.Text = "Rolling..."
        wait(2) -- Simulate rolling animation
        local results = {"asian", "failure", "cpkq", player.Name}
        local randomResult = results[math.random(1, #results)]
        resultLabel.Text = "Result: " .. randomResult
        Cum.createCumAnimation()
        Cum.summonEntity()
        local
