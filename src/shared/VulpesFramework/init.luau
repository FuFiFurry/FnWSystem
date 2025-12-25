local Config = require(script.config)

local VulpesFramework = {}
VulpesFramework.__index = VulpesFramework

function VulpesFramework:Init()
	print("VulpesFramework initialing...")
	-- Initialize plugins
	for pluginName, isEnabled in pairs(Config.plugins) do
		if isEnabled then
			local pluginModule = require(script.Plugins[pluginName])
			local success = pluginModule.init()
			if success then
				print(pluginName .. " plugin initialized successfully.")
			else
				warn("Failed to initialize " .. pluginName .. " plugin.")
			end
		end
	end
end

return VulpesFramework
