--[[
    Npc (Script)
    Path: Workspace → Shop → ShopNPCCash
    Parent: ShopNPCCash
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Client
    Exported: 2025-12-16 21:48:08
]]
---------------------------------------------------
-- Saved by Angelus Decompiles | With Script + GUI
-- Discord: https://discord.gg/nDWm6PkFrT
---------------------------------------------------

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Controllers")
local v_u_2 = require(v1.InterfaceController)
local v3 = script.Parent
local v4 = v3.AnimationController.Animator
local v5 = Instance.new("Animation")
v5.AnimationId = "rbxassetid://124208878201390"
local v6 = v4:LoadAnimation(v5)
v6:Play()
v6.Looped = true
v3.OpenInterface.Triggered:Connect(function()
    -- upvalues: (copy) v_u_2
    v_u_2:Toggle("CoinsShop")
end)