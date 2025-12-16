--[[
    jsonArrayDecode (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Utility
    Parent: Utility
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
return {
	Name = "json-array-decode";
	Aliases = {};
	Description = "Decodes a JSON Array into a comma-separated list";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "json";
			Name = "JSON";
			Description = "The JSON array."
		},
	};

	ClientRun = function(_, value)
		if type(value) ~= "table" then
			value = { value }
		end

		return table.concat(value, ",")
	end
}
