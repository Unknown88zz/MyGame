--[[
    BindableResource (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInTypes
    Parent: BuiltInTypes
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
return function (registry)
	registry:RegisterType("bindableResource", registry.Cmdr.Util.MakeEnumType("BindableResource", {"Chat"}))
end
