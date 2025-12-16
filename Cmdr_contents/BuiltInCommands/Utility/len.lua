--[[
    len (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Utility
    Parent: Utility
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
return {
	Name = "len";
	Aliases = {};
	Description = "Returns the length of a comma-separated list";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "string";
			Name = "CSV";
			Description = "The comma-separated list"
		}
	};

	Run = function(_, list)
		return #(list:split(","))
	end
}