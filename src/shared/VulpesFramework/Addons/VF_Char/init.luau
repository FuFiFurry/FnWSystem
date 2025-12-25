local Config = require(script.config)
local DataStoreHandler = require(script.Parent.Parent.Module.datastoreHandler)
local Player = game:GetService("Players")

local FVChar = {}
FVChar.__index = FVChar

function FVChar:Init()
	local succes = true
	if succes then
		return true
	else
		return false
	end
end
return FVChar
