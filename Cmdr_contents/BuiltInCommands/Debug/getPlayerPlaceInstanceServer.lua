--[[
    getPlayerPlaceInstanceServer (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Debug
    Parent: Debug
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
local TeleportService = game:GetService("TeleportService")

return function (_, playerId, format)
	format = format or "PlaceIdJobId"

	local ok, _, errorText, placeId, jobId = pcall(function()
		return TeleportService:GetPlayerPlaceInstanceAsync(playerId)
	end)

	if not ok or (errorText and #errorText > 0) then
		if format == "PlaceIdJobId" then
			return "0" .. " -"
		elseif format == "PlaceId" then
			return "0"
		elseif format == "JobId" then
			return "-"
		end
	end

	if format == "PlaceIdJobId" then
		return placeId .. " " .. jobId
	elseif format == "PlaceId" then
		return tostring(placeId)
	elseif format == "JobId" then
		return tostring(jobId)
	end
end