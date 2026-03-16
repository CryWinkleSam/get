

local function SendChatMessage(message)
    
    local TextChatService = game:GetService("TextChatService")

    
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannel = TextChatService.TextChannels.RBXGeneral 
        textChannel:SendAsync(message) 
    else
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end
end


-- SendChatMessage("Rayvn Scripts")




local detectedget = warn("[Anti-Tamper]: Check getRemote set off! - 1/2 until kicked")



--[[ 

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Config = {
    KillRange = 30,
    Cooldown = 0.25,
    Enabled = true,
    FakeBypass = true,
    ESPEnabled = true,
    SilentMode = false,
    DebugMode = true
}

local Remotes = {
    DamageRemote = ReplicatedStorage:FindFirstChild("DamageRemote"),
    HitConfirmRemote = ReplicatedStorage:FindFirstChild("HitConfirmRemote"),
    StatusUpdateRemote = ReplicatedStorage:FindFirstChild("StatusUpdateRemote")
}

local function ValidateTarget(target)
    if not target then return false end
    if not target:IsA("Model") then return false end
    if target == Character then return false end
    local hrp = target:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    return true
end

local function GetDistanceToTarget(target)
    local hrp = target:FindFirstChild("HumanoidRootPart")
    if hrp then
        return (HumanoidRootPart.Position - hrp.Position).Magnitude
    end
    return math.huge
end

local function FakeBypassCheck()
    print("[Rayvn] Initializing FE bypass...")
    wait(0.5)
    print("[Rayvn] Syncing remotes...")
    wait(0.3)
    print("[Rayvn] Remotes hooked successfully.")
    wait(0.2)
    if Config.DebugMode then
        print("[Rayvn] Debug mode active. All checks passed.")
    end
end

local function AttemptKill(target)
    if not Config.Enabled then return end
    if not ValidateTarget(target) then return end

    local distance = GetDistanceToTarget(target)
    if distance <= Config.KillRange then
        print("[Rayvn] Attempting kill on:", target.Name, "Distance:", math.floor(distance))

        if Remotes.DamageRemote then
            if Config.DebugMode then
                print("[Rayvn] DamageRemote fired (simulation)")
            end
        end

        if Remotes.HitConfirmRemote then
            if Config.DebugMode then
                print("[Rayvn] HitConfirmRemote sent (simulation)")
            end
        end
    end
end

local function ScanForTargets()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            AttemptKill(char)
        end
    end
end

local function InitESP()
    if not Config.ESPEnabled then return end
    print("[Rayvn] Initializing fake ESP...")
    for _,player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            print("[Rayvn][ESP] Player tracked:", player.Name)
        end
    end
end

local function InitTool()
    print("[Rayvn] Loading FE Kill Tool...")
    FakeBypassCheck()
    InitESP()

    RunService.RenderStepped:Connect(function()
        if Config.Enabled then
            ScanForTargets()
        end
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.K then
            print("[Rayvn] Kill tool toggle triggered")
            Config.Enabled = not Config.Enabled
            print("[Rayvn] Kill tool enabled:", Config.Enabled)
        elseif input.KeyCode == Enum.KeyCode.E then
            print("[Rayvn] Silent mode toggled:", not Config.SilentMode)
            Config.SilentMode = not Config.SilentMode
        end
    end)

    print("[Rayvn] FE Kill Tool ready. Press K to toggle.")
end

InitTool()


                                                                                                                                                                                                                                                            
