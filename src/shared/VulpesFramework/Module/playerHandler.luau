local Shared = game:GetService("ReplicatedStorage").Shared
local VulpesFramework = require(Shared.VulpesFramework)
local Modules = VulpesFramework:LoadModules(Shared.VulpesFramework.Module)
local DS = Modules.datastoreHandler
local CharUI: ScreenGui = Shared.VulpesFramework.Module.UI.CharUI

local playerHandler = {}
local playerdata
playerHandler.__index = playerHandler
function playerHandler:InitPlayer(player)
	playerdata = DS:Get(player.UserId)
	if not playerdata then
		warn("Failed to load player data or is not existing for:", player.Name)
		warn("TEST USER IS CREAETD FOR THAT PLAYER. REMOVE THIS FUNCTION AT END OF DEVELOPMENT")
		playerdata = {
			[1] = {
				FirstName = "Max",
				LastName = "Mustermann",
				Gender = "M",
				DOB = "10-03-2007",
				Height = 180,
				Nationality = "German",
				Job = "Unemployed",
				Money = 5000,
			},
			[2] = {
				FirstName = "Max2",
				LastName = "Mustermann",
				Gender = "M",
				DOB = "10-03-2007",
				Height = 180,
				Nationality = "German",
				Job = "Unemployed",
				Money = 5000,
			},
		}
	end
	print("Player data loaded for:", player.Name)
	local CharPlayerUI = CharUI:Clone()
	local CharFrame = {}
	CharPlayerUI.Parent = player:WaitForChild("PlayerGui")

	for i, v in pairs(playerdata) do
		print(i, v)
		local TemplateFrame = CharPlayerUI.MainFrame.ScrollingFrame.TemplateFrame:Clone()
		TemplateFrame.Parent = CharPlayerUI.MainFrame.ScrollingFrame
		TemplateFrame.Name = "Char" .. i
		TemplateFrame.DisplayText.TextLabel.Text = "Character " .. i .. ": " .. v.FirstName .. " " .. v.LastName
		TemplateFrame.Visible = true
		table.insert(CharFrame, TemplateFrame)
	end
	print(CharFrame)
end

function playerHandler:SavePlayer(player: Player)
	local success = DS:Set(player.UserId, playerdata)
	if success then
		print("Player data saved for:", player.Name)
	else
		warn("Failed to save player data for:", player.Name)
	end
end

return playerHandler
