-- LocalScript inside StarterPlayerScripts
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- --- UI INSTANCES ---
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local PowerLabel = Instance.new("TextLabel")
local WarningLabel = Instance.new("TextLabel")
local KillCounter = Instance.new("TextLabel")
local ModeLabel = Instance.new("TextLabel")
local AuraToggle = Instance.new("TextButton")
local MainToggleButton = Instance.new("TextButton") 
local TargetBox = Instance.new("TextBox") -- NEW
local AutoFlingToggle = Instance.new("TextButton") -- NEW

-- --- UI SETUP (Aesthetics and Positioning) ---
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(5, 0, 10)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 255)
Frame.BorderSizePixel = 4
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.Size = UDim2.new(0, 250, 0, 350) -- Adjusted size for new buttons
Frame.Active = true
Frame.Draggable = true
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new(Color3.fromRGB(10, 0, 20), Color3.fromRGB(50, 0, 50), Color3.fromRGB(10, 0, 20))
UIGradient.Rotation = 45
UIGradient.Parent = Frame

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
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
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0.96, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "♾️ SUPER'S INFINITE FLING ♾️"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextScaled = true

PowerLabel.Parent = Frame
PowerLabel.BackgroundTransparency = 1.000
PowerLabel.Position = UDim2.new(0.06, 0, 0.13, 0)
PowerLabel.Size = UDim2.new(0.88, 0, 0, 30)
PowerLabel.Font = Enum.Font.GothamBold
PowerLabel.Text = "⚡ POWER: 50,000,000 ⚡"
PowerLabel.TextColor3 = Color3.fromRGB(255, 50, 255)
PowerLabel.TextSize = 16.000

WarningLabel.Parent = Frame
WarningLabel.BackgroundTransparency = 1.000
WarningLabel.Position = UDim2.new(0.06, 0, 0.23, 0)
WarningLabel.Size = UDim2.new(0.88, 0, 0, 22)
WarningLabel.Font = Enum.Font.SourceSansBold
WarningLabel.Text = "🌌 REALITY BREAKER 🌌"
WarningLabel.TextColor3 = Color3.fromRGB(150, 255, 255)
WarningLabel.TextSize = 14.000

ModeLabel.Parent = Frame
ModeLabel.BackgroundTransparency = 1.000
ModeLabel.Position = UDim2.new(0.06, 0, 0.31, 0)
ModeLabel.Size = UDim2.new(0.88, 0, 0, 20)
ModeLabel.Font = Enum.Font.Gotham
ModeLabel.Text = "💥 Mode: TOUCHFLING 💥"
ModeLabel.TextColor3 = Color3.fromRGB(255, 200, 255)
ModeLabel.TextSize = 12.000

TargetBox.Parent = Frame
TargetBox.PlaceholderText = "Target for Auto-Fling (e.g. 'roblox')"
TargetBox.Size = UDim2.new(0.8, 0, 0, 25)
TargetBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TargetBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.Font = Enum.Font.Gotham
TargetBox.TextSize = 12

KillCounter.Parent = Frame
KillCounter.BackgroundTransparency = 1.000
KillCounter.Position = UDim2.new(0.06, 0, 0.48, 0)
KillCounter.Size = UDim2.new(0.88, 0, 0, 20)
KillCounter.Font = Enum.Font.Gotham
KillCounter.Text = "💀 Obliterated: 0"
KillCounter.TextColor3 = Color3.fromRGB(255, 100, 255)
KillCounter.TextSize = 13.000

AuraToggle.Parent = Frame
AuraToggle.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
AuraToggle.Position = UDim2.new(0.1, 0, 0.58, 0)
AuraToggle.Size = UDim2.new(0.8, 0, 0, 35)
AuraToggle.Font = Enum.Font.GothamBold
AuraToggle.Text = "AURA: OFF"
AuraToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AuraToggle.TextSize = 16.000
local AuraCorner = Instance.new("UICorner")
AuraCorner.CornerRadius = UDim.new(0, 8)
AuraCorner.Parent = AuraToggle

AutoFlingToggle.Parent = Frame
AutoFlingToggle.BackgroundColor3 = Color3.fromRGB(150, 150, 0)
AutoFlingToggle.Position = UDim2.new(0.1, 0, 0.7, 0)
AutoFlingToggle.Size = UDim2.new(0.8, 0, 0, 35)
AutoFlingToggle.Font = Enum.Font.GothamBold
AutoFlingToggle.Text = "AUTO-FLING: OFF"
AutoFlingToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFlingToggle.TextSize = 16.000
local AutoFlingCorner = Instance.new("UICorner")
AutoFlingCorner.CornerRadius = UDim.new(0, 8)
AutoFlingCorner.Parent = AutoFlingToggle

