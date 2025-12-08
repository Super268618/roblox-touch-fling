-- Infinite TouchFling + Orbit Fling (All Modes) - LocalScript
-- Place in StarterPlayerScripts (client)
-- R6/R15 compatible
-- NOTE: Use responsibly. This script manipulates velocities and teleports client character.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- wait for character
local function getCharacter()
	return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local char = getCharacter()
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")

-- ---------- CONFIG ----------
local INFINITE_FLING_POWER = 120000 -- affects how violently touched players are launched
local ROTVEL_POWER = 90000 -- rotvelocity for stability fling
local TOUCH_COOLDOWN = 0.025 -- small debounce between touches to avoid spam

-- ---------- GUI ----------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TouchFlingOrbitGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", screenGui)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0.5, 0.5, 0)
frame.Size = UDim2.new(0, 340, 0, 300)
frame.BackgroundColor3 = Color3.fromRGB(18,18,18)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
frame.ZIndex = 5
local ui_corner = Instance.new("UICorner", frame)
ui_corner.CornerRadius = UDim.new(0,8)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -12, 0, 36)
title.Position = UDim2.new(0,6,0,6)
title.BackgroundTransparency = 1
title.Text = "Infinite TouchFling + Orbit (All Modes)"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold

-- name entry
local nameBox = Instance.new("TextBox", frame)
nameBox.Size = UDim2.new(1, -12, 0, 28)
nameBox.Position = UDim2.new(0,6,0,48)
nameBox.PlaceholderText = "Type player name to orbit (partial ok)"
nameBox.Text = ""
nameBox.ClearTextOnFocus = false
nameBox.BackgroundColor3 = Color3.fromRGB(28,28,28)
nameBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", nameBox)

