-- Super's ULTIMATE Touchfling + AUTO FLING - 50,000,000 POWER
-- WARNING: EXTREME POWER + FTL AUTO TARGETING

local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local PowerLabel = Instance.new("TextLabel")
local WarningLabel = Instance.new("TextLabel")
local KillCounter = Instance.new("TextLabel")
local AutoFlingToggle = Instance.new("TextButton")
local TargetLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.388539821, 0, 0.427821517, 0)
Frame.Size = UDim2.new(0, 200, 0, 250)
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
Frame_2.Size = UDim2.new(0, 200, 0, 35)

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
TextLabel.TextSize = 13.000
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
PowerLabel.TextSize = 14.000

WarningLabel.Parent = Frame
WarningLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WarningLabel.BackgroundTransparency = 1.000
WarningLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
WarningLabel.BorderSizePixel = 0
WarningLabel.Position = UDim2.new(0.075, 0, 0.28, 0)
WarningLabel.Size = UDim2.new(0.85, 0, 0, 22)
WarningLabel.Font = Enum.Font.SourceSansBold
WarningLabel.Text = "🔥 MAXIMUM LEVEL 🔥"
WarningLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
WarningLabel.TextSize = 13.000

KillCounter.Parent = Frame
KillCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KillCounter.BackgroundTransparency = 1.000
KillCounter.BorderColor3 = Color3.fromRGB(0, 0, 0)
KillCounter.BorderSizePixel = 0
KillCounter.Position = UDim2.new(0.075, 0, 0.40, 0)
KillCounter.Size = UDim2.new(0.85, 0, 0, 18)
KillCounter.Font = Enum.Font.Gotham
KillCounter.Text = "💀 Eliminated: 0"
KillCounter.TextColor3 = Color3.fromRGB(200, 200, 200)
KillCounter.TextSize = 12.000

TargetLabel.Parent = Frame
TargetLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TargetLabel.BackgroundTransparency = 1.000
TargetLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TargetLabel.BorderSizePixel = 0
TargetLabel.Position = UDim2.new(0.075, 0, 0.50, 0)
TargetLabel.Size = UDim2.new(0.85, 0, 0, 18)
TargetLabel.Font = Enum.Font.Gotham
TargetLabel.Text = "🎯 Target: None"
TargetLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
TargetLabel.TextSize = 11.000

AutoFlingToggle.Parent = Frame
AutoFlingToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
AutoFlingToggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
AutoFlingToggle.BorderSizePixel = 0
AutoFlingToggle.Position = UDim2.new(0.1, 0, 0.62, 0)
AutoFlingToggle.Size = UDim2.new(0, 160, 0, 32)
AutoFlingToggle.Font = Enum.Font.GothamBold
AutoFlingToggle.Text = "AUTO FLING: OFF"
AutoFlingToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFlingToggle.TextSize = 14.000

local AutoCorner = Instance.new("UICorner")
AutoCorner.CornerRadius = UDim.new(0, 8)
AutoCorner.Parent = AutoFlingToggle

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.1, 0, 0.78, 0)
TextButton.Size = UDim2.new(0, 160, 0, 45)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "OFF"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 24.000

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 10)
ButtonCorner.Parent = TextButton

local ButtonGradient = Instance.new("UIGradient")
ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(200, 200, 200), Color3.fromRGB(255, 255, 255))
ButtonGradient.Rotation = 90
ButtonGradient.Parent = TextButton

-- Scripts:

