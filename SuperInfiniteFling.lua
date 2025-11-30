-- Super's INFINITE Touchfling - ABSOLUTE NO LIMITS MODE
-- WARNING: INFINITE POWER - REALITY BREAKING LEVELS

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
local ModeLabel = Instance.new("TextLabel")
local AuraToggle = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(5, 0, 10)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 255)
Frame.BorderSizePixel = 4
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.Size = UDim2.new(0, 250, 0, 280)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new(
	Color3.fromRGB(10, 0, 20),
	Color3.fromRGB(50, 0, 50),
	Color3.fromRGB(10, 0, 20)
)
UIGradient.Rotation = 45
UIGradient.Parent = Frame

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 250, 0, 40)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 15)
HeaderCorner.Parent = Frame_2

local HeaderCover = Instance.new("Frame")
HeaderCover.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
HeaderCover.BorderSizePixel = 0
HeaderCover.Position = UDim2.new(0, 0, 0.5, 0)
HeaderCover.Size = UDim2.new(1, 0, 0.5, 0)
HeaderCover.Parent = Frame_2

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.02, 0, 0, 0)
TextLabel.Size = UDim2.new(0.96, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "♾️ SUPER'S INFINITE FLING ♾️"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextScaled = true

PowerLabel.Parent = Frame
PowerLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PowerLabel.BackgroundTransparency = 1.000
PowerLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
PowerLabel.BorderSizePixel = 0
PowerLabel.Position = UDim2.new(0.06, 0, 0.16, 0)
PowerLabel.Size = UDim2.new(0.88, 0, 0, 30)
PowerLabel.Font = Enum.Font.GothamBold
PowerLabel.Text = "⚡ POWER: INFINITE ♾️ ⚡"
PowerLabel.TextColor3 = Color3.fromRGB(255, 50, 255)
PowerLabel.TextSize = 16.000

WarningLabel.Parent = Frame
WarningLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WarningLabel.BackgroundTransparency = 1.000
WarningLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
WarningLabel.BorderSizePixel = 0
WarningLabel.Position = UDim2.new(0.06, 0, 0.28, 0)
WarningLabel.Size = UDim2.new(0.88, 0, 0, 22)
WarningLabel.Font = Enum.Font.SourceSansBold
WarningLabel.Text = "🌌 REALITY BREAKER 🌌"
WarningLabel.TextColor3 = Color3.fromRGB(150, 255, 255)
WarningLabel.TextSize = 14.000

ModeLabel.Parent = Frame
ModeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ModeLabel.BackgroundTransparency = 1.000
ModeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ModeLabel.BorderSizePixel = 0
ModeLabel.Position = UDim2.new(0.06, 0, 0.38, 0)
ModeLabel.Size = UDim2.new(0.88, 0, 0, 20)
ModeLabel.Font = Enum.Font.Gotham
ModeLabel.Text = "💫 Mode: GODMODE 💫"
ModeLabel.TextColor3 = Color3.fromRGB(255, 200, 255)
ModeLabel.TextSize = 12.000

KillCounter.Parent = Frame
KillCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KillCounter.BackgroundTransparency = 1.000
KillCounter.BorderColor3 = Color3.fromRGB(0, 0, 0)
KillCounter.BorderSizePixel = 0
KillCounter.Position = UDim2.new(0.06, 0, 0.48, 0)
KillCounter.Size = UDim2.new(0.88, 0, 0, 20)
KillCounter.Font = Enum.Font.Gotham
KillCounter.Text = "💀 Obliterated: 0"
KillCounter.TextColor3 = Color3.fromRGB(255, 100, 255)
KillCounter.TextSize = 13.000

AuraToggle.Parent = Frame
AuraToggle.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
AuraToggle.Position = UDim2.new(0.1, 0, 0.6, 0)
AuraToggle.Size = UDim2.new(0.8, 0, 0, 35)
AuraToggle.Font = Enum.Font.GothamBold
AuraToggle.Text = "AURA: OFF"
AuraToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AuraToggle.TextSize = 16.000

local AuraCorner = Instance.new("UICorner")
AuraCorner.CornerRadius = UDim.new(0, 8)
AuraCorner.Parent = AuraToggle

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.1, 0, 0.75, 0)
TextButton.Size = UDim2.new(0.8, 0, 0, 55)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "OFF"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 28.000

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 12)
ButtonCorner.Parent = TextButton

local ButtonGradient = Instance.new("UIGradient")
ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(150, 0, 200), Color3.fromRGB(255, 0, 255))
ButtonGradient.Rotation = 90
ButtonGradient.Parent = TextButton

-- Scripts:

