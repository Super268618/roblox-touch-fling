-- Infinite TouchFling + Orbit Fling (All Modes, INFINITE POWER)
-- LocalScript (client)
-- R6/R15 compatible
-- Place in StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- wait for character
local function getCharacter()
	return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local char = getCharacter()
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")

-- ---------- CONFIG (INFINITE POWER) ----------
local INFINITE_FLING_POWER = 999999999999 -- INFINITE POWER (very large)
local ROTVEL_POWER = 99999999
local TOUCH_COOLDOWN = 0.02

-- ---------- GUI (fixed text sizes & colors) ----------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TouchFlingOrbitGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", screenGui)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0.5, 0.5, 0)
frame.Size = UDim2.new(0, 380, 0, 380)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 44)
title.Position = UDim2.new(0,10,0,8)
title.BackgroundTransparency = 1
title.Text = "Infinite TouchFling + Orbit Modes (INFINITE POWER)"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Left

local nameBox = Instance.new("TextBox", frame)
nameBox.Size = UDim2.new(1, -20, 0, 36)
nameBox.Position = UDim2.new(0,10,0,62)
nameBox.PlaceholderText = "Enter player name to orbit (partial ok)"
nameBox.Text = ""
nameBox.ClearTextOnFocus = false
nameBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
nameBox.TextColor3 = Color3.fromRGB(255,255,255)
nameBox.Font = Enum.Font.Gotham
nameBox.TextSize = 16
Instance.new("UICorner", nameBox)

-- Mode buttons
local function makeButton(txt, xPos)
	local b = Instance.new("TextButton", frame)
	b.Size = UDim2.new(0,116,0,36)
	b.Position = UDim2.new(0, xPos, 0, 110)
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.TextColor3 = Color3.new(1,1,1)
	b.Text = txt
	b.Font = Enum.Font.GothamMedium
	b.TextSize = 16
	Instance.new("UICorner", b)
	return b
end

local smoothBtn = makeButton("Smooth", 10)
local aggressiveBtn = makeButton("Aggressive", 132)
local ftlBtn = makeButton("FTL", 254)

local startBtn = Instance.new("TextButton", frame)
startBtn.Size = UDim2.new(0, 180, 0, 40)
startBtn.Position = UDim2.new(0,10,0,162)
startBtn.BackgroundColor3 = Color3.fromRGB(30,150,30)
startBtn.Text = "START ORBIT"
startBtn.TextColor3 = Color3.new(1,1,1)
startBtn.Font = Enum.Font.GothamBold
startBtn.TextSize = 18
Instance.new("UICorner", startBtn)

local stopBtn = Instance.new("TextButton", frame)
stopBtn.Size = UDim2.new(0, 180, 0, 40)
stopBtn.Position = UDim2.new(0,190,0,162)
stopBtn.BackgroundColor3 = Color3.fromRGB(150,30,30)
stopBtn.Text = "STOP ORBIT"
stopBtn.TextColor3 = Color3.new(1,1,1)
stopBtn.Font = Enum.Font.GothamBold
stopBtn.TextSize = 18
Instance.new("UICorner", stopBtn)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 28)
status.Position = UDim2.new(0,10,0,212)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(255,255,255)
status.Font = Enum.Font.Gotham
status.TextSize = 16
status.Text = "Orbit: OFF | Mode: Smooth | Infinite: ON"

local radiusLabel = Instance.new("TextLabel", frame)
radiusLabel.Size = UDim2.new(0.5, -12, 0, 26)
radiusLabel.Position = UDim2.new(0,10,0,246)
radiusLabel.BackgroundTransparency = 1
radiusLabel.TextColor3 = Color3.new(1,1,1)
radiusLabel.Font = Enum.Font.Gotham
radiusLabel.TextSize = 16
radiusLabel.Text = "Radius: 10"

local speedLabel = Instance.new("TextLabel", frame)
speedLabel.Size = UDim2.new(0.5, -12, 0, 26)
speedLabel.Position = UDim2.new(0.5,2,0,246)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 16
speedLabel.Text = "Speed: 4"

local hint = Instance.new("TextLabel", frame)
hint.Size = UDim2.new(1, -20, 0, 26)
hint.Position = UDim2.new(0,10,0,282)
hint.BackgroundTransparency = 1
hint.TextColor3 = Color3.fromRGB(200,200,200)
hint.Font = Enum.Font.Gotham
hint.TextSize = 14
hint.Text = "Keys: E/Q = Radius  |  R/F = Speed  |  T = Toggle Infinite Fling"

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
			math.random(INFINITE_FLING_POWER * 2, INFINITE_FLING_POWER * 6),
			math.random(-INFINITE_FLING_POWER, INFINITE_FLING_POWER)
		)
	end
end)

-- ---------- Orbit state ----------
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
			local cleanName = p.Name:lower()
			local display = (p.DisplayName and p.DisplayName:lower() or "")
			if cleanName:find(name, 1, true) or (display ~= "" and display:find(name,1,true)) then
				return p
			end
		end
	end
	return nil
end

-- stop orbit and reattach flingPart to player
local function stopOrbit()
	orbiting = false
	orbitTarget = nil
	if weld and weld.Parent == nil then
		-- recreate weld
		if flingPart and hrp then
			weld = Instance.new("WeldConstraint")
			weld.Part0 = hrp
			weld.Part1 = flingPart
			weld.Parent = flingPart
		end
	end
	status.Text = "Orbit: OFF | Mode: "..orbitMode.." | Infinite: ON"
end

