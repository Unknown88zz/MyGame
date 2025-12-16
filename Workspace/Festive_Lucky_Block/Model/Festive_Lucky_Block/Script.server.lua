--[[
    Script (Script)
    Path: Workspace → Festive Lucky Block → Model → Festive Lucky Block
    Parent: Festive Lucky Block
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Client
    Exported: 2025-12-16 21:48:08
]]
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Medal in Seliware

local v1 = game:GetService("ReplicatedStorage")
local v2 = script.Parent.AnimationController.Animator:LoadAnimation(v1.Animations.Animals["Festive Lucky Block"].Idle)
v2.Looped = true
v2:Play()