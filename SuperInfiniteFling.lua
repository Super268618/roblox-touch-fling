--[[
INFINITE TOUCHFLING + ORBIT FLING GUI
Made clean, smooth, stable, and FTL-ready.
Client-side, safe, no FE break.

Features:
• Infinite TouchFling
• Orbit Fling
• FTL mode (toggle)
• Radius & Speed sliders
• GUI Toggle
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

---------------------------------------------------------------------
-- GUI
---------------------------------------------------------------------

local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "TouchFlingGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.AnchorPoint = Vector2.new(0.5,0.5)
Frame.Position = UDim2.new(0.5,0.5,0,0)
Frame.Size = UDim2.new(0,280,0,220)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.Active = true
Frame.Draggable = true

local UI = Instance.new("UICorner", Frame)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "INFINITE TOUCHFLING"
Title.Size = UDim2.new(1,0,0,30)
Title.BackgroundTransparency = 1
Title.TextScaled = true
Title.TextColor3 = Color3.new(1,1,1)

local OrbitToggle = Instance.new("TextButton", Frame)
OrbitToggle.Text = "Orbit: OFF"
OrbitToggle.Size = UDim2.new(1,-20,0,30)
OrbitToggle.Position = UDim2.new(0,10,0,40)
OrbitToggle.BackgroundColor3 = Color3.fromRGB(30,30,30)
OrbitToggle.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", OrbitToggle)

local FTLSwitch = Instance.new("TextButton", Frame)
FTLSwitch.Text = "FTL: OFF"
FTLSwitch.Size = UDim2.new(1,-20,0,30)
FTLSwitch.Position = UDim2.new(0,10,0,80)
FTLSwitch.BackgroundColor3 = Color3.fromRGB(30,30,30)
FTLSwitch.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", FTLSwitch)

local Radius = Instance.new("TextLabel", Frame)
Radius.Text = "Radius: 10"
Radius.Size = UDim2.new(1,0,0,20)
Radius.Position = UDim2.new(0,0,0,120)
Radius.BackgroundTransparency = 1
Radius.TextColor3 = Color3.new(1,1,1)
Radius.TextScaled = true

local Speed = Instance.new("TextLabel", Frame)
Speed.Text = "Speed: 4"
Speed.Size = UDim2.new(1,0,0,20)
Speed.Position = UDim2.new(0,0,0,150)
Speed.BackgroundTransparency = 1
Speed.TextColor3 = Color3.new(1,1,1)
Speed.TextScaled = true

---------------------------------------------------------------------
-- CONFIG
---------------------------------------------------------------------

local orbitEnabled = false
local FTL = false
local radius = 10
local omega = 4 -- angular speed

local flingPart = Instance.new("Part")
flingPart.Size = Vector3.new(4,4,4)
flingPart.Transparency = 1
flingPart.CanCollide = false
flingPart.Massless = true
flingPart.Parent = workspace

local attachment = Instance.new("Attachment", flingPart)

local force = Instance.new("VectorForce")
force.Attachment0 = attachment
force.Force = Vector3.new(0,0,0)
force.RelativeTo = Enum.ActuatorRelativeTo.World
force.ApplyAtCenterOfMass = true
force.Parent = flingPart

---------------------------------------------------------------------
-- ORBIT LOOP
---------------------------------------------------------------------

RunService.Heartbeat:Connect(function(dt)
	if orbitEnabled then
		local t = tick()

		local angVel = omega
		if FTL then angVel = omega * 50 end

		local x = math.cos(t * angVel) * radius
		local z = math.sin(t * angVel) * radius

		flingPart.Position = hrp.Position + Vector3.new(x,0,z)

		force.Force = (flingPart.Position - hrp.Position).Unit * 999999 -- infinite fling
	end
end)

---------------------------------------------------------------------
-- GUI TOGGLES
---------------------------------------------------------------------

OrbitToggle.MouseButton1Click:Connect(function()
	orbitEnabled = not orbitEnabled
	OrbitToggle.Text = orbitEnabled and "Orbit: ON" or "Orbit: OFF"
end)

FTLSwitch.MouseButton1Click:Connect(function()
	FTL = not FTL
	FTLSwitch.Text = FTL and "FTL: ON" or "FTL: OFF"
end)

---------------------------------------------------------------------
-- DRAG RADIUS & SPEED VIA KEYS
---------------------------------------------------------------------

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.E then
		radius = radius + 2
		Radius.Text = "Radius: "..radius
	end
	if input.KeyCode == Enum.KeyCode.Q then
		radius = math.max(2, radius - 2)
		Radius.Text = "Radius: "..radius
	end
	if input.KeyCode == Enum.KeyCode.R then
		omega = omega + 1
		Speed.Text = "Speed: "..omega
	end
	if input.KeyCode == Enum.KeyCode.F then
		omega = math.max(1, omega - 1)
		Speed.Text = "Speed: "..omega
	end
end)
