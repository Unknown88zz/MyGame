--[[
    fetchServer (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Debug
    Parent: Debug
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
local HttpService = game:GetService("HttpService")

return function (_, url)
	return HttpService:GetAsync(url)
end