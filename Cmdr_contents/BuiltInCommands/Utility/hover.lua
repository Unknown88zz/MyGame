--[[
    hover (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Utility
    Parent: Utility
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
local Players = game:GetService("Players")

return {
	Name = "hover";
	Description = "Returns the name of the player you are hovering over.";
	Group = "DefaultUtil";
	Args = {};

	ClientRun = function()
		local mouse = Players.LocalPlayer:GetMouse()
		local target = mouse.Target

		if not target then
			return ""
		end

		local p = Players:GetPlayerFromCharacter(target:FindFirstAncestorOfClass("Model"))

		return p and p.Name or ""
	end
}