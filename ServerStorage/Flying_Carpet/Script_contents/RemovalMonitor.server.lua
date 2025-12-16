--[[
    RemovalMonitor (Script)
    Path: ServerStorage → Flying Carpet → Script
    Parent: Script
    ⚠️  NESTED SCRIPT: This script is inside another script
    Properties:
        Disabled: true
        RunContext: Enum.RunContext.Legacy
    Exported: 2025-12-16 21:48:08
]]
--Made by Luckymaxer

Model = script.Parent

Debris = game:GetService("Debris")

Removing = false

function RemoveModel()
	if Removing then
		return
	end
	local Parts = {}
	for i, v in pairs(Model:GetChildren()) do
		if v:IsA("Model") then
			table.insert(Parts, v)
		end
	end
	if #Parts == 0 then
		Removing = true
		Model.Name = ""
		Debris:AddItem(Model, 1)
	end
end

Model.ChildRemoved:connect(function(Child)
	RemoveModel()
end)

RemoveModel()

