local Config = require(script.config)
local DataStoreHandler = require(script.Parent.Parent.Module.datastoreHandler)

local FVJobs = {}
FVJobs.__index = FVJobs

function FVJobs:Init()
	local succes = true
	if succes then
		return true
	else
		return false
	end
end
return FVJobs
