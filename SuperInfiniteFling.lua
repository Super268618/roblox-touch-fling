-- SUPER'S MAXIMUM POWER TOUCHFLING -- ABSOLUTE MAXIMUM POWER WITH MULTIPLE MODES --
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

-- Mode Scrolling Frame
local ModeScroller = Instance.new("ScrollingFrame")
local ModeList = Instance.new("UIListLayout")

-- Mode Buttons
local NormalBtn = Instance.new("TextButton")
local UltraBtn = Instance.new("TextButton")
local MaxBtn = Instance.new("TextButton")
local MegaBtn = Instance.new("TextButton")
local GodBtn = Instance.new("TextButton")
local FiveBBtn = Instance.new("TextButton")
local TenBBtn = Instance.new("TextButton")
local FiftyBBtn = Instance.new("TextButton")
local HundredBBtn = Instance.new("TextButton")
local OneTBtn = Instance.new("TextButton")
-- New Higher Power Modes
local FiveTBtn = Instance.new("TextButton")
local HundredTBtn = Instance.new("TextButton")
local FiveHundredTBtn = Instance.new("TextButton")
local OneQABtn = Instance.new("TextButton")
local InfiniteBtn = Instance.new("TextButton")

-- Properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.388539821, 0, 0.427821517, 0)
Frame.Size = UDim2.new(0, 220, 0, 380) -- Increased height for more modes
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

-- Mode Selection Scrolling Frame
ModeScroller.Parent = Frame
ModeScroller.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
ModeScroller.BorderSizePixel = 0
ModeScroller.Position = UDim2.new(0.075, 0, 0.36, 0)
ModeScroller.Size = UDim2.new(0.85, 0, 0, 175) -- Increased height
ModeScroller.CanvasSize = UDim2.new(0, 0, 0, 440) -- Increased for all buttons
ModeScroller.ScrollBarThickness = 6
ModeScroller.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)

local ModeCorner = Instance.new("UICorner")
ModeCorner.CornerRadius = UDim.new(0, 8)
ModeCorner.Parent = ModeScroller

ModeList.Parent = ModeScroller
ModeList.SortOrder = Enum.SortOrder.LayoutOrder
ModeList.Padding = UDim.new(0, 5)

-- Mode Title
local ModeTitle = Instance.new("TextLabel")
ModeTitle.Parent = ModeScroller
ModeTitle.BackgroundTransparency = 1
ModeTitle.Size = UDim2.new(1, 0, 0, 18)
ModeTitle.Font = Enum.Font.GothamBold
ModeTitle.Text = "SELECT POWER MODE"
ModeTitle.TextColor3 = Color3.fromRGB(255, 200, 200)
ModeTitle.TextSize = 11
ModeTitle.LayoutOrder = 1

-- Function to create mode buttons
local function createModeButton(text, order, color, textColor)
	local btn = Instance.new("TextButton")
	btn.BackgroundColor3 = color
	btn.Size = UDim2.new(1, 0, 0, 20)
	btn.Font = Enum.Font.Gotham
	btn.Text = text
	btn.TextColor3 = textColor
	btn.TextSize = 10
	btn.LayoutOrder = order
	btn.Parent = ModeScroller
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 5)
	btnCorner.Parent = btn
	
	return btn
end

-- Create all mode buttons
NormalBtn = createModeButton("🔥 NORMAL (50M)", 2, Color3.fromRGB(150, 50, 50), Color3.fromRGB(255, 255, 255))
UltraBtn = createModeButton("💥 ULTRA (100M)", 3, Color3.fromRGB(200, 50, 100), Color3.fromRGB(255, 255, 255))
MaxBtn = createModeButton("⚡ MAXIMUM (200M)", 4, Color3.fromRGB(255, 0, 150), Color3.fromRGB(255, 255, 255))
MegaBtn = createModeButton("🌋 MEGA (500M)", 5, Color3.fromRGB(255, 100, 0), Color3.fromRGB(255, 255, 255))
GodBtn = createModeButton("👑 GOD MODE (1B)", 6, Color3.fromRGB(255, 215, 0), Color3.fromRGB(0, 0, 0))
FiveBBtn = createModeButton("💫 GALACTIC (5B)", 7, Color3.fromRGB(100, 200, 255), Color3.fromRGB(0, 0, 0))
TenBBtn = createModeButton("🌟 SUPERNOVA (10B)", 8, Color3.fromRGB(200, 100, 255), Color3.fromRGB(255, 255, 255))
FiftyBBtn = createModeButton("☄️ COSMIC (50B)", 9, Color3.fromRGB(255, 50, 255), Color3.fromRGB(255, 255, 255))
HundredBBtn = createModeButton("🌌 UNIVERSE (100B)", 10, Color3.fromRGB(0, 200, 255), Color3.fromRGB(0, 0, 0))
OneTBtn = createModeButton("⚡⚡ ULTIMATE (1T)", 11, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255))
-- New Ultra High Power Modes
FiveTBtn = createModeButton("🌀 HYPERNOVA (5T)", 12, Color3.fromRGB(255, 100, 200), Color3.fromRGB(255, 255, 255))
HundredTBtn = createModeButton("🌠 OMNIVERSAL (100T)", 13, Color3.fromRGB(100, 255, 100), Color3.fromRGB(0, 0, 0))
FiveHundredTBtn = createModeButton("💥 BIG BANG (500T)", 14, Color3.fromRGB(255, 150, 0), Color3.fromRGB(255, 255, 255))
OneQABtn = createModeButton("♾️ QUADRATONIC (1QA)", 15, Color3.fromRGB(255, 0, 255), Color3.fromRGB(255, 255, 255))
InfiniteBtn = createModeButton("∞ ABSOLUTE INFINITE ∞", 16, Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0))

