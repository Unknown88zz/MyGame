--[[
    respawnServer (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Admin
    Parent: Admin
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
return function(_, players)
	for _, player in pairs(players) do
		if player.Character then
			player:LoadCharacter()
		end
	end
	return ("Respawned %d players."):format(#players)
end
