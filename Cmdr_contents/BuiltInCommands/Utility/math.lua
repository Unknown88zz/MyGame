--[[
    math (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Utility
    Parent: Utility
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
return {
	Name = "math";
	Aliases = {};
	Description = "Perform a math operation on 2 values.";
	Group = "DefaultUtil";
	AutoExec = {
		"alias \"+|Perform an addition.\" math + $1{number|Number} $2{number|Number}";
		"alias \"-|Perform a subtraction.\" math - $1{number|Number} $2{number|Number}";
		"alias \"*|Perform a multiplication.\" math * $1{number|Number} $2{number|Number}";
		"alias \"/|Perform a division.\" math / $1{number|Number} $2{number|Number}";
		"alias \"**|Perform an exponentiation.\" math ** $1{number|Number} $2{number|Number}";
		"alias \"%|Perform a modulus.\" math % $1{number|Number} $2{number|Number}";
	};
	Args = {
		{
			Type = "mathOperator";
			Name = "Operation";
			Description = "A math operation."
		};
		{
			Type = "number";
			Name = "Value";
			Description = "A number value."
		};
		{
			Type = "number";
			Name = "Value";
			Description = "A number value."
		}
	};

	ClientRun = function(_, operation, a, b)
		return operation.Perform(a, b)
	end
}
