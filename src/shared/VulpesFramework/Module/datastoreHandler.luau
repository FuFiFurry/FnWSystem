local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local DataStoreHandler = {}
DataStoreHandler.__index = DataStoreHandler

-- CONFIG
local DATASTORE_NAME = "VF_PlayerData"
local dataStore = DataStoreService:GetDataStore(DATASTORE_NAME)

-- Resolve UserId from UserId or Username
local function resolveUserId(userIdentifier)
	if typeof(userIdentifier) == "number" then
		return userIdentifier
	elseif typeof(userIdentifier) == "string" then
		local success, userId = pcall(function()
			return Players:GetUserIdFromNameAsync(userIdentifier)
		end)
		if success then
			return userId
		else
			warn("[DataStoreHandler] Failed to resolve username:", userIdentifier)
			return nil
		end
	end
	return nil
end

-- Get data for a user by UserId or Username
function DataStoreHandler:Get(userIdentifier)
	local userId = resolveUserId(userIdentifier)
	if not userId then
		return nil
	end
	-- Call for data
	local success, data = pcall(function()
		return dataStore:GetAsync(tostring(userId))
	end)

	if not success then
		warn("[DataStoreHandler] Failed to get data for UserId:", userId)
		return nil
	end

	return data
end

-- Set data for a user by UserId or Username
function DataStoreHandler:Set(userIdentifier, data)
	local userId = resolveUserId(userIdentifier)
	if not userId then
		return false
	end
	-- Call to set data
	local success, err = pcall(function()
		dataStore:SetAsync(tostring(userId), data)
	end)

	if not success then
		warn("[DataStoreHandler] Failed to set data for UserId:", userId, "Error:", err)
		return false
	end

	return true
end

return DataStoreHandler