KillCounter.Parent = Frame
KillCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KillCounter.BackgroundTransparency = 1.000
KillCounter.BorderColor3 = Color3.fromRGB(0, 0, 0)
KillCounter.BorderSizePixel = 0
KillCounter.Position = UDim2.new(0.075, 0, 0.78, 0)
KillCounter.Size = UDim2.new(0.85, 0, 0, 20)
KillCounter.Font = Enum.Font.Gotham
KillCounter.Text = "💀 Eliminated: 0"
KillCounter.TextColor3 = Color3.fromRGB(200, 200, 200)
KillCounter.TextSize = 13.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.125, 0, 0.88, 0)
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
	
	-- Power settings per mode (UPDATED WITH NEW ULTRA MODES)
	local FLING_POWERS = {
		NORMAL = 50000000,
		ULTRA = 100000000,
		MAXIMUM = 200000000,
		MEGA = 500000000,
		GOD = 1000000000,
		FIVEB = 5000000000,
		TENB = 10000000000,
		FIFTYB = 50000000000,
		HUNDREDB = 100000000000,
		ONET = 1000000000000,
		-- New Ultra High Power Modes
		FIVET = 5000000000000,
		HUNDREDT = 100000000000000,
		FIVEHUNDREDT = 500000000000000,
		ONEQA = 1000000000000000, -- 1 Quadrillion
		INFINITE = 9e18 -- Maximum safe integer in Lua, essentially infinite
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
		local effectName
		
		-- Determine effect based on mode
		if currentMode == "INFINITE" then
			effectColor = Color3.fromRGB(255, 255, 255)
			effectName = "ABSOLUTE INFINITE"
		elseif currentMode == "ONEQA" then
			effectColor = Color3.fromRGB(255, 0, 255)
			effectName = "QUADRATONIC"
		elseif currentMode == "FIVEHUNDREDT" then
			effectColor = Color3.fromRGB(255, 150, 0)
			effectName = "BIG BANG"
		elseif currentMode == "HUNDREDT" then
			effectColor = Color3.fromRGB(100, 255, 100)
			effectName = "OMNIVERSAL"
		elseif currentMode == "FIVET" then
			effectColor = Color3.fromRGB(255, 100, 200)
			effectName = "HYPERNOVA"
		elseif currentMode == "ONET" then
			effectColor = Color3.fromRGB(255, 0, 0)
			effectName = "ULTIMATE"
		elseif currentMode == "HUNDREDB" then
			effectColor = Color3.fromRGB(0, 200, 255)
			effectName = "UNIVERSE"
		elseif currentMode == "FIFTYB" then
			effectColor = Color3.fromRGB(255, 50, 255)
			effectName = "COSMIC"
		elseif currentMode == "TENB" then
			effectColor = Color3.fromRGB(200, 100, 255)
			effectName = "SUPERNOVA"
		elseif currentMode == "FIVEB" then
			effectColor = Color3.fromRGB(100, 200, 255)
			effectName = "GALACTIC"
		elseif currentMode == "GOD" then
			effectColor = Color3.fromRGB(255, 215, 0)
			effectName = "GOD"
		elseif currentMode == "MEGA" then
			effectColor = Color3.fromRGB(255, 100, 0)
			effectName = "MEGA"
		elseif currentMode == "MAXIMUM" then
			effectColor = Color3.fromRGB(255, 0, 255)
			effectName = "MAXIMUM"
		elseif currentMode == "ULTRA" then
			effectColor = Color3.fromRGB(255, 50, 150)
			effectName = "ULTRA"
		else
			effectColor = Color3.fromRGB(255, 100, 100)
			effectName = "NORMAL"
		end
		
		local player = Players.LocalPlayer
		local char = player.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		if not root then return end
		
		-- Enhanced explosion effect based on mode power
		local particleCount = 12
		local explosionSize = 10
		
		-- Scale effects with power level
		if currentMode == "MEGA" then
			particleCount = 20
			explosionSize = 15
		elseif currentMode == "GOD" then
			particleCount = 30
			explosionSize = 20
		elseif currentMode == "FIVEB" then
			particleCount = 35
			explosionSize = 25
		elseif currentMode == "TENB" then
			particleCount = 40
			explosionSize = 30
		elseif currentMode == "FIFTYB" then
			particleCount = 50
			explosionSize = 35
		elseif currentMode == "HUNDREDB" then
			particleCount = 60
			explosionSize = 40
		elseif currentMode == "ONET" then
			particleCount = 75
			explosionSize = 50
		elseif currentMode == "FIVET" then
			particleCount = 85
			explosionSize = 60
		elseif currentMode == "HUNDREDT" then
			particleCount = 95
			explosionSize = 70
		elseif currentMode == "FIVEHUNDREDT" then
			particleCount = 110
			explosionSize = 85
		elseif currentMode == "ONEQA" then
			particleCount = 130
			explosionSize = 100
		elseif currentMode == "INFINITE" then
			particleCount = 150
			explosionSize = 120
		end
		
		-- Create explosion particles
		for i = 1, particleCount do
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
			
			local angle = (i / particleCount) * math.pi * 2
			local targetPos = root.Position + Vector3.new(math.cos(angle) * explosionSize, math.random(-3, 3), math.sin(angle) * explosionSize)
			
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
		
		local targetSize = 30
		if currentMode == "MEGA" then targetSize = 40 end
		if currentMode == "GOD" then targetSize = 50 end
		if currentMode == "FIVEB" then targetSize = 60 end
		if currentMode == "TENB" then targetSize = 70 end
		if currentMode == "FIFTYB" then targetSize = 80 end
		if currentMode == "HUNDREDB" then targetSize = 90 end
		if currentMode == "ONET" then targetSize = 100 end
		if currentMode == "FIVET" then targetSize = 120 end
		if currentMode == "HUNDREDT" then targetSize = 150 end
		if currentMode == "FIVEHUNDREDT" then targetSize = 180 end
		if currentMode == "ONEQA" then targetSize = 220 end
		if currentMode == "INFINITE" then targetSize = 300 end
		
		TweenService:Create(shockwave, TweenInfo.new(0.6), {
			Size = Vector3.new(targetSize, targetSize, targetSize),
			Transparency = 1
		}):Play()
		Debris:AddItem(shockwave, 0.6)
		
		-- Special effects for INFINITE mode
		if currentMode == "INFINITE" then
			-- Create white energy burst
			spawn(function()
				for wave = 1, 5 do
					local extraWave = Instance.new("Part")
					extraWave.Size = Vector3.new(5, 5, 5)
					extraWave.Position = root.Position
					extraWave.Anchored = true
					extraWave.CanCollide = false
					extraWave.Material = Enum.Material.Neon
					extraWave.Color = Color3.fromRGB(255, 255, 255)
					extraWave.Transparency = 0.2
					extraWave.Shape = Enum.PartType.Ball
					extraWave.Parent = FXFolder
					
					TweenService:Create(extraWave, TweenInfo.new(1), {
						Size = Vector3.new(350, 350, 350),
						Transparency = 1
					}):Play()
					Debris:AddItem(extraWave, 1)
					wait(0.1)
				end
			end)
			
			-- Create orbiting infinity symbols
			spawn(function()
				for i = 1, 8 do
					local infPart = Instance.new("Part")
					infPart.Size = Vector3.new(2, 2, 2)
					infPart.Position = root.Position
					infPart.Anchored = true
					infPart.CanCollide = false
					infPart.Material = Enum.Material.Neon
					infPart.Color = Color3.fromRGB(255, 255, 255)
					infPart.Parent = FXFolder
					
					local angle = (i / 8) * math.pi * 2
					local distance = 25
					TweenService:Create(infPart, TweenInfo.new(1.5), {
						Position = root.Position + Vector3.new(math.cos(angle) * distance, 5, math.sin(angle) * distance),
						Transparency = 1
					}):Play()
					Debris:AddItem(infPart, 1.5)
				end
			end)
		end
		
		-- Special effects for QUADRATONIC mode (1QA)
		if currentMode == "ONEQA" then
			spawn(function()
				for wave = 1, 3 do
					local rainbowWave = Instance.new("Part")
					rainbowWave.Size = Vector3.new(10, 10, 10)
					rainbowWave.Position = root.Position
					rainbowWave.Anchored = true
					rainbowWave.CanCollide = false
					rainbowWave.Material = Enum.Material.Neon
					rainbowWave.Color = Color3.fromHSV(wave/6, 1, 1)
					rainbowWave.Transparency = 0.3
					rainbowWave.Shape = Enum.PartType.Ball
					rainbowWave.Parent = FXFolder
					
					TweenService:Create(rainbowWave, TweenInfo.new(0.8), {
						Size = Vector3.new(250, 250, 250),
						Transparency = 1
					}):Play()
					Debris:AddItem(rainbowWave, 0.8)
					wait(0.15)
				end
			end)
			
			-- Create multi-colored particles
			spawn(function()
				for i = 1, 20 do
					local rainbowPart = Instance.new("Part")
					rainbowPart.Size = Vector3.new(3, 3, 3)
					rainbowPart.Position = root.Position
					rainbowPart.Anchored = true
					rainbowPart.CanCollide = false
					rainbowPart.Material = Enum.Material.Neon
					rainbowPart.Color = Color3.fromHSV(i/20, 1, 1)
					rainbowPart.Parent = FXFolder
					
					local angle = (i/20) * math.pi * 2
					TweenService:Create(rainbowPart, TweenInfo.new(1), {
						Position = root.Position + Vector3.new(math.cos(angle) * 40, math.random(-10, 10), math.sin(angle) * 40),
						Transparency = 1
					}):Play()
					Debris:AddItem(rainbowPart, 1)
				end
			end)
		end
		
		-- Special effects for BIG BANG mode (500T)
		if currentMode == "FIVEHUNDREDT" then
			spawn(function()
				-- Create expanding rings
				for ring = 1, 3 do
					local ringPart = Instance.new("Part")
					ringPart.Size = Vector3.new(1, 1, 200)
					ringPart.Position = root.Position
					ringPart.Anchored = true
					ringPart.CanCollide = false
					ringPart.Material = Enum.Material.Neon
					ringPart.Color = Color3.fromRGB(255, 150, 0)
					ringPart.Transparency = 0.4
					ringPart.Parent = FXFolder
					
					TweenService:Create(ringPart, TweenInfo.new(0.7), {
						Size = Vector3.new(1, 1, 400),
						Transparency = 1
					}):Play()
					Debris:AddItem(ringPart, 0.7)
					
					local ringPart2 = Instance.new("Part")
					ringPart2.Size = Vector3.new(200, 1, 1)
					ringPart2.Position = root.Position
					ringPart2.Anchored = true
					ringPart2.CanCollide = false
					ringPart2.Material = Enum.Material.Neon
					ringPart2.Color = Color3.fromRGB(255, 100, 0)
					ringPart2.Transparency = 0.4
					ringPart2.Parent = FXFolder
					
					TweenService:Create(ringPart2, TweenInfo.new(0.7), {
						Size = Vector3.new(400, 1, 1),
						Transparency = 1
					}):Play()
					Debris:AddItem(ringPart2, 0.7)
					wait(0.1)
				end
			end)
		end
		
		-- Special effects for OMNIVERSAL mode (100T)
		if currentMode == "HUNDREDT" then
			spawn(function()
				-- Create green energy orbs
				for orb = 1, 4 do
					local orbPart = Instance.new("Part")
					orbPart.Size = Vector3.new(15, 15, 15)
					orbPart.Position = root.Position
					orbPart.Anchored = true
					orbPart.CanCollide = false
					orbPart.Material = Enum.Material.Neon
					orbPart.Color = Color3.fromRGB(100, 255, 100)
					orbPart.Transparency = 0.3
					orbPart.Shape = Enum.PartType.Ball
					orbPart.Parent = FXFolder
					
					TweenService:Create(orbPart, TweenInfo.new(0.9), {
						Size = Vector3.new(200, 200, 200),
						Transparency = 1
					}):Play()
					Debris:AddItem(orbPart, 0.9)
					wait(0.15)
				end
			end)
		end
		
		-- Special effects for HYPERNOVA mode (5T)
		if currentMode == "FIVET" then
			spawn(function()
				-- Create pink spiral effect
				for i = 1, 12 do
					local spiralPart = Instance.new("Part")
					spiralPart.Size = Vector3.new(4, 4, 4)
					spiralPart.Position = root.Position
					spiralPart.Anchored = true
					spiralPart.CanCollide = false
					spiralPart.Material = Enum.Material.Neon
					spiralPart.Color = Color3.fromRGB(255, 100, 200)
					spiralPart.Shape = Enum.PartType.Ball
					spiralPart.Parent = FXFolder
					
					local angle = (i/12) * math.pi * 4
					local distance = 30
					TweenService:Create(spiralPart, TweenInfo.new(1.2), {
						Position = root.Position + Vector3.new(math.cos(angle) * distance, math.sin(angle) * 5, math.sin(angle) * distance),
						Transparency = 1
					}):Play()
					Debris:AddItem(spiralPart, 1.2)
				end
			end)
		end
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
						if distance < 50 and theirRoot.Velocity.Magnitude > 50000 then
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
	
	-- Function to format large numbers
	local function formatNumber(num)
		if num >= 1000000000000000 then -- Quadrillion
			return string.format("%.1fQA", num / 1000000000000000)
		elseif num >= 1000000000000 then -- Trillion
			return string.format("%.1fT", num / 1000000000000)
		elseif num >= 1000000000 then -- Billion
			return string.format("%.1fB", num / 1000000000)
		elseif num >= 1000000 then -- Million
			return string.format("%.1fM", num / 1000000)
		else
			return tostring(num)
		end
	end
	
	-- Mode selection functions
	local function setMode(mode, power, displayName, powerColor, borderColor, warningText)
		currentMode = mode
		currentPower = power
		PowerLabel.Text = "⚡ POWER: " .. formatNumber(power) .. " ⚡"
		PowerLabel.TextColor3 = powerColor
		WarningLabel.Text = warningText
		WarningLabel.TextColor3 = powerColor
		Frame.BorderColor3 = borderColor
		if hiddenfling then
			createActivationEffect()
		end
	end
	
	NormalBtn.MouseButton1Click:Connect(function()
		setMode("NORMAL", FLING_POWERS.NORMAL, "50M",
			Color3.fromRGB(255, 255, 0),
			Color3.fromRGB(255, 0, 0),
			"🔥 NORMAL MODE 🔥")
	end)
	
	UltraBtn.MouseButton1Click:Connect(function()
		setMode("ULTRA", FLING_POWERS.ULTRA, "100M",
			Color3.fromRGB(255, 100, 255),
			Color3.fromRGB(255, 0, 150),
			"💥 ULTRA MODE 💥")
	end)
	
	MaxBtn.MouseButton1Click:Connect(function()
		setMode("MAXIMUM", FLING_POWERS.MAXIMUM, "200M",
			Color3.fromRGB(255, 0, 255),
			Color3.fromRGB(255, 0, 255),
			"⚡ MAXIMUM MODE ⚡")
	end)
	
	MegaBtn.MouseButton1Click:Connect(function()
		setMode("MEGA", FLING_POWERS.MEGA, "500M",
			Color3.fromRGB(255, 100, 0),
			Color3.fromRGB(255, 100, 0),
			"🌋 MEGA MODE 🌋")
	end)
	
	GodBtn.MouseButton1Click:Connect(function()
		setMode("GOD", FLING_POWERS.GOD, "1B",
			Color3.fromRGB(255, 215, 0),
			Color3.fromRGB(255, 215, 0),
			"👑 GOD MODE 👑")
	end)
	
	FiveBBtn.MouseButton1Click:Connect(function()
		setMode("FIVEB", FLING_POWERS.FIVEB, "5B",
			Color3.fromRGB(100, 200, 255),
			Color3.fromRGB(100, 200, 255),
			"💫 GALACTIC MODE 💫")
	end)
	
	TenBBtn.MouseButton1Click:Connect(function()
		setMode("TENB", FLING_POWERS.TENB, "10B",
			Color3.fromRGB(200, 100, 255),
			Color3.fromRGB(200, 100, 255),
			"🌟 SUPERNOVA MODE 🌟")
	end)
	
	FiftyBBtn.MouseButton1Click:Connect(function()
		setMode("FIFTYB", FLING_POWERS.FIFTYB, "50B",
			Color3.fromRGB(255, 50, 255),
			Color3.fromRGB(255, 50, 255),
			"☄️ COSMIC MODE ☄️")
	end)
	
	HundredBBtn.MouseButton1Click:Connect(function()
		setMode("HUNDREDB", FLING_POWERS.HUNDREDB, "100B",
			Color3.fromRGB(0, 200, 255),
			Color3.fromRGB(0, 200, 255),
			"🌌 UNIVERSE MODE 🌌")
	end)
	
	OneTBtn.MouseButton1Click:Connect(function()
		setMode("ONET", FLING_POWERS.ONET, "1T",
			Color3.fromRGB(255, 0, 0),
			Color3.fromRGB(255, 0, 0),
			"⚡⚡ ULTIMATE MODE ⚡⚡")
	end)
	
	-- New Ultra High Power Mode Buttons
	FiveTBtn.MouseButton1Click:Connect(function()
		setMode("FIVET", FLING_POWERS.FIVET, "5T",
			Color3.fromRGB(255, 100, 200),
			Color3.fromRGB(255, 100, 200),
			"🌀 HYPERNOVA MODE 🌀")
	end)
	
	HundredTBtn.MouseButton1Click:Connect(function()
		setMode("HUNDREDT", FLING_POWERS.HUNDREDT, "100T",
			Color3.fromRGB(100, 255, 100),
			Color3.fromRGB(100, 255, 100),
			"🌠 OMNIVERSAL MODE 🌠")
	end)
	
	FiveHundredTBtn.MouseButton1Click:Connect(function()
		setMode("FIVEHUNDREDT", FLING_POWERS.FIVEHUNDREDT, "500T",
			Color3.fromRGB(255, 150, 0),
			Color3.fromRGB(255, 150, 0),
			"💥 BIG BANG MODE 💥")
	end)
	
	OneQABtn.MouseButton1Click:Connect(function()
		setMode("ONEQA", FLING_POWERS.ONEQA, "1QA",
			Color3.fromRGB(255, 0, 255),
			Color3.fromRGB(255, 0, 255),
			"♾️ QUADRATONIC MODE ♾️")
	end)
	
	InfiniteBtn.MouseButton1Click:Connect(function()
		setMode("INFINITE", FLING_POWERS.INFINITE, "∞",
			Color3.fromRGB(255, 255, 255),
			Color3.fromRGB(255, 255, 255),
			"∞ ABSOLUTE INFINITE ∞")
	end)
	
	-- Main toggle
	toggleButton.MouseButton1Click:Connect(function()
		hiddenfling = not hiddenfling
		
		if hiddenfling then
			toggleButton.Text = "ON"
			toggleButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
			toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			
			-- Set header color based on mode
			local headerColor
			if currentMode == "INFINITE" then
				headerColor = Color3.fromRGB(255, 255, 255)
			elseif currentMode == "ONEQA" then
				headerColor = Color3.fromRGB(255, 0, 255)
			elseif currentMode == "FIVEHUNDREDT" then
				headerColor = Color3.fromRGB(255, 150, 0)
			elseif currentMode == "HUNDREDT" then
				headerColor = Color3.fromRGB(100, 255, 100)
			elseif currentMode == "FIVET" then
				headerColor = Color3.fromRGB(255, 100, 200)
			elseif currentMode == "ONET" then
				headerColor = Color3.fromRGB(255, 0, 0)
			elseif currentMode == "HUNDREDB" then
				headerColor = Color3.fromRGB(0, 200, 255)
			elseif currentMode == "FIFTYB" then
				headerColor = Color3.fromRGB(255, 50, 255)
			elseif currentMode == "TENB" then
				headerColor = Color3.fromRGB(200, 100, 255)
			elseif currentMode == "FIVEB" then
				headerColor = Color3.fromRGB(100, 200, 255)
			elseif currentMode == "GOD" then
				headerColor = Color3.fromRGB(255, 215, 0)
			elseif currentMode == "MEGA" then
				headerColor = Color3.fromRGB(255, 100, 0)
			elseif currentMode == "MAXIMUM" then
				headerColor = Color3.fromRGB(255, 0, 255)
			elseif currentMode == "ULTRA" then
				headerColor = Color3.fromRGB(255, 50, 150)
			else
				headerColor = Color3.fromRGB(255, 0, 0)
			end
			
			Frame_2.BackgroundColor3 = headerColor
			HeaderCover.BackgroundColor3 = headerColor
			
			createActivationEffect()
			
			-- Special border effects based on mode
			if currentMode == "INFINITE" then
				-- White rainbow pulse effect for INFINITE mode
				spawn(function()
					while hiddenfling do
						for hue = 0, 360, 5 do
							if not hiddenfling then break end
							local color = Color3.fromHSV(hue/360, 0.3, 1)
							Frame.BorderColor3 = color
							PowerLabel.TextColor3 = color
							wait(0.02)
						end
					end
				end)
			elseif currentMode == "ONEQA" then
				-- Rainbow pulse effect for QUADRATONIC mode
				spawn(function()
					while hiddenfling do
						for hue = 0, 360, 10 do
							if not hiddenfling then break end
							local color = Color3.fromHSV(hue/360, 1, 1)
							Frame.BorderColor3 = color
							PowerLabel.TextColor3 = color
							wait(0.03)
						end
					end
				end)
			elseif currentMode == "FIVEHUNDREDT" then
				-- Orange pulse effect for BIG BANG mode
				spawn(function()
					while hiddenfling do
						for i = 1, 10 do
							if not hiddenfling then break end
							local intensity = math.sin(i * 0.5) * 0.5 + 0.5
							Frame.BorderColor3 = Color3.fromRGB(255, 150, 0):Lerp(Color3.fromRGB(255, 255, 100), intensity)
							PowerLabel.TextColor3 = Color3.fromRGB(255, 150, 0):Lerp(Color3.fromRGB(255, 255, 100), intensity)
							wait(0.05)
						end
					end
				end)
			elseif currentMode == "HUNDREDT" then
				-- Green pulse effect for OMNIVERSAL mode
				spawn(function()
					while hiddenfling do
						for i = 1, 10 do
							if not hiddenfling then break end
							local intensity = math.sin(i * 0.5) * 0.5 + 0.5
							Frame.BorderColor3 = Color3.fromRGB(100, 255, 100):Lerp(Color3.fromRGB(200, 255, 200), intensity)
							PowerLabel.TextColor3 = Color3.fromRGB(100, 255, 100):Lerp(Color3.fromRGB(200, 255, 200), intensity)
							wait(0.05)
						end
					end
				end)
			elseif currentMode == "FIVET" then
				-- Pink pulse effect for HYPERNOVA mode
				spawn(function()
					while hiddenfling do
						for i = 1, 10 do
							if not hiddenfling then break end
							local intensity = math.sin(i * 0.5) * 0.5 + 0.5
							Frame.BorderColor3 = Color3.fromRGB(255, 100, 200):Lerp(Color3.fromRGB(255, 200, 230), intensity)
							PowerLabel.TextColor3 = Color3.fromRGB(255, 100, 200):Lerp(Color3.fromRGB(255, 200, 230), intensity)
							wait(0.05)
						end
					end
				end)
			elseif currentMode == "ONET" then
				-- Red pulse effect for ULTIMATE mode
				spawn(function()
					while hiddenfling do
						for i = 1, 10 do
							if not hiddenfling then break end
							local intensity = math.sin(i * 0.5) * 0.5 + 0.5
							Frame.BorderColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(255, 150, 150), intensity)
							PowerLabel.TextColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(255, 150, 150), intensity)
							wait(0.05)
						end
					end
				end)
			elseif currentMode == "GOD" then
				-- Gold shimmer effect for GOD mode
				spawn(function()
					while hiddenfling do
						for i = 1, 20 do
							if not hiddenfling then break end
							local intensity = math.sin(i * 0.3) * 0.5 + 0.5
							Frame.BorderColor3 = Color3.fromRGB(255, 215, 0):Lerp(Color3.fromRGB(255, 255, 150), intensity)
							PowerLabel.TextColor3 = Color3.fromRGB(255, 215, 0):Lerp(Color3.fromRGB(255, 255, 150), intensity)
							wait(0.05)
						end
					end
				end)
			elseif currentMode == "MEGA" then
				-- Lava flow effect for MEGA mode
				spawn(function()
					while hiddenfling do
						for hue = 0, 10, 1 do
							if not hiddenfling then break end
							local color = Color3.fromRGB(255, math.random(80, 120), 0)
							Frame.BorderColor3 = color
							PowerLabel.TextColor3 = color
							wait(0.1)
						end
					end
				end)
			elseif currentMode == "MAXIMUM" then
				-- RGB effect for MAXIMUM mode
				spawn(function()
					while hiddenfling do
						for hue = 0, 360, 10 do
							if not hiddenfling then break end
							local color = Color3.fromHSV(hue/360, 1, 1)
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
							local r = 255
							local g = i * 25
							local b = i * (currentMode == "ULTRA" and 15 or 0)
							Frame.BorderColor3 = Color3.fromRGB(r, g, b)
							wait(0.05)
						end
						for i = 10, 1, -1 do
							if not hiddenfling then break end
							local r = 255
							local g = i * 25
							local b = i * (currentMode == "ULTRA" and 15 or 0)
							Frame.BorderColor3 = Color3.fromRGB(r, g, b)
							wait(0.05)
						end
					end
				end)
			end
			
			flingThread = coroutine.create(fling)
			coroutine.resume(flingThread)
			spawn(monitorPlayers)
			
			-- Special warnings for higher modes
			if currentMode == "INFINITE" then
				warn("∞∞∞ ABSOLUTE INFINITE MODE ACTIVATED - INFINITE POWER! ∞∞∞")
			elseif currentMode == "ONEQA" then
				warn("♾️♾️♾️ QUADRATONIC MODE ACTIVATED - 1 QUADRILLION POWER! ♾️♾️♾️")
			elseif currentMode == "FIVEHUNDREDT" then
				warn("💥💥💥 BIG BANG MODE ACTIVATED - 500 TRILLION POWER! 💥💥💥")
			elseif currentMode == "HUNDREDT" then
				warn("🌠🌠🌠 OMNIVERSAL MODE ACTIVATED - 100 TRILLION POWER! 🌠🌠🌠")
			elseif currentMode == "FIVET" then
				warn("🌀🌀🌀 HYPERNOVA MODE ACTIVATED - 5 TRILLION POWER! 🌀🌀🌀")
			elseif currentMode == "ONET" then
				warn("⚡⚡⚡ ULTIMATE MODE ACTIVATED - 1 TRILLION POWER! ⚡⚡⚡")
			elseif currentMode == "HUNDREDB" then
				warn("🌌🌌🌌 UNIVERSE MODE ACTIVATED - 100 BILLION POWER! 🌌🌌🌌")
			elseif currentMode == "GOD" then
				warn("⚡⚡⚡ GOD MODE ACTIVATED - UNSTOPPABLE POWER! ⚡⚡⚡")
			end
			
		else
			toggleButton.Text = "OFF"
			toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			HeaderCover.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			
			-- Reset border color to mode color
			local borderColor
			if currentMode == "INFINITE" then
				borderColor = Color3.fromRGB(255, 255, 255)
			elseif currentMode == "ONEQA" then
				borderColor = Color3.fromRGB(255, 0, 255)
			elseif currentMode == "FIVEHUNDREDT" then
				borderColor = Color3.fromRGB(255, 150, 0)
			elseif currentMode == "HUNDREDT" then
				borderColor = Color3.fromRGB(100, 255, 100)
			elseif currentMode == "FIVET" then
				borderColor = Color3.fromRGB(255, 100, 200)
			elseif currentMode == "ONET" then
				borderColor = Color3.fromRGB(255, 0, 0)
			elseif currentMode == "HUNDREDB" then
				borderColor = Color3.fromRGB(0, 200, 255)
			elseif currentMode == "FIFTYB" then
				borderColor = Color3.fromRGB(255, 50, 255)
			elseif currentMode == "TENB" then
				borderColor = Color3.fromRGB(200, 100, 255)
			elseif currentMode == "FIVEB" then
				borderColor = Color3.fromRGB(100, 200, 255)
			elseif currentMode == "GOD" then
				borderColor = Color3.fromRGB(255, 215, 0)
			elseif currentMode == "MEGA" then
				borderColor = Color3.fromRGB(255, 100, 0)
			elseif currentMode == "MAXIMUM" then
				borderColor = Color3.fromRGB(255, 0, 255)
			elseif currentMode == "ULTRA" then
				borderColor = Color3.fromRGB(255, 0, 150)
			else
				borderColor = Color3.fromRGB(255, 0, 0)
			end
			
			Frame.BorderColor3 = borderColor
			
			-- Reset power label color
			local powerColor
			if currentMode == "INFINITE" then
				powerColor = Color3.fromRGB(255, 255, 255)
			elseif currentMode == "ONEQA" then
				powerColor = Color3.fromRGB(255, 0, 255)
			elseif currentMode == "FIVEHUNDREDT" then
				powerColor = Color3.fromRGB(255, 150, 0)
			elseif currentMode == "HUNDREDT" then
				powerColor = Color3.fromRGB(100, 255, 100)
			elseif currentMode == "FIVET" then
				powerColor = Color3.fromRGB(255, 100, 200)
			elseif currentMode == "ONET" then
				powerColor = Color3.fromRGB(255, 0, 0)
			elseif currentMode == "HUNDREDB" then
				powerColor = Color3.fromRGB(0, 200, 255)
			elseif currentMode == "FIFTYB" then
				powerColor = Color3.fromRGB(255, 50, 255)
			elseif currentMode == "TENB" then
				powerColor = Color3.fromRGB(200, 100, 255)
			elseif currentMode == "FIVEB" then
				powerColor = Color3.fromRGB(100, 200, 255)
			elseif currentMode == "GOD" then
				powerColor = Color3.fromRGB(255, 215, 0)
			elseif currentMode == "MEGA" then
				powerColor = Color3.fromRGB(255, 100, 0)
			elseif currentMode == "MAXIMUM" then
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
print("⚡ 15 POWER MODES NOW AVAILABLE:")
print("🔥 NORMAL (50M)")
print("💥 ULTRA (100M)")
print("⚡ MAXIMUM (200M)")
print("🌋 MEGA (500M)")
print("👑 GOD MODE (1B)")
print("💫 GALACTIC (5B)")
print("🌟 SUPERNOVA (10B)")
print("☄️ COSMIC (50B)")
print("🌌 UNIVERSE (100B)")
print("⚡⚡ ULTIMATE (1T)")
print("🌀 NEW: HYPERNOVA (5T)")
print("🌠 NEW: OMNIVERSAL (100T)")
print("💥 NEW: BIG BANG (500T)")
print("♾️ NEW: QUADRATONIC (1QA)")
print("∞ NEW: ABSOLUTE INFINITE (∞)")
print("📜 Scrolling mode selection")
print("💀 Elimination tracking")
print("🌈 Special effects for all power modes")
print("Select mode then toggle ON! 😎")
