--[[
    GiantSteps (Script)
    Path: ReplicatedStorage → Client
    Parent: Client
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Client
    Exported: 2025-12-16 21:48:01
]]
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-11-22 21:30:13
-- Luau version 6, Types version 3
-- Time taken: 0.010792 seconds

local Players = game:GetService("Players")
local function _(arg1, arg2) -- Line 5, Named "GetOriginal"
	local formatted = `Original{arg2}`
	local attribute_2 = arg1:GetAttribute(formatted)
	if attribute_2 == nil then
		local var8 = arg1[arg2]
		arg1:SetAttribute(formatted, var8)
		attribute_2 = var8
	end
	return attribute_2
end
local function _(arg1, arg2, arg3) -- Line 16, Named "Set"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local formatted_2 = `Original{arg2}`
	local attribute = arg1:GetAttribute(formatted_2)
	if attribute == nil then
		local var11 = arg1[arg2]
		arg1:SetAttribute(formatted_2, var11)
		attribute = var11
	end
	if arg3 == nil then
	end
	arg1[arg2] = attribute
end
local function SetGiantSteps_upvr(arg1, arg2) -- Line 24, Named "SetGiantSteps"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local PrimaryPart = arg1.PrimaryPart
	local var13
	if not PrimaryPart then
	else
		var13 = 30
		local Running = PrimaryPart:WaitForChild("Running", var13)
		assert(Running:IsA("Sound"))
		if arg2 then
		else
		end
		var13 = Running:GetAttribute("OriginalSoundId")
		if var13 == nil then
			local SoundId = Running.SoundId
			Running:SetAttribute("OriginalSoundId", SoundId)
			var13 = SoundId
		end
		if nil == nil then
		end
		Running.SoundId = var13
		if arg2 then
		else
		end
		var13 = Running:GetAttribute("OriginalPlaybackSpeed")
		if var13 == nil then
			local PlaybackSpeed = Running.PlaybackSpeed
			Running:SetAttribute("OriginalPlaybackSpeed", PlaybackSpeed)
			var13 = PlaybackSpeed
		end
		if nil == nil then
		end
		Running.PlaybackSpeed = var13
		if arg2 then
		else
		end
		var13 = Running:GetAttribute("OriginalVolume")
		if var13 == nil then
			local Volume = Running.Volume
			Running:SetAttribute("OriginalVolume", Volume)
			var13 = Volume
		end
		if nil == nil then
		end
		Running.Volume = var13
	end
end
local function WatchCharacter_upvr(arg1, arg2) -- Line 35, Named "WatchCharacter"
	--[[ Upvalues[1]:
		[1]: SetGiantSteps_upvr (readonly)
	]]
	arg2:WaitForChild("HumanoidRootPart", 30)
	local function var18() -- Line 37
		--[[ Upvalues[2]:
			[1]: SetGiantSteps_upvr (copied, readonly)
			[2]: arg2 (readonly)
		]]
		local var19
		if arg2:GetAttribute("GiantSteps") ~= true then
			var19 = false
		else
			var19 = true
		end
		SetGiantSteps_upvr(arg2, var19)
	end
	arg2:GetAttributeChangedSignal("GiantSteps"):Connect(var18)
	if arg2:GetAttribute("GiantSteps") ~= true then
		var18 = false
	else
		var18 = true
	end
	SetGiantSteps_upvr(arg2, var18)
end
local function WatchPlayer(arg1) -- Line 43
	--[[ Upvalues[1]:
		[1]: WatchCharacter_upvr (readonly)
	]]
	arg1.CharacterAdded:Connect(function(arg1_2) -- Line 44
		--[[ Upvalues[2]:
			[1]: WatchCharacter_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		WatchCharacter_upvr(arg1, arg1_2)
	end)
	local Character = arg1.Character
	if Character then
		task.spawn(WatchCharacter_upvr, arg1, Character)
	end
end
Players.PlayerAdded:Connect(function(arg1) -- Line 53
	--[[ Upvalues[1]:
		[1]: WatchCharacter_upvr (readonly)
	]]
	arg1.CharacterAdded:Connect(function(arg1_3) -- Line 44
		--[[ Upvalues[2]:
			[1]: WatchCharacter_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		WatchCharacter_upvr(arg1, arg1_3)
	end)
	local Character_2 = arg1.Character
	if Character_2 then
		task.spawn(WatchCharacter_upvr, arg1, Character_2)
	end
end)
for _, v in ipairs(Players:GetPlayers()) do
	task.spawn(WatchPlayer, v)
end