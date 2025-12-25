local config = {}

config.info = {
	name = "Vulpes Framework",
	version = "0.0.1",
	author = "FuFi & FnW Systems",
}

--[[
    Plugin configuration:
    Copy Plugin Module in /shared/VulpesFramework/Plugins/
    Then add the plugin name here(CaseSensitiv) and set to true to enable it

    Some Plugins are pre-installed and only need to be enabled here
]]

config.addons = { VF_Jobs = true, VF_Char = true }

return config
