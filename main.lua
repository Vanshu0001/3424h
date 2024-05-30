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

function Cum.network_cum(times)
    for i = 1, times do
        print("Cumming " .. i .. " time(s)")
        Cum.createCumAnimation()
    end
    Cum.showGui()
end

function Cum.createCumAnimation()
    local cumPart = Instance.new("Part")
    cumPart.Size = Vector3.new(1, 1, 1)
    cumPart.Position = Vector3.new(math.random(-50, 50), 50, math.random(-50, 50))
    cumPart.Anchored = true
    cumPart.BrickColor = BrickColor.new("Institutional white")
    cumPart.Parent = game.Workspace

    local tweenService = game:GetService("TweenService")
    local goal = {}
    goal.Position = cumPart.Position - Vector3.new(0, 50, 0)
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    local tween = tweenService:Create(cumPart, tweenInfo, goal)
    tween:Play()

    tween.Completed:Connect(function()
        cumPart:Destroy()
    end)
end

function Cum.summonEntity()
    local entity = Instance.new("Model")
    entity.Name = "CummingEntity"

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

    -- Additional animations or effects can be added here.
end

function Cum.showGui()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screenGui.Name = "CumGui"

    local textLabel = Instance.new("TextLabel", screenGui)
    textLabel.Size = UDim2.new(0, 300, 0, 100)
    textLabel.Position = UDim2.new(0.5, -150, 0.4, -50)
    textLabel.Text = "Cumming inside!"
    textLabel.TextScaled = true
    textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    textLabel.BackgroundTransparency = 0.5
    textLabel.TextColor3 = Color3.new(1, 1, 1)

    local button = Instance.new("TextButton", screenGui)
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5, -25)
    button.Text = "Click me for result"
    button.TextScaled = true
    button.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
    button.TextColor3 = Color3.new(1, 1, 1)

    button.MouseButton1Click:Connect(function()
        local results = {"asian", "failure", "cpkq"}
        textLabel.Text = "Loading..."
        local loadingBar = Instance.new("Frame", screenGui)
        loadingBar.Size = UDim2.new(0, 0, 0, 20)
        loadingBar.Position = UDim2.new(0.5, -100, 0.6, -10)
        loadingBar.BackgroundColor3 = Color3.new(0, 1, 0)

        local tweenService = game:GetService("TweenService")
        local goal = {}
        goal.Size = UDim2.new(0, 200, 0, 20)
        local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local tween = tweenService:Create(loadingBar, tweenInfo, goal)
        tween:Play()

        tween.Completed:Connect(function()
            local randomResult = results[math.random(1, #results)]
            textLabel.Text = "Result: " .. randomResult
            Cum.summonEntity()
            wait(3)
            screenGui:Destroy()
        end)

        button:Destroy()
    end)
end

local function main()
    local condom = Condom:new()
    Cum.network_cum(2)
    condom:use()
    print("Result.....")
    print("cpkq")
end

main()
