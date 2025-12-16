--[[
    getPlayerPlaceInstance (ModuleScript)
    Path: ServerScriptService → Cmdr → BuiltInCommands → Debug
    Parent: Debug
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:49
]]
return {
	Name = "get-player-place-instance";
	Aliases = {};
	Description = "Returns the target player's Place ID and the JobId separated by a space. Returns 0 if the player is offline or something else goes wrong.";
	Group = "DefaultDebug";
	Args = {
		{
			Type = "playerId";
			Name = "Player";
			Description = "Get the place instance of this player";
		},
		function(context)
			return {
				Type = context.Cmdr.Util.MakeEnumType("PlaceInstance Format", {"PlaceIdJobId", "PlaceId", "JobId"}),
				Name = "Format";
				Description = "What data to return. PlaceIdJobId returns both separated by a space.";
				Default = "PlaceIdJobId";
			}
		end
	};
}