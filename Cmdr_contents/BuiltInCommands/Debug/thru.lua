--[[
    thru (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Debug
    Parent: Debug
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
return {
	Name = "thru";
	Aliases = {"t", "through"};
	Description = "Teleports you through whatever your mouse is hovering over, placing you equidistantly from the wall.";
	Group = "DefaultDebug";
	Args = {
		{
			Type = "number";
			Name = "Extra distance";
			Description = "Go through the wall an additional X studs.";
			Default = 0;
		}
	};

	ClientRun = function(context, extra)
		-- We implement this here because player position is owned by the client.
		-- No reason to bother the server for this!

		local mouse = context.Executor:GetMouse()
		local character = context.Executor.Character

		if not character or not character:FindFirstChild("HumanoidRootPart") then
			return "You don't have a character."
		end

		local pos = character.HumanoidRootPart.Position
		local diff = (mouse.Hit.p - pos)

		character:MoveTo((diff * 2) + (diff.unit * extra) + pos)

		return "Blinked!"
	end
}