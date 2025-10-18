-- fly.lua
-- Flying logic module. Provides a small API used by the UI module.
-- NOTE: This code is intended to run inside Roblox. Supported with Delta only.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Fly = {}

local speeds = 1
local flying = false
local char, humanoid, hrp
local heartbeatConn

local function refreshCharacter()
    local player = Players.LocalPlayer
    if not player then return end
    char = player.Character or player.CharacterAdded:Wait()
    humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
    hrp = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso"))
end

function Fly.init()
    refreshCharacter()
    -- reconnect on spawn
    if Players.LocalPlayer then
        Players.LocalPlayer.CharacterAdded:Connect(function()
            refreshCharacter()
        end)
    end

    heartbeatConn = RunService.Heartbeat:Connect(function()
        if flying and hrp and hrp.Parent then
            -- keep player hovering; zero out velocity to reduce jitter
            hrp.Velocity = Vector3.new(0, 0, 0)
        end
    end)
end

function Fly.toggle()
    flying = not flying
    if humanoid then
        humanoid.PlatformStand = flying
    end
    return flying
end

function Fly.setSpeed(n)
    speeds = math.max(1, tonumber(n) or 1)
end

function Fly.getSpeed()
    return speeds
end

function Fly.moveUp()
    if hrp and hrp.Parent then
        hrp.CFrame = hrp.CFrame + Vector3.new(0, speeds, 0)
    end
end

function Fly.moveDown()
    if hrp and hrp.Parent then
        hrp.CFrame = hrp.CFrame + Vector3.new(0, -speeds, 0)
    end
end

function Fly.cleanup()
    if heartbeatConn then
        heartbeatConn:Disconnect()
        heartbeatConn = nil
    end
end

return Fly