-- orbit main coroutine
local orbitConnection = nil
local function startOrbitFor(player)
	if not player or not player.Character then
		status.Text = "Target not available"
		return
	end
	local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
	if not targetHRP then
		status.Text = "Target has no HRP"
		return
	end

	-- remove weld so flingPart can move freely
	if weld and weld.Parent then
		weld:Destroy()
	end
	orbiting = true
	orbitTarget = player
	status.Text = "Orbit: ON | Mode: "..orbitMode.." | Target: "..player.Name

	-- connect loop
	if orbitConnection then orbitConnection:Disconnect() end
	orbitConnection = RunService.Heartbeat:Connect(function(dt)
		if not orbiting or not orbitTarget or not orbitTarget.Character then
			stopOrbit()
			if orbitConnection then orbitConnection:Disconnect(); orbitConnection = nil end
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
		local x = math.cos(ang) * radius
		local z = math.sin(ang) * radius
		local targetPos = targetRoot.Position + Vector3.new(x, 1.4, z)

		-- Mode behaviors
		if orbitMode == "Smooth" then
			-- smooth interpolation
			flingPart.CFrame = CFrame.new(targetPos, targetRoot.Position)
			-- keep local rot velocity high for fling power
			if hrp then
				hrp.RotVelocity = Vector3.new(
					math.random(-ROTVEL_POWER, ROTVEL_POWER),
					math.random(-ROTVEL_POWER, ROTVEL_POWER),
					math.random(-ROTVEL_POWER, ROTVEL_POWER)
				)
			end

		elseif orbitMode == "Aggressive" then
			-- faster orbit with direct pulses
			flingPart.CFrame = CFrame.new(targetPos, targetRoot.Position)
			if targetRoot and targetRoot.Parent ~= char then
				targetRoot.Velocity = Vector3.new(
					math.random(-INFINITE_FLING_POWER*0.5, INFINITE_FLING_POWER*0.5),
					math.random(INFINITE_FLING_POWER*1.2, INFINITE_FLING_POWER*2.5),
					math.random(-INFINITE_FLING_POWER*0.5, INFINITE_FLING_POWER*0.5)
				)
			end
			if hrp then
				hrp.RotVelocity = Vector3.new(
					math.random(-ROTVEL_POWER*1.5, ROTVEL_POWER*1.5),
					math.random(-ROTVEL_POWER*1.5, ROTVEL_POWER*1.5),
					math.random(-ROTVEL_POWER*1.5, ROTVEL_POWER*1.5)
				)
			end

		elseif orbitMode == "FTL" then
			-- blink-like orbit + overwhelming pulses
			-- rapid position updates (very high multiplier)
			flingPart.CFrame = CFrame.new(targetPos, targetRoot.Position)
			if targetRoot and targetRoot.Parent ~= char then
				targetRoot.Velocity = Vector3.new(
					math.random(-INFINITE_FLING_POWER*4, INFINITE_FLING_POWER*4),
					math.random(INFINITE_FLING_POWER*4, INFINITE_FLING_POWER*12),
					math.random(-INFINITE_FLING_POWER*4, INFINITE_FLING_POWER*4)
				)
			end
			if hrp then
				hrp.RotVelocity = Vector3.new(
					math.random(-ROTVEL_POWER*6, ROTVEL_POWER*6),
					math.random(-ROTVEL_POWER*6, ROTVEL_POWER*6),
					math.random(-ROTVEL_POWER*6, ROTVEL_POWER*6)
				)
			end
		end
	end)
end

-- ---------- GUI logic ----------
local function setMode(m)
	orbitMode = m
	status.Text = (orbiting and "Orbit: ON | Mode: "..orbitMode or "Orbit: OFF | Mode: "..orbitMode).." | Infinite: ON"
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

-- ---------- keybinds ----------
local infiniteFlingVisible = true
UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
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
		infiniteFlingVisible = not infiniteFlingVisible
		if infiniteFlingVisible then
			flingPart.Transparency = 1
			status.Text = (orbiting and "Orbit: ON | Mode: "..orbitMode or "Orbit: OFF | Mode: "..orbitMode).." | Infinite: ON"
		else
			flingPart.Transparency = 0.6
			status.Text = (orbiting and "Orbit: ON | Mode: "..orbitMode or "Orbit: OFF | Mode: "..orbitMode).." | Infinite: OFF"
		end
	end
end)

-- ---------- keep flingPart followed when not orbiting ----------
RunService.Heartbeat:Connect(function()
	if not orbiting then
		-- ensure weld exists
		if not (weld and weld.Parent) then
			if flingPart and hrp then
				weld = Instance.new("WeldConstraint")
				weld.Part0 = hrp
				weld.Part1 = flingPart
				weld.Parent = flingPart
			end
		end
		-- place flingPart slightly behind the player
		if hrp and flingPart then
			local behind = hrp.CFrame * CFrame.new(0, 0, -2)
			flingPart.CFrame = behind
			hrp.RotVelocity = Vector3.new(
				math.random(-ROTVEL_POWER, ROTVEL_POWER),
				math.random(-ROTVEL_POWER, ROTVEL_POWER),
				math.random(-ROTVEL_POWER, ROTVEL_POWER)
			)
		end
	end
end)

-- ---------- respawn handling ----------
LocalPlayer.CharacterAdded:Connect(function(newChar)
	char = newChar
	hrp = char:WaitForChild("HumanoidRootPart")
	hum = char:WaitForChild("Humanoid")
	-- reparent flingPart and recreate weld
	flingPart.Parent = workspace
	if weld and weld.Parent then weld:Destroy() end
	weld = Instance.new("WeldConstraint")
	weld.Part0 = hrp
	weld.Part1 = flingPart
	weld.Parent = flingPart
	stopOrbit()
end)

-- initial status
status.Text = "Orbit: OFF | Mode: "..orbitMode.." | Infinite: ON"

print("Infinite TouchFling + Orbit (All Modes, INFINITE POWER) loaded.")
