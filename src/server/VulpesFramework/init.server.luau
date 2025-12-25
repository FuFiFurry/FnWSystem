local shared = game:GetService("ReplicatedStorage").Shared
local VulpesFramework = require(shared.VulpesFramework)

local success, errorMessage = pcall(function()
	return VulpesFramework:Init()
end)

if success then
	print("Vulpes Framework initialized successfully.")
else
	warn(
		"Vulpes Framework failed to initialize. If you see this, please report it to the developer. If you are a developer, fix your code. Error Message: ",
		errorMessage
	)
end
