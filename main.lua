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
    -- Your animation code here
end

function Cum.summonEntity()
    -- Your entity summoning code here
end

function Cum.showGui()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screenGui.Name = "CumGui"
    screenGui.ResetOnSpawn = false

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1

    local background = Instance.new("Frame", frame)
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.new(0, 0, 0)
    background.BackgroundTransparency = 0.5

    -- Add your UI elements here (e.g., labels, buttons, etc.)
    -- Make sure to add animations and interactivity as desired

    local rngMeter = Instance.new("TextLabel", background)
    rngMeter.Size = UDim2.new(0, 200, 0, 20)
    rngMeter.Position = UDim2.new(0.5, -100, 0.1, 0)
    rngMeter.TextScaled = true
    rngMeter.BackgroundColor3 = Color3.new(1, 1, 1)
    rngMeter.BackgroundTransparency = 0.5
    rngMeter.TextColor3 = Color3.new(0, 0, 0)
    rngMeter.TextStrokeTransparency = 0.5
    rngMeter.Text = "RNG Meter"

    -- Add event listeners for interactivity

    local function rollMom()
        -- Your code for rolling "u r mom"
        -- Make the player fly
        player.Character:MoveTo(player.Character.Position + Vector3.new(0, 20, 0))
    end

    local function rollFail()
        -- Your code for rolling "failure"
        -- Play random sounds
        -- Example: game.Workspace.Sound:Play()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end

    local button = Instance.new("TextButton", background)
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5, -25)
    button.Text = "Click me for result"
    button.TextScaled = true
    button.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
    button.TextColor3 = Color3.new(1, 1, 1)

    button.MouseButton1Click:Connect(function()
        local results = {"asian", "failure", "cpkq", player.Name}
        local randomResult = results[math.random(1, #results)]
        rngMeter.Text = "Result: " .. randomResult
        if randomResult == player.Name then
            rollMom()
        else
            rollFail()
        end
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
