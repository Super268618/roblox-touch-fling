-- SUPER'S MAXIMUM POWER TOUCHFLING
-- ABSOLUTE MAXIMUM POWER WITH MULTIPLE MODES
-- Place in StarterPlayer → StarterPlayerScripts

local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local PowerLabel = Instance.new("TextLabel")
local WarningLabel = Instance.new("TextLabel")
local KillCounter = Instance.new("TextLabel")
local ModeFrame = Instance.new("Frame")
local ModeTitle = Instance.new("TextLabel")
local NormalBtn = Instance.new("TextButton")
local UltraBtn = Instance.new("TextButton")
local MaxBtn = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.388539821, 0, 0.427821517, 0)
Frame.Size = UDim2.new(0, 220, 0, 280)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new(Color3.fromRGB(20, 0, 0), Color3.fromRGB(50, 0, 0))
UIGradient.Rotation = 45
UIGradient.Parent = Frame

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 220, 0, 40)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Frame_2

local HeaderCover = Instance.new("Frame")
HeaderCover.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HeaderCover.BorderSizePixel = 0
HeaderCover.Position = UDim2.new(0, 0, 0.5, 0)
HeaderCover.Size = UDim2.new(1, 0, 0.5, 0)
HeaderCover.Parent = Frame_2

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.025, 0, 0, 0)
TextLabel.Size = UDim2.new(0.95, 0, 1, 0)
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
PowerLabel.Position = UDim2.new(0.075, 0, 0.16, 0)
PowerLabel.Size = UDim2.new(0.85, 0, 0, 28)
PowerLabel.Font = Enum.Font.GothamBold
PowerLabel.Text = "⚡ POWER: 50,000,000 ⚡"
PowerLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
PowerLabel.TextSize = 15.000

WarningLabel.Parent = Frame
WarningLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WarningLabel.BackgroundTransparency = 1.000
WarningLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
WarningLabel.BorderSizePixel = 0
WarningLabel.Position = UDim2.new(0.075, 0, 0.26, 0)
WarningLabel.Size = UDim2.new(0.85, 0, 0, 22)
WarningLabel.Font = Enum.Font.SourceSansBold
WarningLabel.Text = "🔥 NORMAL MODE 🔥"
WarningLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
WarningLabel.TextSize = 14.000

-- Mode Selection Frame
ModeFrame.Parent = Frame
ModeFrame.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
ModeFrame.BorderSizePixel = 0
ModeFrame.Position = UDim2.new(0.075, 0, 0.36, 0)
ModeFrame.Size = UDim2.new(0.85, 0, 0, 90)

local ModeCorner = Instance.new("UICorner")
ModeCorner.CornerRadius = UDim.new(0, 8)
ModeCorner.Parent = ModeFrame

ModeTitle.Parent = ModeFrame
ModeTitle.BackgroundTransparency = 1
ModeTitle.Position = UDim2.new(0, 0, 0, 3)
ModeTitle.Size = UDim2.new(1, 0, 0, 18)
ModeTitle.Font = Enum.Font.GothamBold
ModeTitle.Text = "SELECT POWER MODE"
ModeTitle.TextColor3 = Color3.fromRGB(255, 200, 200)
ModeTitle.TextSize = 11

NormalBtn.Parent = ModeFrame
NormalBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
NormalBtn.Position = UDim2.new(0.05, 0, 0.28, 0)
NormalBtn.Size = UDim2.new(0.9, 0, 0, 18)
NormalBtn.Font = Enum.Font.Gotham
NormalBtn.Text = "🔥 NORMAL (50M)"
NormalBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NormalBtn.TextSize = 10
local NormalCorner = Instance.new("UICorner")
NormalCorner.CornerRadius = UDim.new(0, 5)
NormalCorner.Parent = NormalBtn

UltraBtn.Parent = ModeFrame
UltraBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 100)
UltraBtn.Position = UDim2.new(0.05, 0, 0.53, 0)
UltraBtn.Size = UDim2.new(0.9, 0, 0, 18)
UltraBtn.Font = Enum.Font.Gotham
UltraBtn.Text = "💥 ULTRA (100M)"
UltraBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UltraBtn.TextSize = 10
local UltraCorner = Instance.new("UICorner")
UltraCorner.CornerRadius = UDim.new(0, 5)
UltraCorner.Parent = UltraBtn

MaxBtn.Parent = ModeFrame
MaxBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 150)
MaxBtn.Position = UDim2.new(0.05, 0, 0.78, 0)
MaxBtn.Size = UDim2.new(0.9, 0, 0, 18)
MaxBtn.Font = Enum.Font.GothamBold
MaxBtn.Text = "⚡ MAXIMUM (200M)"
MaxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxBtn.TextSize = 10
local MaxCorner = Instance.new("UICorner")
MaxCorner.CornerRadius = UDim.new(0, 5)
MaxCorner.Parent = MaxBtn