MainToggleButton.Parent = Frame
MainToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
MainToggleButton.BorderSizePixel = 0
MainToggleButton.Position = UDim2.new(0.1, 0, 0.82, 0)
MainToggleButton.Size = UDim2.new(0.8, 0, 0, 55)
MainToggleButton.Font = Enum.Font.GothamBold
MainToggleButton.Text = "OFF"
MainToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainToggleButton.TextSize = 28.000
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 12)
ButtonCorner.Parent = MainToggleButton
local ButtonGradient = Instance.new("UIGradient")
ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(150, 0, 200), Color3.fromRGB(255, 0, 255))
ButtonGradient.Rotation = 90
ButtonGradient.Parent = MainToggleButton

-- --- LOGIC CORE ---

local function InfiniteFlingScript()
    local toggleButton = MainToggleButton
    local auraButton = AuraToggle
    local autoFlingButton = AutoFlingToggle
    
    local isFlingActive = false -- Main touchfling active
    local isAutoFlingActive = false -- Auto-teleport and fling
    local flingThread
    local autoFlingThread
    local killCount = 0
    
    local FXFolder = game.Workspace:FindFirstChild("InfiniteFlingFX") or Instance.new("Folder", game.Workspace)
    FXFolder.Name = "InfiniteFlingFX"
    
    local FLING_POWER = 50000000 
    
    -- Aura logic (same as before)
    local auraConnection
    local auraObjects = {}
    local function destroyAura()
        for _, obj in pairs(auraObjects) do if obj and obj.Parent then obj:Destroy() end end
        auraObjects = {}
        if auraConnection then auraConnection:Disconnect(); auraConnection = nil end
    end
    local function createInfiniteAura()
        destroyAura()
        local lp = Players.LocalPlayer; local char = lp.Character; if not char then return end 
        local root = char:FindFirstChild("HumanoidRootPart") if not root then return end 
        
        local aura = Instance.new("Part")
        aura.Name = "InfiniteAura"
        aura.Size = Vector3.new(15, 15, 15)
        aura.Anchored = true; aura.CanCollide = false
        aura.Material = Enum.Material.Neon; aura.Color = Color3.fromRGB(150, 0, 255); aura.Transparency = 0.6
        aura.Shape = Enum.PartType.Ball; aura.Parent = FXFolder 
        table.insert(auraObjects, aura) 

        auraConnection = RunService.Heartbeat:Connect(function()
            if not auraEnabled or not root or not root.Parent or not aura.Parent then destroyAura(); return end
            aura.CFrame = root.CFrame 
            local scale = 1 + math.sin(tick() * 3) * 0.2
            aura.Size = Vector3.new(15 * scale, 15 * scale, 15 * scale)
        end)
    end
    
    local function trackElimination()
        killCount = killCount + 1
        KillCounter.Text = "💀 Obliterated: " .. killCount
        if UserInputService.Vibrate then UserInputService:Vibrate(0.1) end
        task.spawn(function()
            for i = 1, 3 do 
                KillCounter.TextColor3 = Color3.fromRGB(255, 0, 255); KillCounter.TextSize = 16 
                task.wait(0.05) 
                KillCounter.TextColor3 = Color3.fromRGB(255, 100, 255); KillCounter.TextSize = 13 
                task.wait(0.05) 
            end
        end)
    end
    
    -- Helper: Find Player by Partial Name
    local function getPlayer(partialName)
        if not partialName or #partialName < 1 then return nil end
        partialName = partialName:lower()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                if player.Name:lower():sub(1, #partialName) == partialName or 
                   player.DisplayName:lower():sub(1, #partialName) == partialName then
                    return player
                end
            end
        end
        return nil
    end

    -- Monitor players to track eliminations (simplified)
    local function monitorPlayers() 
        while isFlingActive or isAutoFlingActive do 
            task.wait(0.3) 
            for _, player in pairs(Players:GetPlayers()) do 
                if player ~= Players.LocalPlayer and player.Character then 
                    local theirRoot = player.Character:FindFirstChild("HumanoidRootPart") 
                    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
                    
                    if theirRoot and myRoot then 
                        -- Check for high velocity after close contact
                        if (theirRoot.Position - myRoot.Position).Magnitude < 10 and theirRoot.AssemblyLinearVelocity.Magnitude > 5000 then 
                            trackElimination() 
                        end
                    end
                end 
            end 
        end 
    end 
    
    -- Touch Fling Loop (The passive mode)
    local function flingTouch() 
        local lp = LocalPlayer 
        local c, hrp, vel, movel = nil, nil, Vector3.zero, 0.1 
        while isFlingActive and not isAutoFlingActive do 
            RunService.RenderStepped:Wait() 
            c = lp.Character; hrp = c and c:FindFirstChild("HumanoidRootPart") 
            if hrp then 
                vel = hrp.AssemblyLinearVelocity 
                hrp.AssemblyLinearVelocity = vel * FLING_POWER + Vector3.new(0, FLING_POWER, 0)
                hrp.AssemblyLinearVelocity = vel 
                hrp.AssemblyLinearVelocity = vel + Vector3.new(0, movel, 0) 
                movel = -movel 
            end 
        end 
    end 
    
    -- Auto Fling Loop (The aggressive mode)
    local function autoFling()
        while isAutoFlingActive do
            task.wait(0.1) -- Slower update rate for stability
            
            local targetPlayer = getPlayer(TargetBox.Text)
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local targetHrp = targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if not targetHrp or not hrp then continue end
            
            -- Teleport behind the target
            local targetCFrame = targetHrp.CFrame
            local behindPosition = targetCFrame:ToWorldSpace(CFrame.new(0, 0, -5)).p -- 5 units behind target
            hrp.CFrame = CFrame.new(behindPosition)

            -- Apply Extreme Fling Force
            hrp.AssemblyLinearVelocity = Vector3.new(0, FLING_POWER, 0) -- Fling straight up for maximum separation
            
            -- Apply rotation (for maximum collision chaos)
            hrp.AssemblyAngularVelocity = Vector3.new(5000, 5000, 5000)
            
            -- Small wait to ensure force is registered, then repeat
            task.wait(0.2)
        end
        -- Clean up physics after loop ends
        if hrp then hrp.AssemblyAngularVelocity = Vector3.zero end
    end
    
    -- Aura toggle
    auraButton.MouseButton1Click:Connect(function() 
        auraEnabled = not auraEnabled 
        if auraEnabled then 
            auraButton.Text = "AURA: ON"; auraButton.BackgroundColor3 = Color3.fromRGB(150, 0, 255) 
            createInfiniteAura() 
        else 
            auraButton.Text = "AURA: OFF"; auraButton.BackgroundColor3 = Color3.fromRGB(100, 0, 150) 
            destroyAura() 
        end 
    end) 
    
    -- Auto Fling Mode toggle
    autoFlingButton.MouseButton1Click:Connect(function()
        isAutoFlingActive = not isAutoFlingActive
        if isAutoFlingActive then
            local target = getPlayer(TargetBox.Text)
            if not target then
                isAutoFlingActive = false
                autoFlingButton.Text = "AUTO-FLING: OFF (No Target)"; autoFlingButton.BackgroundColor3 = Color3.fromRGB(150, 150, 0)
                ModeLabel.Text = "💥 Mode: TOUCHFLING 💥"
                return
            end
            
            autoFlingButton.Text = "AUTO-FLING: ON"; autoFlingButton.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
            ModeLabel.Text = "💥 Mode: AUTO-FLING 💥"
            
            -- Ensure main fling is also active to keep physics platformed
            if not isFlingActive then MainToggleButton:Click() end 
            
            -- Start auto fling loop
            autoFlingThread = coroutine.create(autoFling)
            coroutine.resume(autoFlingThread)
        else
            autoFlingButton.Text = "AUTO-FLING: OFF"; autoFlingButton.BackgroundColor3 = Color3.fromRGB(150, 150, 0)
            ModeLabel.Text = "💥 Mode: TOUCHFLING 💥"
            
            -- If auto fling is turned off, restart touch fling loop if it was on
            if isFlingActive then 
                flingThread = coroutine.create(flingTouch)
                coroutine.resume(flingThread)
            end
        end
    end)
    
    -- Main toggle
    toggleButton.MouseButton1Click:Connect(function() 
        isFlingActive = not isFlingActive 
        
        if isFlingActive then 
            toggleButton.Text = "ACTIVE" 
            ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100)) 
            Frame_2.BackgroundColor3 = Color3.fromRGB(255, 0, 255) 
            HeaderCover.BackgroundColor3 = Color3.fromRGB(255, 0, 255) 
            
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then humanoid.PlatformStand = true end
            
            -- Start touch fling loop
            if not isAutoFlingActive then
                flingThread = coroutine.create(flingTouch) 
                coroutine.resume(flingThread) 
            end
            task.spawn(monitorPlayers) 
        else 
            toggleButton.Text = "OFF" 
            ButtonGradient.Color = ColorSequence.new(Color3.fromRGB(150, 0, 200), Color3.fromRGB(255, 0, 255)) 
            Frame_2.BackgroundColor3 = Color3.fromRGB(150, 0, 255) 
            HeaderCover.BackgroundColor3 = Color3.fromRGB(150, 0, 255) 
            
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then humanoid.PlatformStand = false end
            
            if isAutoFlingActive then autoFlingButton:Click() end -- Turn off auto fling if running
            isFlingActive = false
        end 
    end) 

    -- FINAL FIX: RGB loop that runs constantly
    RunService.Heartbeat:Connect(function()
        if isFlingActive then
            local timeFactor = tick() * 0.5 
            local hue = timeFactor - math.floor(timeFactor)
            local color = Color3.fromHSV(hue, 1, 1)
            Frame.BorderColor3 = color
            PowerLabel.TextColor3 = color
        end
    end)
end 
coroutine.wrap(InfiniteFlingScript)() 
print("♾️🔥💀 SUPER'S INFINITE TOUCH/AUTO-FLING LOADED 💀🔥♾️")