local function InfiniteFlingScript()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	
	local toggleButton = TextButton
	local auraButton = AuraToggle
	local hiddenfling = false
	local auraEnabled = false
	local flingThread 
	local killCount = 0
	
	local FXFolder = Instance.new("Folder", workspace)
	FXFolder.Name = "InfiniteFlingFX"
	
	-- INFINITE POWER - MATH.HUGE (∞)
	local FLING_POWER = math.huge
	
	-- Create detection marker
	if not ReplicatedStorage:FindFirstChild("SuperFling_INFINITE") then
		local detection = Instance.new("Decal")
		detection.Name = "SuperFling_INFINITE"
		detection.Parent = ReplicatedStorage
	end
	
	-- REALITY DISTORTION AURA
	local auraConnection
	local function createInfiniteAura()
		local lp = Players.LocalPlayer
		local char = lp.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		if not root then return end
		
		-- Main purple aura
		local aura = Instance.new("Part")
		aura.Name = "InfiniteAura"
		aura.Size = Vector3.new(15, 15, 15)
		aura.Anchored = true
		aura.CanCollide = false
		aura.Material = Enum.Material.Neon
		aura.Color = Color3.fromRGB(150, 0, 255)
		aura.Transparency = 0.6
		aura.Shape = Enum.PartType.Ball
		aura.Parent = FXFolder
		
		-- Energy rings
		local rings = {}
		for i = 1, 3 do
			local ring = Instance.new("Part")
			ring.Size = Vector3.new(0.5, 10 + (i * 3), 10 + (i * 3))
			ring.Anchored = true
			ring.CanCollide = false
			ring.Material = Enum.Material.Neon
			ring.Color = Color3.fromRGB(255, 0, 255)
			ring.Transparency = 0.7
			ring.Parent = FXFolder
			
			local mesh = Instance.new("SpecialMesh")
			mesh.MeshType = Enum.MeshType.Cylinder
			mesh.Parent = ring
			
			table.insert(rings, {part = ring, offset = i * 120})
		end
		
		-- Lightning bolts
		local function createLightning()
			if not auraEnabled then return end
			local lightning = Instance.new("Part")
			lightning.Size = Vector3.new(0.3, 15, 0.3)
			lightning.Anchored = true
			lightning.CanCollide = false
			lightning.Material = Enum.Material.Neon
			lightning.Color = Color3.fromRGB(255, 255, 255)
			lightning.Parent = FXFolder
			
			local angle = math.random(0, 360)
			lightning.CFrame = root.CFrame * CFrame.Angles(0, math.rad(angle), math.rad(45)) * CFrame.new(0, 0, 8)
			
			TweenService:Create(lightning, TweenInfo.new(0.2), {
				Transparency = 1,
				Size = Vector3.new(0.1, 20, 0.1)
			}):Play()
			Debris:AddItem(lightning, 0.2)
		end
		
		auraConnection = RunService.Heartbeat:Connect(function()
			if not auraEnabled or not root.Parent then
				aura:Destroy()
				for _, ring in pairs(rings) do
					ring.part:Destroy()
				end
				if auraConnection then
					auraConnection:Disconnect()
				end
				return
			end
			
			-- Update aura position
			aura.Position = root.Position
			aura.CFrame = aura.CFrame * CFrame.Angles(0, math.rad(2), 0)
			
			-- Pulse effect
			local scale = 1 + math.sin(tick() * 3) * 0.2
			aura.Size = Vector3.new(15 * scale, 15 * scale, 15 * scale)
			
			-- Update rings
			for i, ring in pairs(rings) do
				ring.part.CFrame = root.CFrame * CFrame.Angles(math.rad(90), 0, math.rad(ring.offset + (tick() * 100)))
			end
			
			-- Random lightning
			if math.random(1, 10) == 1 then
				createLightning()
			end
		end)
	end
	
	-- Track eliminations with visual feedback
	local function trackElimination()
		killCount = killCount + 1
		KillCounter.Text = "💀 Obliterated: " .. killCount
		
		-- Epic flash effect
		spawn(function()
			for i = 1, 3 do
				KillCounter.TextColor3 = Color3.fromRGB(255, 0, 255)
				KillCounter.TextSize = 16
				wait(0.1)
				KillCounter.TextColor3 = Color3.fromRGB(255, 100, 255)
				KillCounter.TextSize = 13
				wait(0.1)
			end
		end)
	end
	
	-- Monitor nearby players
	local function monitorPlayers()
		while hiddenfling do
			wait(0.3)
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= Players.LocalPlayer and player.Character then
					local theirRoot = player.Character:FindFirstChild("HumanoidRootPart")
					local myRoot = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					
					if theirRoot and myRoot then
						local distance = (theirRoot.Position - myRoot.Position).Magnitude
						-- Track if they got flung
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
				-- INFINITE POWER - ABSOLUTE NO LIMITS
				hrp.Velocity = vel * FLING_POWER + Vector3.new(0, FLING_POWER, 0)
				RunService.RenderStepped:Wait()
				hrp.Velocity = vel
				RunService.Stepped:Wait()
				hrp.Velocity = vel + Vector3.new(0, movel, 0)
				movel = -movel
			end
		end
	end
	
	-- Aura toggle
	auraButton.MouseButton1Click:Connect(function()
		auraEnabled = not auraEnabled
		
		if auraEnabled then
			auraButton.Text = "AURA: ON"
			auraButton.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
			createInfiniteAura()
		else
			auraButton.Text = "AURA: OFF"
			auraButton.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
			if auraConnection then
				auraConnection:Disconnect()
			end
		end
	end)
	
	-- Main toggle
	toggleButton.MouseButton1Click:Connect(function()
		hiddenfling = not hiddenfling
		
		if hiddenfling then
			toggleButton.Text = "ACTIVE"
			ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100))
			Frame_2.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			HeaderCover.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
			
			-- INSANE RGB border effect
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
			
			flingThread = coroutine.create(fling)
			coroutine.resume(flingThread)
			spawn(monitorPlayers)
		else
			toggleButton.Text = "OFF"
			ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(150, 0, 200), Color3.fromRGB(255, 0, 255))
			Frame_2.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
			HeaderCover.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
			Frame.BorderColor3 = Color3.fromRGB(255, 0, 255)
			PowerLabel.TextColor3 = Color3.fromRGB(255, 50, 255)
			hiddenfling = false
		end
	end)
	
end

coroutine.wrap(InfiniteFlingScript)()

print("♾️🔥💀 SUPER'S INFINITE TOUCHFLING LOADED 💀🔥♾️")
print("⚡ POWER: INFINITE (NO LIMITS) ⚡")
print("🌌 REALITY BREAKING MODE ACTIVATED 🌌")
print("Features: Infinite power, reality distortion aura, RGB effects")
print("This is the ULTIMATE maximum - nothing can beat this!")
print("Drag GUI to move it around")
