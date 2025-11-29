-- Super's Ultimate Touchfling - 10,000,000 POWER (FTL VERSION)
-- WARNING: INSANELY POWERFUL - SENDS PLAYERS TO ORBIT

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local PowerLabel = Instance.new("TextLabel")
local WarningLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.388539821, 0, 0.427821517, 0)
Frame.Size = UDim2.new(0, 180, 0, 160)
Frame.Active = true
Frame.Draggable = true

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 180, 0, 30)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.05, 0, 0, 0)
TextLabel.Size = UDim2.new(0.9, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Super's Ultimate Touchfling"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextScaled = true

PowerLabel.Parent = Frame
PowerLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PowerLabel.BackgroundTransparency = 1.000
PowerLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
PowerLabel.BorderSizePixel = 0
PowerLabel.Position = UDim2.new(0.1, 0, 0.22, 0)
PowerLabel.Size = UDim2.new(0.8, 0, 0, 25)
PowerLabel.Font = Enum.Font.GothamBold
PowerLabel.Text = "⚡ POWER: 10,000,000 ⚡"
PowerLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
PowerLabel.TextSize = 16.000

WarningLabel.Parent = Frame
WarningLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WarningLabel.BackgroundTransparency = 1.000
WarningLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
WarningLabel.BorderSizePixel = 0
WarningLabel.Position = UDim2.new(0.1, 0, 0.38, 0)
WarningLabel.Size = UDim2.new(0.8, 0, 0, 20)
WarningLabel.Font = Enum.Font.SourceSansBold
WarningLabel.Text = "🚀 FTL MODE 🚀"
WarningLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
WarningLabel.TextSize = 14.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.15, 0, 0.6, 0)
TextButton.Size = UDim2.new(0, 126, 0, 45)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "OFF"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 24.000

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = TextButton

-- Scripts:

local function UltimateFlingScript()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	
	local toggleButton = TextButton
	local hiddenfling = false
	local flingThread 
	
	-- 10 MILLION POWER SETTING
	local FLING_POWER = 10000000
	
	-- Create detection marker
	if not ReplicatedStorage:FindFirstChild("SuperFling_10M") then
		local detection = Instance.new("Decal")
		detection.Name = "SuperFling_10M"
		detection.Parent = ReplicatedStorage
	end
	
	local function fling()
		local lp = Players.LocalPlayer
		local c, hrp, vel, movel = nil, nil, nil, 0.1
	
		while hiddenfling do
			RunService.Heartbeat:Wait()
			c = lp.Character
			hrp = c and c:FindFirstChild("HumanoidRootPart")
	
			if hrp then
				vel = hrp.Velocity
				-- 10 MILLION POWER - FTL MODE ACTIVATED
				hrp.Velocity = vel * FLING_POWER + Vector3.new(0, FLING_POWER, 0)
				RunService.RenderStepped:Wait()
				hrp.Velocity = vel
				RunService.Stepped:Wait()
				hrp.Velocity = vel + Vector3.new(0, movel, 0)
				movel = -movel
			end
		end
	end
	
	toggleButton.MouseButton1Click:Connect(function()
		hiddenfling = not hiddenfling
		
		if hiddenfling then
			toggleButton.Text = "ON"
			toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			Frame_2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			flingThread = coroutine.create(fling)
			coroutine.resume(flingThread)
		else
			toggleButton.Text = "OFF"
			toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
			hiddenfling = false
		end
	end)
	
end

coroutine.wrap(UltimateFlingScript)()

print("🔥🚀 SUPER'S ULTIMATE TOUCHFLING LOADED 🚀🔥")
print("⚡ POWER: 10,000,000 (FTL MODE) ⚡")
print("WARNING: EXTREME POWER - SENDS PLAYERS TO ORBIT!")
print("Drag GUI to move it around")
print("Click button to toggle ON/OFF")
