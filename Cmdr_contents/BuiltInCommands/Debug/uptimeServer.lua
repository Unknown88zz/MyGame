--[[
    uptimeServer (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Debug
    Parent: Debug
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
local startTime = os.time()

return function ()
	local uptime = os.time() - startTime
	return ("%dd %dh %dm %ds"):format(
		math.floor(uptime / (60 * 60 * 24)),
		math.floor(uptime / (60 * 60)) % 24,
		math.floor(uptime / 60) % 60,
		math.floor(uptime) % 60
	)
end