KillCounter.Parent = Frame
KillCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KillCounter.BackgroundTransparency = 1.000
KillCounter.BorderColor3 = Color3.fromRGB(0, 0, 0)
KillCounter.BorderSizePixel = 0
KillCounter.Position = UDim2.new(0.075, 0, 0.68, 0)
KillCounter.Size = UDim2.new(0.85, 0, 0, 20)
KillCounter.Font = Enum.Font.Gotham
KillCounter.Text = "💀 Eliminated: 0"
KillCounter.TextColor3 = Color3.fromRGB(200, 200, 200)
KillCounter.TextSize = 13.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.125, 0, 0.78, 0)
TextButton.Size = UDim2.new(0, 165, 0, 50)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "OFF"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 26.000

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 10)
ButtonCorner.Parent = TextButton

local ButtonGradient = Instance.new("UIGradient")
ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(200, 200, 200), Color3.fromRGB(255, 255, 255))
ButtonGradient.Rotation = 90
ButtonGradient.Parent = TextButton

-- Scripts:

local function MaximumPowerFlingScript()
	local toggleButton = TextButton
	local hiddenfling = false
	local flingThread 
	local killCount = 0
	local currentMode = "NORMAL"
	
	-- Power settings per mode
	local FLING_POWERS = {
		NORMAL = 50000000,
		ULTRA = 100000000,
		MAXIMUM = 200000000
	}
	
	local currentPower = FLING_POWERS.NORMAL
	
	-- FX Folder
	local FXFolder = Instance.new("Folder", workspace)
	FXFolder.Name = "MaxPowerFlingFX"
	
	-- Create detection marker
	if not ReplicatedStorage:FindFirstChild("SuperFling_MAX") then
		local detection = Instance.new("Decal")
		detection.Name = "SuperFling_MAX"
		detection.Parent = ReplicatedStorage
	end
	
	-- Visual effects for activation
	local function createActivationEffect()
		local effectColor
		if currentMode == "MAXIMUM" then
			effectColor = Color3.fromRGB(255, 0, 255)
		elseif currentMode == "ULTRA" then
			effectColor = Color3.fromRGB(255, 50, 150)
		else
			effectColor = Color3.fromRGB(255, 100, 100)
		end
		
		local player = Players.LocalPlayer
		local char = player.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		if not root then return end
		
		-- Explosion effect
		for i = 1, 12 do
			local part = Instance.new("Part")
			part.Size = Vector3.new(2, 2, 2)
			part.Position = root.Position
			part.Anchored = true
			part.CanCollide = false
			part.Material = Enum.Material.Neon
			part.Color = effectColor
			part.Transparency = 0.3
			part.Shape = Enum.PartType.Ball
			part.Parent = FXFolder
			
			local angle = (i / 12) * math.pi * 2
			local targetPos = root.Position + Vector3.new(math.cos(angle) * 10, math.random(-3, 3), math.sin(angle) * 10)
			
			TweenService:Create(part, TweenInfo.new(0.5), {
				Position = targetPos,
				Size = Vector3.new(0.5, 0.5, 0.5),
				Transparency = 1
			}):Play()
			Debris:AddItem(part, 0.5)
		end
		
		-- Shockwave
		local shockwave = Instance.new("Part")
		shockwave.Size = Vector3.new(1, 1, 1)
		shockwave.Position = root.Position
		shockwave.Anchored = true
		shockwave.CanCollide = false
		shockwave.Material = Enum.Material.Neon
		shockwave.Color = effectColor
		shockwave.Transparency = 0.5
		shockwave.Shape = Enum.PartType.Ball
		shockwave.Parent = FXFolder
		
		TweenService:Create(shockwave, TweenInfo.new(0.6), {
			Size = Vector3.new(30, 30, 30),
			Transparency = 1
		}):Play()
		Debris:AddItem(shockwave, 0.6)
	end
	
	-- Track eliminations
	local function trackElimination()
		killCount = killCount + 1
		KillCounter.Text = "💀 Eliminated: " .. killCount
		
		-- Epic flash effect
		spawn(function()
			for i = 1, 3 do
				KillCounter.TextColor3 = Color3.fromRGB(255, 0, 0)
				KillCounter.TextSize = 16
				wait(0.1)
				KillCounter.TextColor3 = Color3.fromRGB(200, 200, 200)
				KillCounter.TextSize = 13
				wait(0.1)
			end
		end)
	end
	
	-- Monitor nearby players for elimination tracking
	local function monitorPlayers()
		while hiddenfling do
			wait(0.3)
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= Players.LocalPlayer and player.Character then
					local theirRoot = player.Character:FindFirstChild("HumanoidRootPart")
					local myRoot = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					
					if theirRoot and myRoot then
						local distance = (theirRoot.Position - myRoot.Position).Magnitude
						-- If they were close and now have extreme velocity, they got flung
						if distance < 25 and theirRoot.Velocity.Magnitude > 50000 then
							trackElimination()
						end
					end
				end
			end
		end
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
				-- Use current power level
				hrp.Velocity = vel * currentPower + Vector3.new(0, currentPower, 0)
				RunService.RenderStepped:Wait()
				hrp.Velocity = vel
				RunService.Stepped:Wait()
				hrp.Velocity = vel + Vector3.new(0, movel, 0)
				movel = -movel
			end
		end
	end
	
	-- Mode selection
	NormalBtn.MouseButton1Click:Connect(function()
		currentMode = "NORMAL"
		currentPower = FLING_POWERS.NORMAL
		PowerLabel.Text = "⚡ POWER: 50,000,000 ⚡"
		PowerLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
		WarningLabel.Text = "🔥 NORMAL MODE 🔥"
		WarningLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
		if hiddenfling then
			createActivationEffect()
		end
	end)
	
	UltraBtn.MouseButton1Click:Connect(function()
		currentMode = "ULTRA"
		currentPower = FLING_POWERS.ULTRA
		PowerLabel.Text = "⚡ POWER: 100,000,000 ⚡"
		PowerLabel.TextColor3 = Color3.fromRGB(255, 100, 255)
		WarningLabel.Text = "💥 ULTRA MODE 💥"
		WarningLabel.TextColor3 = Color3.fromRGB(255, 50, 150)
		Frame.BorderColor3 = Color3.fromRGB(255, 0, 150)
		if hiddenfling then
			createActivationEffect()
		end
	end)
	
	MaxBtn.MouseButton1Click:Connect(function()
		currentMode = "MAXIMUM"
		currentPower = FLING_POWERS.MAXIMUM
		PowerLabel.Text = "⚡ POWER: 200,000,000 ⚡"
		PowerLabel.TextColor3 = Color3.fromRGB(255, 0, 255)
		WarningLabel.Text = "⚡ MAXIMUM MODE ⚡"
		WarningLabel.TextColor3 = Color3.fromRGB(255, 0, 255)
		Frame.BorderColor3 = Color3.fromRGB(255, 0, 255)
		if hiddenfling then
			createActivationEffect()
		end
	end)
	
	-- Main toggle
	toggleButton.MouseButton1Click:Connect(function()
		hiddenfling = not hiddenfling
		
		if hiddenfling then
			toggleButton.Text = "ON"
			toggleButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
			toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			
			local headerColor
			if currentMode == "MAXIMUM" then
				headerColor = Color3.fromRGB(255, 0, 255)
			elseif currentMode == "ULTRA" then
				headerColor = Color3.fromRGB(255, 50, 150)
			else
				headerColor = Color3.fromRGB(255, 0, 0)
			end
			Frame_2.BackgroundColor3 = headerColor
			HeaderCover.BackgroundColor3 = headerColor
			
			createActivationEffect()
			
			-- RGB border effect for MAXIMUM mode
			if currentMode == "MAXIMUM" then
				spawn(function()
					while hiddenfling do
						for hue = 0, 360, 10 do
							if not hiddenfling then break end
							local color = Color3.fromHSV(hue / 360, 1, 1)
							Frame.BorderColor3 = color
							PowerLabel.TextColor3 = color
							wait(0.05)
						end
					end
				end)
			else
				-- Pulse effect for other modes
				spawn(function()
					while hiddenfling do
						for i = 1, 10 do
							if not hiddenfling then break end
							Frame.BorderColor3 = Color3.fromRGB(255, i * 25, i * (currentMode == "ULTRA" and 15 or 0))
							wait(0.05)
						end
						for i = 10, 1, -1 do
							if not hiddenfling then break end
							Frame.BorderColor3 = Color3.fromRGB(255, i * 25, i * (currentMode == "ULTRA" and 15 or 0))
							wait(0.05)
						end
					end
				end)
			end
			
			flingThread = coroutine.create(fling)
			coroutine.resume(flingThread)
			spawn(monitorPlayers)
		else
			toggleButton.Text = "OFF"
			toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			HeaderCover.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			
			local borderColor
			if currentMode == "MAXIMUM" then
				borderColor = Color3.fromRGB(255, 0, 255)
			elseif currentMode == "ULTRA" then
				borderColor = Color3.fromRGB(255, 0, 150)
			else
				borderColor = Color3.fromRGB(255, 0, 0)
			end
			Frame.BorderColor3 = borderColor
			
			local powerColor
			if currentMode == "MAXIMUM" then
				powerColor = Color3.fromRGB(255, 0, 255)
			elseif currentMode == "ULTRA" then
				powerColor = Color3.fromRGB(255, 100, 255)
			else
				powerColor = Color3.fromRGB(255, 255, 0)
			end
			PowerLabel.TextColor3 = powerColor
			
			hiddenfling = false
		end
	end)
	
end

coroutine.wrap(MaximumPowerFlingScript)()

print("🔥💀⚡ SUPER'S MAXIMUM POWER TOUCHFLING LOADED ⚡💀🔥")
print("⚡ 3 POWER MODES: NORMAL (50M), ULTRA (100M), MAXIMUM (200M)")
print("💥 Visual effects on activation")
print("💀 Elimination tracking")
print("🌈 RGB border in MAXIMUM mode")
print("Select mode then toggle ON!")