-- mode buttons container
local btnY = 86
local function makeBtn(text)
	local b = Instance.new("TextButton", frame)
	b.Size = UDim2.new(0.32, 0, 0, 28)
	b.Position = UDim2.new(0, 6 + (#frame:GetChildren() * 0), 0, btnY) -- temporary; we'll reposition
	b.BackgroundColor3 = Color3.fromRGB(40,40,40)
	b.TextColor3 = Color3.new(1,1,1)
	b.Text = text
	b.Font = Enum.Font.SourceSans
	b.TextScaled = true
	Instance.new("UICorner", b)
	return b
end

-- create buttons and arrange them manually
local smoothBtn = makeBtn("Smooth")
local aggressiveBtn = makeBtn("Aggressive")
local ftlBtn = makeBtn("FTL")
smoothBtn.Position = UDim2.new(0,6,0,btnY)
aggressiveBtn.Position = UDim2.new(0,116,0,btnY)
ftlBtn.Position = UDim2.new(0,226,0,btnY)

-- Start / Stop Orbit
local startBtn = Instance.new("TextButton", frame)
startBtn.Size = UDim2.new(0.48, -8, 0, 36)
startBtn.Position = UDim2.new(0,6,0,126)
startBtn.BackgroundColor3 = Color3.fromRGB(24,140,24)
startBtn.Text = "START ORBIT"
startBtn.TextScaled = true
Instance.new("UICorner", startBtn)

local stopBtn = Instance.new("TextButton", frame)
stopBtn.Size = UDim2.new(0.48, -8, 0, 36)
stopBtn.Position = UDim2.new(0,170,0,126)
stopBtn.BackgroundColor3 = Color3.fromRGB(160,24,24)
stopBtn.Text = "STOP ORBIT"
stopBtn.TextScaled = true
Instance.new("UICorner", stopBtn)

-- status label
local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -12, 0, 22)
status.Position = UDim2.new(0,6,0,170)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(200,200,200)
status.Text = "Orbit: OFF  | Mode: Smooth"
status.TextScaled = false

-- key hints
local hint = Instance.new("TextLabel", frame)
hint.Size = UDim2.new(1, -12, 0, 24)
hint.Position = UDim2.new(0,6,0,196)
hint.BackgroundTransparency = 1
hint.TextColor3 = Color3.fromRGB(160,160,160)
hint.Text = "Keys: E/Q = Radius, R/F = Speed, T = Toggle Infinite Fling"
hint.TextScaled = false

-- sliders info
local radiusLabel = Instance.new("TextLabel", frame)
radiusLabel.Size = UDim2.new(0.5, -8, 0, 20)
radiusLabel.Position = UDim2.new(0,6,0,220)
radiusLabel.BackgroundTransparency = 1
radiusLabel.TextColor3 = Color3.new(1,1,1)
radiusLabel.Text = "Radius: 10"
radiusLabel.TextScaled = true

local speedLabel = Instance.new("TextLabel", frame)
speedLabel.Size = UDim2.new(0.5, -8, 0, 20)
speedLabel.Position = UDim2.new(0.5, 2, 0,220)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Text = "Speed: 4"
speedLabel.TextScaled = true

-- ---------- FLING PART ----------
local flingPart = Instance.new("Part")
flingPart.Size = Vector3.new(6,6,6)
flingPart.Transparency = 1
flingPart.CanCollide = false
flingPart.Anchored = false
flingPart.Massless = true
flingPart.Parent = workspace

-- weld flingPart to local player's HRP so it follows the player when not orbiting
local weld = Instance.new("WeldConstraint")
weld.Part0 = hrp
weld.Part1 = flingPart
weld.Parent = flingPart

-- touch debounce
local lastTouch = 0

flingPart.Touched:Connect(function(hit)
	local now = tick()
	if now - lastTouch < TOUCH_COOLDOWN then return end
	lastTouch = now

	local targetChar = hit.Parent
	if not targetChar then return end
	local targetHum = targetChar:FindFirstChildWhichIsA("Humanoid")
	local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
	if targetHum and targetHRP and targetChar ~= char then
		-- apply violent velocity to the touched target (infinite fling)
		targetHRP.Velocity = Vector3.new(
			math.random(-INFINITE_FLING_POWER, INFINITE_FLING_POWER),
			math.random(INFINITE_FLING_POWER * 1.5, INFINITE_FLING_POWER * 3),
			math.random(-INFINITE_FLING_POWER, INFINITE_FLING_POWER)
		)
	end
end)

-- Ensure fling part follows player when orbit inactive
local orbiting = false
local orbitTarget = nil
local orbitMode = "Smooth" -- "Smooth", "Aggressive", "FTL"

-- orbit parameters (modifiable)
local radius = 10
local omega = 4 -- base angular speed
local aggressiveMultiplier = 6
local ftlMultiplier = 80

-- helper: find player by name (partial, case-insensitive)
local function findPlayerByName(name)
	if not name or name == "" then return nil end
	name = name:lower()
	for _,p in ipairs(Players:GetPlayers()) do
		if p ~= LocalPlayer then
			if p.Name:lower():find(name, 1, true) or (p.DisplayName and p.DisplayName:lower():find(name,1,true)) then
				return p
			end
		end
	end
	return nil
end

-- stops orbit and returns flingPart welded back to player
local function stopOrbit()
	orbiting = false
	orbitTarget = nil
	-- re-weld to HRP
	if weld and weld.Parent then
		weld.Part0 = hrp
		weld.Part1 = flingPart
		weld.Parent = flingPart
	end
	status.Text = "Orbit: OFF  | Mode: "..orbitMode
end

-- orbit coroutine
local orbitCoroutine = nil
local function startOrbitFor(player)
	if not player or not player.Character then return end
	local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
	if not targetHRP then return end

	-- remove weld so flingPart can move free (we'll set CFrame directly)
	if weld and weld.Parent then
		weld:Destroy()
	end
	orbiting = true
	orbitTarget = player

	status.Text = "Orbit: ON  | Mode: "..orbitMode.."  | Target: "..player.Name

	-- main loop
	orbitCoroutine = RunService.Heartbeat:Connect(function(dt)
		if not orbiting or not orbitTarget or not orbitTarget.Character then
			orbiting = false
			orbitTarget = nil
			if orbitCoroutine then orbitCoroutine:Disconnect(); orbitCoroutine = nil end
			return
		end

		local targetRoot = orbitTarget.Character:FindFirstChild("HumanoidRootPart")
		if not targetRoot then return end

		local t = tick()
		local mult = 1
		if orbitMode == "Aggressive" then
			mult = aggressiveMultiplier
		elseif orbitMode == "FTL" then
			mult = ftlMultiplier
		end
		local ang = t * omega * mult
		-- keep a slight vertical offset to hit reliably
		local x = math.cos(ang) * radius
		local z = math.sin(ang) * radius
		local targetPos = targetRoot.Position + Vector3.new(x, 1.5, z)

		-- Behavior per mode:
		if orbitMode == "Smooth" then
			-- smooth interpolation to avoid jerkiness
			local newCFrame = CFrame.new(targetPos, targetRoot.Position)
			flingPart.CFrame = newCFrame
			-- maintain rotational velocity on player for fling assistance
			hrp.RotVelocity = Vector3.new(
				math.random(-ROTVEL_POWER, ROTVEL_POWER),
				math.random(-ROTVEL_POWER, ROTVEL_POWER),
				math.random(-ROTVEL_POWER, ROTVEL_POWER)
			)
		elseif orbitMode == "Aggressive" then
			-- faster orbit, apply extra pulses to target to ensure fling
			flingPart.CFrame = CFrame.new(targetPos, targetRoot.Position)
			targetRoot.Velocity = Vector3.new(
				math.random(-INFINITE_FLING_POWER*0.6, INFINITE_FLING_POWER*0.6),
				math.random(INFINITE_FLING_POWER*1.2, INFINITE_FLING_POWER*2),
				math.random(-INFINITE_FLING_POWER*0.6, INFINITE_FLING_POWER*0.6)
			)
			hrp.RotVelocity = Vector3.new(
				math.random(-ROTVEL_POWER*1.2, ROTVEL_POWER*1.2),
				math.random(-ROTVEL_POWER*1.2, ROTVEL_POWER*1.2),
				math.random(-ROTVEL_POWER*1.2, ROTVEL_POWER*1.2)
			)
		elseif orbitMode == "FTL" then
			-- teleporting blink-like orbit + massive velocity pulses
			-- small wait to look instantaneous but not freeze; high multiplier controls speed
			flingPart.CFrame = CFrame.new(targetPos, targetRoot.Position)
			-- Overwhelm target velocity (very large)
			if targetRoot and targetRoot.Parent ~= char then
				targetRoot.Velocity = Vector3.new(
					math.random(-INFINITE_FLING_POWER*6, INFINITE_FLING_POWER*6),
					math.random(INFINITE_FLING_POWER*6, INFINITE_FLING_POWER*18),
					math.random(-INFINITE_FLING_POWER*6, INFINITE_FLING_POWER*6)
				)
			end
			-- also keep HRP rotv very high so collisions are brutal
			hrp.RotVelocity = Vector3.new(
				math.random(-ROTVEL_POWER*6, ROTVEL_POWER*6),
				math.random(-ROTVEL_POWER*6, ROTVEL_POWER*6),
				math.random(-ROTVEL_POWER*6, ROTVEL_POWER*6)
			)
		end
	end)
end

-- ---------- GUI BUTTON LOGIC ----------
local function setMode(m)
	orbitMode = m
	status.Text = (orbiting and "Orbit: ON  | Mode: "..orbitMode or "Orbit: OFF  | Mode: "..orbitMode)
end

smoothBtn.MouseButton1Click:Connect(function() setMode("Smooth") end)
aggressiveBtn.MouseButton1Click:Connect(function() setMode("Aggressive") end)
ftlBtn.MouseButton1Click:Connect(function() setMode("FTL") end)

startBtn.MouseButton1Click:Connect(function()
	local name = nameBox.Text
	local p = findPlayerByName(name)
	if not p then
		status.Text = "Target not found: "..(name ~= "" and name or "<blank>")
		return
	end
	startOrbitFor(p)
end)

stopBtn.MouseButton1Click:Connect(function()
	stopOrbit()
end)

-- ---------- keybinds for radius / speed / toggle infinite fling ----------
local infiniteFlingEnabled = true
status.Text = "Orbit: OFF  | Mode: "..orbitMode

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.E then
		radius = radius + 2
		radiusLabel.Text = "Radius: "..radius
	elseif input.KeyCode == Enum.KeyCode.Q then
		radius = math.max(2, radius - 2)
		radiusLabel.Text = "Radius: "..radius
	elseif input.KeyCode == Enum.KeyCode.R then
		omega = omega + 1
		speedLabel.Text = "Speed: "..omega
	elseif input.KeyCode == Enum.KeyCode.F then
		omega = math.max(1, omega - 1)
		speedLabel.Text = "Speed: "..omega
	elseif input.KeyCode == Enum.KeyCode.T then
		infiniteFlingEnabled = not infiniteFlingEnabled
		if infiniteFlingEnabled then
			flingPart.Transparency = 1
			status.Text = (orbiting and "Orbit: ON  | Mode: "..orbitMode or "Orbit: OFF  | Mode: "..orbitMode).." | Infinite: ON"
		else
			flingPart.Transparency = 0.6
			status.Text = (orbiting and "Orbit: ON  | Mode: "..orbitMode or "Orbit: OFF  | Mode: "..orbitMode).." | Infinite: OFF"
		end
	end
end)

-- ---------- keep flingPart attached to player HRP when orbit not active ----------
RunService.Heartbeat:Connect(function()
	if not orbiting then
		-- weld if not present
		if not (weld and weld.Parent) then
			weld = Instance.new("WeldConstraint")
			weld.Part0 = hrp
			weld.Part1 = flingPart
			weld.Parent = flingPart
		end
		-- position flingPart near HRP (small offset behind)
		local behind = hrp.CFrame * CFrame.new(0, 0, -2)
		flingPart.CFrame = behind
		-- maintain rot velocity for stable fling
		hrp.RotVelocity = Vector3.new(
			math.random(-ROTVEL_POWER, ROTVEL_POWER),
			math.random(-ROTVEL_POWER, ROTVEL_POWER),
			math.random(-ROTVEL_POWER, ROTVEL_POWER)
		)
	end
end)

-- ---------- ensure proper cleanup on character respawn ----------
LocalPlayer.CharacterAdded:Connect(function(newChar)
	char = newChar
	hrp = char:WaitForChild("HumanoidRootPart")
	hum = char:WaitForChild("Humanoid")
	-- reparent flingPart and weld
	flingPart.Parent = workspace
	if weld and weld.Parent then weld:Destroy() end
	weld = Instance.new("WeldConstraint")
	weld.Part0 = hrp
	weld.Part1 = flingPart
	weld.Parent = flingPart
	stopOrbit()
end)

-- initial status
status.Text = "Orbit: OFF  | Mode: "..orbitMode.." | Infinite: ON"

-- Script ready
print("Infinite TouchFling + Orbit (All Modes) loaded.")
