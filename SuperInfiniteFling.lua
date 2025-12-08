--[[ 
    ABSOLUTE MAXIMUM POWER FLING SCRIPT
    
    This script implements:
    1. Draggable GUI
    2. MAXIMUM Stable Rotation Force (9e9)
    3. Noclip for Guaranteed Collision
    4. ABSOLUTE Nearest Target Seeking (No Radius Limit)
    5. INSTANTANEOUS Teleport for Overlap
]]

-- SERVICES
local RunService = game:GetService("RunService")
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- GUI SETUP
local Frame = script.Parent
local Button = Frame:FindFirstChild("ToggleFlingButton") 

if not Button then
    warn("ToggleFlingButton not found! Make sure the button is named 'ToggleFlingButton' inside the Frame.")
    return
end

-- GLOBAL STATE & VARIABLES
local isFlinging = false
local isAutoSeeking = false 
local noclipConnection = nil
local physicsConnection = nil
local seekConnection = nil

-- POWER SETTINGS
-- This value provides maximum stable force for collision calculation.
local ABSOLUTE_ROTATION_FORCE = Vector3.new(9e9, 9e9, 9e9) 

-- =========================================================================================
--                                 A. GUI DRAGGABILITY LOGIC
-- =========================================================================================

local dragging = false
local dragStart = nil
local startPos = nil

-- Input Handlers for Dragging
Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if input.Target == Frame then
            dragging = true
            dragStart = input.Position
            startPos = Frame.Position
            UserInputService:SetMouseDelta(Vector2.new(0, 0))
        end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragging then
            local delta = input.Position - dragStart
            local newX = startPos.X.Scale + (delta.X / Frame.Parent.AbsoluteSize.X)
            local newY = startPos.Y.Scale + (delta.Y / Frame.Parent.AbsoluteSize.Y)
            
            newX = math.clamp(newX, 0, 1 - Frame.Size.X.Scale)
            newY = math.clamp(newY, 0, 1 - Frame.Size.Y.Scale)
            
            Frame.Position = UDim2.new(newX, 0, newY, 0)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragStart = nil
        startPos = nil
    end
end)

-- =========================================================================================
--                                B. CORE FLING & SEEK LOGIC
-- =========================================================================================

-- Utility Function to Find ABSOLUTE Nearest Player (No radius limit)
local function findNearestTarget()
    local nearestTarget = nil
    local shortestDistance = math.huge -- Searches the entire map
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    local localRoot = character.HumanoidRootPart
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetRoot = player.Character.HumanoidRootPart
            local distance = (localRoot.Position - targetRoot.Position).magnitude
            
            if distance < shortestDistance then
                shortestDistance = distance
                nearestTarget = targetRoot
            end
        end
    end
    return nearestTarget
end

-- FUNCTION: ENABLE MAX POWER
local function startInfiniteFling()
	local character = LocalPlayer.Character
	if not character then return end
    
    -- 1. PHYSICS LOOP (Heartbeat: Applies Max Force and Lock)
	physicsConnection = RunService.Heartbeat:Connect(function()
		local root = character:FindFirstChild("HumanoidRootPart")
		if root then
			-- Apply ABSOLUTE maximum chaotic rotation
			root.AssemblyAngularVelocity = ABSOLUTE_ROTATION_FORCE
			
			-- Linear Movement Lock
			root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            
            -- Force client ownership
            if root:CanSetNetworkOwnership() then
                root:SetNetworkOwnership(LocalPlayer)
            end
		end
	end)
	
	-- 2. NOCLIP LOOP (Stepped: Disables collision before physics calculation)
	noclipConnection = RunService.Stepped:Connect(function()
		if character then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") and part.CanCollide == true then
					part.CanCollide = false
				end
			end
		end
	end)
    
    -- 3. AUTO-TELEPORT LOOP (INSTANTANEOUS Seek)
    seekConnection = RunService.Heartbeat:Connect(function()
        if isAutoSeeking and character and character:FindFirstChild("HumanoidRootPart") then
            local targetRoot = findNearestTarget()
            local localRoot = character.HumanoidRootPart
            
            if targetRoot and localRoot then
                -- INSTANT CFrame update for absolute guaranteed collision
                localRoot.CFrame = targetRoot.CFrame 
            end
        end
    end)
    
    isAutoSeeking = true
	
	-- Update GUI Status
	Button.Text = "☣ ABSOLUTE GOD MODE: ON ☣"
	Button.BackgroundColor3 = Color3.new(1, 0, 0)
	Button.TextColor3 = Color3.new(1, 1, 1)
end

-- FUNCTION: DISABLE ALL FEATURES
local function stopInfiniteFling()
	-- Disconnect all running loops
	if physicsConnection then physicsConnection:Disconnect() end
	if noclipConnection then noclipConnection:Disconnect() end
    if seekConnection then seekConnection:Disconnect() end
    
    isAutoSeeking = false
	
	-- Reset Physics
	local character = LocalPlayer.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	end
	
	-- Update GUI Status
	Button.Text = "GOD MODE: OFF"
	Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Button.TextColor3 = Color3.new(1, 1, 1)
end

--- TOGGLE HANDLER (Attached to the Button) ---
Button.MouseButton1Click:Connect(function()
	isFlinging = not isFlinging
	if isFlinging then
		startInfiniteFling()
	else
		stopInfiniteFling()
	end
end)

-- SAFETY RESET on Character Death
LocalPlayer.CharacterAdded:Connect(function()
	isFlinging = false
	stopInfiniteFling()
end)
