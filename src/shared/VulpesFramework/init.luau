local Config = require(script.config)

local VulpesFramework = {}
VulpesFramework.__index = VulpesFramework

function VulpesFramework:Init()
	print("VulpesFramework initialing...")
	-- Initialize plugins
	for addonName, isEnabled in pairs(Config.addons) do
		if isEnabled then
			local addonModule = require(script.Addons[addonName])
			local success = addonModule:Init()
			if success then
				print(addonName .. " Addon initialized successfully.")
			else
				warn("Failed to initialize " .. addonName .. " addon.")
			end
		end
	end
end

function VulpesFramework:LoadModules(folder)
	if not folder or not folder:IsA("Folder") then
		warn("[ModuleLoader] Invalid folder")
		return {}
	end

	local modules = {}

	for _, child in ipairs(folder:GetChildren()) do
		if child:IsA("ModuleScript") then
			local success, module = pcall(require, child)
			if success and module then
				modules[child.Name] = module
			else
				warn("[ModuleLoader] Failed to load module:", child.Name, module)
			end
		end
	end

	return modules
end

return VulpesFramework
