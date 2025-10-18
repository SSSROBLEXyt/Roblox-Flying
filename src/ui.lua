-- ui.lua
-- Creates the GUI and wires controls to the fly module.
-- NOTE: UI + fly logic only supported with Delta.

local Fly = require(script.Parent.fly)
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

local ui = {}

function ui.create()
    local main = Instance.new("ScreenGui")
    main.Name = "main"
    main.Parent = LocalPlayer:WaitForChild("PlayerGui")
    main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main.ResetOnSpawn = false

    local Frame = Instance.new("Frame")
    Frame.Parent = main
    Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
    Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
    Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
    Frame.Size = UDim2.new(0, 190, 0, 57)

    local up = Instance.new("TextButton")
    up.Name = "Up"
    up.Parent = Frame
    up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
    up.Size = UDim2.new(0, 44, 0, 28)
    up.Font = Enum.Font.SourceSans
    up.Text = "Up"
    up.TextColor3 = Color3.fromRGB(0, 0, 0)
    up.TextSize = 14

    local down = Instance.new("TextButton")
    down.Name = "Down"
    down.Parent = Frame
    down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
    down.Position = UDim2.new(0, 0, 0.491228074, 0)
    down.Size = UDim2.new(0, 44, 0, 28)
    down.Font = Enum.Font.SourceSans
    down.Text = "Down"
    down.TextColor3 = Color3.fromRGB(0, 0, 0)
    down.TextSize = 14

    local onof = Instance.new("TextButton")
    onof.Name = "onof"
    onof.Parent = Frame
    onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
    onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
    onof.Size = UDim2.new(0, 56, 0, 28)
    onof.Font = Enum.Font.SourceSans
    onof.Text = "Fly"
    onof.TextColor3 = Color3.fromRGB(0, 0, 0)
    onof.TextSize = 14

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
    TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 100, 0, 28)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "Adnan Tik Engine s.m.w.r.o"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextWrapped = true

    local plus = Instance.new("TextButton")
    plus.Name = "plus"
    plus.Parent = Frame
    plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
    plus.Position = UDim2.new(0.231578946, 0, 0, 0)
    plus.Size = UDim2.new(0, 45, 0, 28)
    plus.Font = Enum.Font.SourceSans
    plus.Text = "+"
    plus.TextColor3 = Color3.fromRGB(0, 0, 0)
    plus.TextScaled = true
    plus.TextWrapped = true

    local speedLabel = Instance.new("TextLabel")
    speedLabel.Name = "speed"
    speedLabel.Parent = Frame
    speedLabel.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
    speedLabel.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
    speedLabel.Size = UDim2.new(0, 44, 0, 28)
    speedLabel.Font = Enum.Font.SourceSans
    speedLabel.Text = tostring(Fly.getSpeed())
    speedLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    speedLabel.TextScaled = true
    speedLabel.TextWrapped = true

    local mine = Instance.new("TextButton")
    mine.Name = "mine"
    mine.Parent = Frame
    mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
    mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
    mine.Size = UDim2.new(0, 45, 0, 29)
    mine.Font = Enum.Font.SourceSans
    mine.Text = "-"
    mine.TextColor3 = Color3.fromRGB(0, 0, 0)
    mine.TextScaled = true
    mine.TextWrapped = true

    local closebutton = Instance.new("TextButton")
    closebutton.Name = "Close"
    closebutton.Parent = Frame
    closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
    closebutton.Font = Enum.Font.SourceSans
    closebutton.Size = UDim2.new(0, 20, 0, 20)
    closebutton.Text = "X"
    closebutton.TextSize = 14
    closebutton.Position = UDim2.new(1, -22, -0.4, 0)

    local mini = Instance.new("TextButton")
    mini.Name = "Minimize"
    mini.Parent = Frame
    mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
    mini.Font = Enum.Font.SourceSans
    mini.Size = UDim2.new(0, 20, 0, 20)
    mini.Text = "-"
    mini.TextSize = 18
    mini.Position = UDim2.new(1, -44, -0.4, 0)

    local mini2 = Instance.new("TextButton")
    mini2.Name = "Maximize"
    mini2.Parent = Frame
    mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
    mini2.Font = Enum.Font.SourceSans
    mini2.Size = UDim2.new(0, 20, 0, 20)
    mini2.Text = "+"
    mini2.TextSize = 18
    mini2.Position = UDim2.new(1, -66, -0.4, 0)
    mini2.Visible = false

    -- wiring
    plus.MouseButton1Click:Connect(function()
        Fly.setSpeed(Fly.getSpeed() + 1)
        speedLabel.Text = tostring(Fly.getSpeed())
    end)

    mine.MouseButton1Click:Connect(function()
        Fly.setSpeed(math.max(1, Fly.getSpeed() - 1))
        speedLabel.Text = tostring(Fly.getSpeed())
    end)

    up.MouseButton1Click:Connect(function()
        Fly.moveUp()
    end)

    down.MouseButton1Click:Connect(function()
        Fly.moveDown()
    end)

    onof.MouseButton1Click:Connect(function()
        local isFlying = Fly.toggle()
        if isFlying then
            onof.Text = "Stop"
            onof.BackgroundColor3 = Color3.fromRGB(255, 130, 130)
        else
            onof.Text = "Fly"
            onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
        end
    end)

    closebutton.MouseButton1Click:Connect(function()
        main:Destroy()
    end)

    mini.MouseButton1Click:Connect(function()
        Frame.Visible = false
        mini2.Visible = true
    end)

    mini2.MouseButton1Click:Connect(function()
        Frame.Visible = true
        mini2.Visible = false
    end)

    -- notify about Delta support
    StarterGui:SetCore("SendNotification", {
        Title = "Adnan Tik Engine s.m.w.r.o";
        Text = "This script is only supported with Delta.";
        Duration = 5;
    })

    main.Destroying:Connect(function()
        Fly.cleanup()
    end)

    -- initialize fly logic
    Fly.init()

    return main
end

return ui
