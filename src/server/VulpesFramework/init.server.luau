local Shared = game:GetService("ReplicatedStorage").Shared
local VulpesFramework = require(Shared.VulpesFramework)

local success, content = pcall(function()
	return VulpesFramework:Init()
end)

if success then
	print("Vulpes Framework initialized successfully.")
else
	warn(
		"Vulpes Framework failed to initialize. If you see this, please report it to the developer. If you are a developer, fix your code. Error Message: ",
		content
	)
end

-----------------------------------------------
---------------- Start of Code ----------------
-----------------------------------------------

local Players = game:GetService("Players")
local Modules = VulpesFramework:LoadModules(Shared.VulpesFramework.Module)
print(Modules)

local function onPlayerAdded(player)
	print(player)
	Modules.playerHandler:InitPlayer(player)
end

local function onPlayerRemoving(player)
	Modules.playerHandler:SavePlayer(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)
