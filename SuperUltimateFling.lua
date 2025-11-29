-- Super's Ultimate Touchfling - 15,000,000 POWER (MAXIMUM LEVEL)
-- WARNING: ABSOLUTE MAXIMUM POWER - DELETES PLAYERS FROM EXISTENCE

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local PowerLabel = Instance.new("TextLabel")
local WarningLabel = Instance.new("TextLabel")
local KillCounter = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.388539821, 0, 0.427821517, 0)
Frame.Size = UDim2.new(0, 200, 0, 190)
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
TextLabel.TextSize = 14.000
TextLabel.TextScaled = true

PowerLabel.Parent = Frame
PowerLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PowerLabel.BackgroundTransparency = 1.000
PowerLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
PowerLabel.BorderSizePixel = 0
PowerLabel.Position = UDim2.new(0.075, 0, 0.21, 0)
PowerLabel.Size = UDim2.new(0.85, 0, 0, 28)
PowerLabel.Font = Enum.Font.GothamBold
PowerLabel.Text = "⚡ POWER: 15,000,000 ⚡"
PowerLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
PowerLabel.TextSize = 15.000

WarningLabel.Parent = Frame
WarningLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WarningLabel.BackgroundTransparency = 1.000
WarningLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
WarningLabel.BorderSizePixel = 0
WarningLabel.Position = UDim2.new(0.075, 0, 0.36, 0)
WarningLabel.Size = UDim2.new(0.85, 0, 0, 22)
WarningLabel.Font = Enum.Font.SourceSansBold
WarningLabel.Text = "🔥 MAXIMUM LEVEL 🔥"
WarningLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
WarningLabel.TextSize = 14.000

KillCounter.Parent = Frame
KillCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KillCounter.BackgroundTransparency = 1.000
KillCounter.BorderColor3 = Color3.fromRGB(0, 0, 0)
KillCounter.BorderSizePixel = 0
KillCounter.Position = UDim2.new(0.075, 0, 0.5, 0)
KillCounter.Size = UDim2.new(0.85, 0, 0, 20)
KillCounter.Font = Enum.Font.Gotham
KillCounter.Text = "💀 Eliminated: 0"
KillCounter.TextColor3 = Color3.fromRGB(200, 200, 200)
KillCounter.TextSize = 13.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.125, 0, 0.68, 0)
TextButton.Size = UDim2.new(0, 150, 0, 50)
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

local function UltimateFlingScript()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	
	local toggleButton = TextButton
	local hiddenfling = false
	local flingThread 
	local killCount = 0
	
	-- 15 MILLION POWER SETTING - ABSOLUTE MAXIMUM
	local FLING_POWER = 15000000
	
	-- Create detection marker
	if not ReplicatedStorage:FindFirstChild("SuperFling_15M_MAX") then
		local detection = Instance.new("Decal")
		detection.Name = "SuperFling_15M_MAX"
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
						-- If they were close and now have extreme velocity, they got flung
						if distance < 20 and theirRoot.Velocity.Magnitude > 10000 then
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
				-- 15 MILLION POWER - ABSOLUTE MAXIMUM LEVEL
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
			ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100))
			toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			Frame_2.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
			HeaderCover.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
			PowerLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
			
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
			ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(200, 200, 200), Color3.fromRGB(255, 255, 255))
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

print("🔥💀 SUPER'S ULTIMATE TOUCHFLING - MAXIMUM LEVEL 💀🔥")
print("⚡ POWER: 15,000,000 (ABSOLUTE MAXIMUM) ⚡")
print("WARNING: THIS IS THE HIGHEST POWER POSSIBLE!")
print("Players will be DELETED from existence on contact!")
print("Drag GUI to move it around")
print("Click button to toggle ON/OFF")
