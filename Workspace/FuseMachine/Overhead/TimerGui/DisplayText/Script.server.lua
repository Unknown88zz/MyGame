--[[
    Script (Script)
    Path: Workspace → FuseMachine → Overhead → TimerGui → DisplayText
    Parent: DisplayText
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Client
    Exported: 2025-12-16 21:48:08
]]
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Medal in Seliware

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Shared.Updates)
local v3 = require(v1.Utils.TimeUtils)
while true do
    script.Parent.Text = ("Gone in %*"):format((v3:E(v2.Methods.GetTimeLeft("Update-09/06/2025") or 0)))
    task.wait(1)
end