local function UltimateFlingScript()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	
	local toggleButton = TextButton
	local autoFlingButton = AutoFlingToggle
	local hiddenfling = false
	local autoFlingEnabled = false
	local flingThread
	local autoFlingThread
	local killCount = 0
	local currentTarget = nil
	
	-- 50 MILLION POWER SETTING
	local FLING_POWER = 50000000
	
	-- Create detection marker
	if not ReplicatedStorage:FindFirstChild("SuperFling_50M_AUTO") then
		local detection = Instance.new("Decal")
		detection.Name = "SuperFling_50M_AUTO"
		detection.Parent = ReplicatedStorage
	end
	
	-- Track eliminations
	local function trackElimination()
		killCount = killCount + 1
		KillCounter.Text = "💀 Eliminated: " .. killCount
		
		-- Flash counter
		KillCounter.TextColor3 = Color3.fromRGB(255, 0, 0)
		wait(0.1)
		KillCounter.TextColor3 = Color3.fromRGB(200, 200, 200)
	end
	
	-- Create FTL teleport effect
	local function createTeleportEffect(position)
		local effect = Instance.new("Part")
		effect.Size = Vector3.new(8, 8, 8)
		effect.Position = position
		effect.Anchored = true
		effect.CanCollide = false
		effect.Material = Enum.Material.Neon
		effect.Color = Color3.fromRGB(255, 0, 0)
		effect.Transparency = 0.3
		effect.Shape = Enum.PartType.Ball
		effect.Parent = workspace
		
		-- Lightning burst
		for i = 1, 12 do
			local lightning = Instance.new("Part")
			lightning.Size = Vector3.new(0.5, 8, 0.5)
			lightning.Anchored = true
			lightning.CanCollide = false
			lightning.Material = Enum.Material.Neon
			lightning.Color = Color3.fromRGB(255, 255, 0)
			lightning.Parent = workspace
			
			local angle = (i / 12) * math.pi * 2
			lightning.CFrame = CFrame.new(position) * CFrame.Angles(0, angle, math.rad(45)) * CFrame.new(0, 0, 4)
			
			TweenService:Create(lightning, TweenInfo.new(0.2), {
				Transparency = 1,
				Size = Vector3.new(0.2, 12, 0.2)
			}):Play()
			Debris:AddItem(lightning, 0.2)
		end
		
		TweenService:Create(effect, TweenInfo.new(0.3), {
			Size = Vector3.new(16, 16, 16),
			Transparency = 1
		}):Play()
		Debris:AddItem(effect, 0.3)
	end
	
	-- Monitor nearby players for elimination tracking
	local function monitorPlayers()
		while hiddenfling do
			wait(0.5)
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= Players.LocalPlayer and player.Character then
					local theirRoot = player.Character:FindFirstChild("HumanoidRootPart")
					local myRoot = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					
					if theirRoot and myRoot then
						local distance = (theirRoot.Position - myRoot.Position).Magnitude
						if distance < 20 and theirRoot.Velocity.Magnitude > 10000 then
							trackElimination()
						end
					end
				end
			end
		end
	end
	
	-- AUTO FLING SYSTEM
	local function autoFling()
		while autoFlingEnabled do
			wait(0.1)
			
			if not hiddenfling then
				wait(1)
				continue
			end
			
			-- Find nearest player
			local nearestPlayer = nil
			local nearestDistance = math.huge
			local myChar = Players.LocalPlayer.Character
			local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
			
			if not myRoot then
				wait(1)
				continue
			end
			
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= Players.LocalPlayer and player.Character then
					local theirRoot = player.Character:FindFirstChild("HumanoidRootPart")
					if theirRoot then
						local distance = (theirRoot.Position - myRoot.Position).Magnitude
						if distance < nearestDistance and distance > 5 then -- Don't target if too close
							nearestDistance = distance
							nearestPlayer = player
						end
					end
				end
			end
			
			-- Teleport to target and fling
			if nearestPlayer and nearestPlayer.Character then
				local theirRoot = nearestPlayer.Character:FindFirstChild("HumanoidRootPart")
				if theirRoot then
					currentTarget = nearestPlayer.Name
					TargetLabel.Text = "🎯 Target: " .. currentTarget
					TargetLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
					
					-- FTL TELEPORT
					local targetPos = theirRoot.Position + Vector3.new(0, 2, 0)
					createTeleportEffect(myRoot.Position) -- Departure effect
					
					myRoot.CFrame = CFrame.new(targetPos)
					
					createTeleportEffect(targetPos) -- Arrival effect
					
					-- Wait for fling to apply
					wait(0.3)
					
					-- Flash on successful fling
					Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
					wait(0.1)
					Frame_2.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
					
					TargetLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
				end
			else
				currentTarget = nil
				TargetLabel.Text = "🎯 Target: None"
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
				-- 50 MILLION POWER
				hrp.Velocity = vel * FLING_POWER + Vector3.new(0, FLING_POWER, 0)
				RunService.RenderStepped:Wait()
				hrp.Velocity = vel
				RunService.Stepped:Wait()
				hrp.Velocity = vel + Vector3.new(0, movel, 0)
				movel = -movel
			end
		end
	end
	
	-- Auto fling toggle
	autoFlingButton.Activated:Connect(function()
		autoFlingEnabled = not autoFlingEnabled
		
		if autoFlingEnabled then
			autoFlingButton.Text = "AUTO FLING: ON"
			autoFlingButton.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
			autoFlingThread = coroutine.create(autoFling)
			coroutine.resume(autoFlingThread)
		else
			autoFlingButton.Text = "AUTO FLING: OFF"
			autoFlingButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
			autoFlingEnabled = false
			currentTarget = nil
			TargetLabel.Text = "🎯 Target: None"
		end
	end)
	
	-- Main fling toggle
	toggleButton.Activated:Connect(function()
		hiddenfling = not hiddenfling
		
		if hiddenfling then
			toggleButton.Text = "ON"
			toggleButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
			Frame_2.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
			HeaderCover.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
			
			-- Pulse effect when active
			spawn(function()
				while hiddenfling do
					for i = 1, 10 do
						Frame.BorderColor3 = Color3.fromRGB(255, i * 25, 0)
						wait(0.05)
					end
					for i = 10, 1, -1 do
						Frame.BorderColor3 = Color3.fromRGB(255, i * 25, 0)
						wait(0.05)
					end
				end
			end)
			
			flingThread = coroutine.create(fling)
			coroutine.resume(flingThread)
			
			spawn(monitorPlayers)
		else
			toggleButton.Text = "OFF"
			toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			HeaderCover.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
			PowerLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
			hiddenfling = false
		end
	end)
	
end

coroutine.wrap(UltimateFlingScript)()

print("🔥💀 SUPER'S ULTIMATE TOUCHFLING + AUTO FLING 💀🔥")
print("⚡ POWER: 50,000,000 (ABSOLUTE MAXIMUM) ⚡")
print("🎯 AUTO FLING: FTL teleport to nearest player")
print("💀 AUTO TARGET & ELIMINATE")
print("Drag GUI to move it around")
print("Toggle AUTO FLING then enable main fling!")
