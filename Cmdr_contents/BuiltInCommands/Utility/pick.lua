--[[
    pick (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Utility
    Parent: Utility
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
return {
	Name = "pick";
	Aliases = {};
	Description = "Picks a value out of a comma-separated list.";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "integer";
			Name = "Index to pick";
			Description = "The index of the item you want to pick";
		},
		{
			Type = "string";
			Name = "CSV";
			Description = "The comma-separated list"
		}
	};

	Run = function(_, index, list)
		return list:split(",")[index] or ""
	end
}