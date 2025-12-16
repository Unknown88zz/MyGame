--[[
    Script (Script)
    Path: Workspace → Witch → Overhead → BillboardGui → Countdown
    Parent: Countdown
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Client
    Exported: 2025-12-16 21:48:08
]]
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Shared.Updates)
local v3 = require(v1.Utils.TimeUtils)
while true do
    script.Parent.Text = ("Releases in %*"):format((v3:E(v2.Methods.GetTimeLeft("Update-10/11/2025") or 0)))
    task.wait(1)
end