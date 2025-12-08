-- SERVICES
local RunService = game:GetService("RunService")
local Players = game.Players
local LocalPlayer = Players.LocalPlayer

-- GUI SETUP
local ScreenGui = script.Parent.Parent -- Assuming script is inside the Button
local Button = script.Parent

-- VARIABLES
local isFlinging = false
local noclipConnection = nil
local physicsConnection = nil

-- THE POWER SOURCE
-- We use 9e9 (9 Billion). This is effectively infinite to the engine
-- but stays within calculation limits so you don't crash instantly.
local EXTREME_FORCE = Vector3.new(9e9, 9e9, 9e9) 

-- FUNCTION: ENABLE GOD MODE
local function startGodFling()
	local character = LocalPlayer.Character
	if not character then return end
	
	-- 1. PHYSICS LOOP (Heartbeat: Runs post-physics simulation)
	physicsConnection = RunService.Heartbeat:Connect(function()
		local root = character:FindFirstChild("HumanoidRootPart")
		if root then
			-- Apply Maximum Chaotic Rotation
			-- We don't just spin; we force the engine to recalculate constantly
			root.AssemblyAngularVelocity = EXTREME_FORCE
			
			-- Lock Position (Anchor-like behavior while moving)
			-- This keeps you steady while the world explodes around you
			root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		end
	end)
	
	-- 2. NOCLIP LOOP (Stepped: Runs pre-physics simulation)
	-- This allows you to walk INSIDE other players
	noclipConnection = RunService.Stepped:Connect(function()
		if character then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") and part.CanCollide == true then
					part.CanCollide = false
				end
			end
		end
	end)
	
	-- VISUALS: "DANGER" MODE
	Button.Text = "☣ GOD FLING ACTIVE ☣"
	Button.BackgroundColor3 = Color3.new(0, 0, 0) -- Black
	Button.TextColor3 = Color3.new(1, 0, 0) -- Red
	Button.TextSize = 20
end

-- FUNCTION: DISABLE
local function stopGodFling()
	if physicsConnection then physicsConnection:Disconnect() end
	if noclipConnection then noclipConnection:Disconnect() end
	
	-- Reset Physics
	local character = LocalPlayer.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	end
	
	-- Reset Visuals
	Button.Text = "ENABLE GOD FLING"
	Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- Blue
	Button.TextColor3 = Color3.new(1, 1, 1)
end

-- TOGGLE HANDLER
Button.MouseButton1Click:Connect(function()
	isFlinging = not isFlinging
	if isFlinging then
		startGodFling()
	else
		stopGodFling()
	end
end)

-- RESET HANDLER (Safety)
-- If you die while flinging, this resets the toggle so you don't spawn glitching
LocalPlayer.CharacterAdded:Connect(function()
	isFlinging = false
	stopGodFling()
end)
