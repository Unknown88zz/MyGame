--[[
    Phase 1: Sleepy (ModuleScript)
    Path: ServerScriptService → CollinAddons → PhaseAssets
    Parent: PhaseAssets
    Exported: 2025-12-16 21:47:50
]]
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Packages.Net);
local v8 = require(l_ReplicatedStorage_0.Packages.Trove);
local v9 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v10 = require(script.Parent.Parent);
local v11 = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local v12 = require(l_ReplicatedStorage_0.Controllers.SkullEmojiEffectController);
local v13 = require(l_ReplicatedStorage_0.Shared.VFX);
local v14 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v15 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local l_Name_0 = script.Name;
local v17 = v8.new();
local v18 = v8.new();
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v20 = Random.new();
local v21 = {};
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = v7:RemoteEvent((("EventService/%*/PlaySleepVFX"):format(l_Name_0)));
local l_Sleepy_0 = l_ReplicatedStorage_0.Models.Events.Sleepy;
local v28 = workspace.Events["Phase 1: Sleepy"];
local v29 = l_ReplicatedStorage_0.Animations.Events["Phase 1: Sleepy"];
local function v39() --[[ Line: 33 ]] --[[ Name: v39 ]]
    -- upvalues: v24 (ref), v22 (ref), l_LocalPlayer_0 (copy), v21 (copy), l_Players_0 (copy)
    if v24 or v22 then
        return;
    else
        v24 = time();
        local v30 = {};
        local l_status_0, l_result_0 = pcall(l_LocalPlayer_0.GetFriendsOnline, l_LocalPlayer_0, 15);
        if l_status_0 then
            for _, v34 in l_result_0 do
                table.insert(v30, v34.VisitorId);
                table.insert(v21, v34.VisitorId);
            end;
        end;
        if #v30 >= 15 then
            return v30;
        else
            local _, l_result_1 = pcall(l_Players_0.GetFriendsAsync, l_Players_0, l_LocalPlayer_0.UserId);
            if not l_result_1 then
                warn((("Players:GetFriendsAsync() failed: %*"):format(l_result_1)));
                return nil;
            else
                for _, v38 in (l_result_1:GetCurrentPage()) do
                    if not table.find(v21, v38.Id) then
                        table.insert(v30, v38.Id);
                    end;
                end;
                return v30;
            end;
        end;
    end;
end;
local function v44(v40) --[[ Line: 65 ]] --[[ Name: v44 ]]
    -- upvalues: v18 (copy), v28 (copy)
    local v41 = v18:Clone(script.NPCTemplate);
    v41:PivotTo(CFrame.new(0, 100000, 0));
    v41.Parent = v28;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 70 ]]
        -- upvalues: v41 (copy), v40 (copy)
        return v41.Humanoid:ApplyDescription(v40);
    end);
    if not l_status_2 then
        warn((("Failed to createNPC(): %*"):format(l_result_2)));
        v41:Destroy();
        return nil;
    else
        v18:Add(task.delay(3, function() --[[ Line: 79 ]]
            -- upvalues: v41 (copy), v28 (ref)
            if v41.Parent == v28 then
                v41.Parent = nil;
            end;
        end));
        return v41;
    end;
end;
local function v48(v45) --[[ Line: 88 ]] --[[ Name: v48 ]]
    for _, v47 in Enum.HumanoidStateType:GetEnumItems() do
        if v47 ~= Enum.HumanoidStateType.None then
            v45:SetStateEnabled(v47, false);
        end;
    end;
end;
local function v63(v49, v50) --[[ Line: 95 ]] --[[ Name: v63 ]]
    -- upvalues: v25 (ref), v23 (ref), v22 (ref), v18 (copy), v21 (copy), v20 (copy), l_Players_0 (copy), v44 (copy), v48 (copy), l_Debris_0 (copy)
    if (v25 or v23) and not v50 then
        return;
    else
        v25 = time();
        local v51 = {};
        if v50 or not v22 then
            for _ = 1, v49 do
                table.insert(v51, v18:Clone(script.BaconTemplate));
            end;
            return v51;
        else
            local v53 = table.clone(v21 or {});
            local v54 = table.clone(v22 or {});
            while #v51 < v49 do
                local v55 = nil;
                local v56 = nil;
                local v57 = if #v53 > 0 then v53 else v54;
                if #v57 > 0 then
                    local v58 = v20:NextInteger(1, #v57);
                    v55 = v57[v58];
                    table.remove(v57, v58);
                end;
                local l_v55_0 = v55;
                if l_v55_0 then
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 122 ]]
                        -- upvalues: l_Players_0 (ref), l_v55_0 (copy)
                        return l_Players_0:GetHumanoidDescriptionFromUserId(l_v55_0);
                    end);
                    if l_status_3 and l_result_3 then
                        v56 = l_result_3;
                    end;
                end;
                local v62 = nil;
                if v56 then
                    v56.BackAccessory = 0;
                    v56.BodyTypeScale = 0;
                    v56.ProportionScale = 0;
                    v56.DepthScale = 1;
                    v56.HeadScale = 1;
                    v56.HeightScale = 1;
                    v56.WidthScale = 1;
                    v62 = v44(v56);
                end;
                if not v62 then
                    v62 = v18:Clone(script.BaconTemplate);
                end;
                v48(v62.Humanoid);
                l_Debris_0:AddItem(v62, 300);
                table.insert(v51, v62);
            end;
            return v51;
        end;
    end;
end;
v6.OnStart = function(_) --[[ Line: 153 ]]
    -- upvalues: v10 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v15 (copy), v17 (copy), l_Players_0 (copy), v9 (copy), l_Lighting_0 (copy), v12 (copy), v11 (copy), v18 (copy), v28 (copy), v29 (copy), l_Sleepy_0 (copy), v20 (copy), v48 (copy), v24 (ref), v39 (copy), v22 (ref), v25 (ref), v23 (ref), v63 (copy)
    local l_v10_ActiveEventData_0 = v10:GetActiveEventData(l_Name_0);
    assert(l_v10_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("Phase1SleepyEvent", true);
    v15:UpdateOST();
    v17:Add(function() --[[ Line: 159 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v15 (ref)
        l_ReplicatedStorage_0:SetAttribute("Phase1SleepyEvent", nil);
        v15:UpdateOST();
    end);
    local v66 = l_v10_ActiveEventData_0.endsAt - 10;
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local v68 = math.max(v66 - workspace:GetServerTimeNow(), 0);
    local v69 = math.max(0.1, (math.min(v68, 4)));
    local v70 = TweenInfo.new(v69, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v71 = math.max(v68 - v69, 0);
    v17:Add(task.delay(v71, function() --[[ Line: 170 ]]
        -- upvalues: v66 (copy), l_workspace_ServerTimeNow_0 (copy), v71 (copy), v17 (ref), l_Players_0 (ref), v9 (ref), v70 (copy), l_Lighting_0 (ref), v69 (copy), v12 (ref), v11 (ref)
        if v66 < l_workspace_ServerTimeNow_0 or v71 == 0 then
            return;
        else
            local v72 = v17:Clone(script.ImageLabel);
            v72.Size = UDim2.fromScale(10, 10);
            v72.Parent = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("CoinsShop");
            v9(v72, v70, {
                Size = UDim2.fromScale(2, 1.5)
            });
            local v73 = v17:Add(Instance.new("BlurEffect"));
            v73.Size = 0;
            v73.Parent = l_Lighting_0;
            v9(v73, v70, {
                Size = 10
            });
            task.wait(v69);
            v17:Add(task.delay(v66 + 0.1 + 4 - workspace:GetServerTimeNow(), function() --[[ Line: 188 ]]
                -- upvalues: v17 (ref), v73 (copy)
                v17:Remove(v73);
            end));
            v12:Play(4.5, "Lower");
            task.delay(0.5, function() --[[ Line: 193 ]]
                -- upvalues: v11 (ref)
                v11:Notify("YOU FELL ASLEEP", 4);
            end);
            return;
        end;
    end));
    v18:Add(task.delay(l_v10_ActiveEventData_0.endsAt + 45 - workspace:GetServerTimeNow(), function() --[[ Line: 200 ]]
        -- upvalues: v18 (ref)
        v18:Destroy();
    end));
    local function v100(v74, v75, v76) --[[ Line: 204 ]] --[[ Name: v100 ]]
        -- upvalues: v18 (ref), v9 (ref)
        local function v87(v77, v78, v79, v80) --[[ Line: 206 ]] --[[ Name: v87 ]]
            -- upvalues: v18 (ref), v76 (copy), v9 (ref)
            local l_CFrame_0 = v77.CFrame;
            local v82 = Vector3.new(v80 and 0 or v78.X, 0, v80 and 0 or v78.Z);
            local v83 = l_CFrame_0 * CFrame.new(0, -(v78.Y - v82.Y) / 2, 0);
            v77.Size = v82;
            v77.CFrame = v83;
            local l_Transparency_0 = v77.Transparency;
            v77.Transparency = 1;
            v18:Add(task.delay(if v76 then v76(v79) else v79, function() --[[ Line: 215 ]]
                -- upvalues: v77 (copy), l_Transparency_0 (copy), v76 (ref), v79 (copy), v9 (ref), v78 (copy), l_CFrame_0 (copy)
                v77.Transparency = l_Transparency_0;
                local v85 = if v76 then v76(v79 + 1) else 1;
                local v86 = TweenInfo.new(v85, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                v9(v77, v86, {
                    Size = v78
                });
                v9(v77, v86, {
                    CFrame = l_CFrame_0
                });
            end));
        end;
        local v88 = {};
        local v89 = 1e999;
        local v90 = -1e999;
        for _, v92 in v74:GetDescendants() do
            if v92:IsA("BasePart") and v92.Transparency < 1 then
                table.insert(v88, v92);
                v89 = math.min(v89, v92.Position.Y);
                v90 = math.max(v90, v92.Position.Y);
            end;
        end;
        table.sort(v88, function(v93, v94) --[[ Line: 238 ]]
            return v93.Position.Y < v94.Position.Y;
        end);
        local v95 = v90 - v89;
        for _, v97 in v88 do
            local v98 = v97.Color.R * 255 < 90;
            local v99 = (v97.Position.Y - v89) / v95 * v75;
            if v98 then
                v99 = v99 + 0.2;
            end;
            v87(v97, v97.Size, v99, v98);
        end;
    end;
    local v101 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 4);
    local function v115(v102, v103, v104, v105) --[[ Line: 252 ]] --[[ Name: v115 ]]
        -- upvalues: v18 (ref), l_ReplicatedStorage_0 (ref), v28 (ref), v29 (ref), l_Sleepy_0 (ref), v20 (ref), v9 (ref), v101 (copy), v100 (copy)
        local l_Head_0 = v102:FindFirstChild("Head");
        local l_PrimaryPart_0 = v102.PrimaryPart;
        if not l_Head_0 or not l_PrimaryPart_0 then
            return false;
        else
            l_PrimaryPart_0.Anchored = true;
            v102:PivotTo(v104);
            v18:Clone(l_ReplicatedStorage_0.Models.Traits.Sleepy.Sleepy.SLEEPY_VFX_ATTACHMENT).Parent = l_Head_0;
            v102.Parent = v28.NPCs;
            for _, v109 in v102:GetChildren() do
                if v109:IsA("BasePart") then
                    v109.CanCollide = false;
                    v109.CollisionGroup = "PlayerNoCollision";
                end;
            end;
            v18:Add(v102.Humanoid.Animator:LoadAnimation(v29.SleepIdle)):Play();
            local l_v103_ExtentsSize_0 = v103:GetExtentsSize();
            if not v105 then
                local v111 = math.max(l_v103_ExtentsSize_0.X, l_v103_ExtentsSize_0.Z) / 2;
                v105 = CFrame.new(0, 0, v111 + 0.5);
            end;
            local v112 = v104 * v105;
            v103:PivotTo(v112);
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Transparency = 1;
            l_Part_0.CanCollide = false;
            l_Part_0.CanQuery = false;
            l_Part_0.CanTouch = false;
            l_Part_0.Anchored = true;
            l_Part_0.Name = "Hitbox";
            l_Part_0.Size = l_v103_ExtentsSize_0;
            l_Part_0.CFrame = v112 * CFrame.new(0, l_v103_ExtentsSize_0.Y, 0);
            l_Part_0.Parent = v103;
            v103.PrimaryPart = l_Part_0;
            local v114 = v18:Clone(l_Sleepy_0.GrowTimer);
            v114.TextLabel.Text = ("%* years left"):format((v20:NextInteger(2, 10)));
            v114.Parent = l_Part_0;
            v114.TextLabel.TextTransparency = 1;
            v114.TextLabel.UIStroke.Transparency = 1;
            v9(v114.TextLabel, v101, {
                TextTransparency = 0
            });
            v9(v114.TextLabel.UIStroke, v101, {
                Transparency = 0
            });
            v103.Parent = v28.Plants;
            v100(v103, 4);
            return true;
        end;
    end;
    task.defer(function() --[[ Line: 304 ]]
        -- upvalues: v18 (ref), l_Sleepy_0 (ref), v48 (ref), v115 (copy), v28 (ref), v24 (ref), v39 (ref), v22 (ref), v25 (ref), v23 (ref), v63 (ref), v20 (ref)
        local v116 = {};
        local v117 = v18:Clone(l_Sleepy_0["Jandel R15"]);
        v48(v117.Humanoid);
        local v118 = v18:Clone(l_Sleepy_0.Beanstalk);
        v115(v117, v118, v28.JandelSpawn:GetPivot(), CFrame.new(0, 0, 3.5));
        v116[v117] = v117;
        @native
        local function v122(v119) --[[ Line: 312 ]] --[[ Name: v122 ]]
            -- upvalues: v116 (copy)
            for _, v121 in v116 do
                if (v119 - v121:GetPivot().Position).Magnitude < 15 then
                    return false;
                end;
            end;
            return true;
        end;
        if not v24 then
            task.spawn(v39);
        end;
        local v123 = time();
        local v124 = v123 - (v24 or v123);
        if not v22 and v124 < 5 then
            task.wait(5 - v124);
        end;
        v123 = time();
        local v125 = v123 - (v25 or v123);
        if not v23 and v125 < 5 then
            task.wait(5 - v124);
        end;
        local v126 = v23 or v63(15, true);
        if not v126 then
            warn("No NPCs generated by generateNPCs");
            return;
        else
            for _, v128 in v126 do
                v116[v128] = v128;
                local l_Children_0 = v28.PlantSpawns:GetChildren();
                local v130 = l_Children_0[v20:NextInteger(1, #l_Children_0)];
                local l_Position_0 = v130.Position;
                local l_Size_0 = v130.Size;
                local v133 = nil;
                local v134 = 0;
                while v134 < 20 do
                    v134 = v134 + 1;
                    local v135 = Vector3.new(l_Position_0.X + v20:NextNumber(-l_Size_0.X * 0.5, l_Size_0.X * 0.5), l_Position_0.Y + l_Size_0.Y * 0.5, l_Position_0.Z + v20:NextNumber(-l_Size_0.Z * 0.5, l_Size_0.Z * 0.5));
                    if not v122(v135) then
                        if v134 == 20 then
                            v133 = v135;
                        end;
                    else
                        v133 = v135;
                        break;
                    end;
                end;
                local v136 = CFrame.new(0, -0.4, 0);
                local v137 = CFrame.Angles(0, v20:NextNumber(0, 6.283185307179586), 0);
                local v138 = CFrame.new(v133) * v136 * v137;
                local l_Children_1 = l_Sleepy_0.Plants:GetChildren();
                local v140 = v18:Clone(l_Children_1[v20:NextInteger(1, #l_Children_1)]);
                if not v115(v128, v140, v138) then
                    v116[v128] = nil;
                    v128:Destroy();
                end;
            end;
            return;
        end;
    end);
end;
v6.OnStop = function(_) --[[ Line: 374 ]]
    -- upvalues: v17 (copy)
    v17:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 378 ]]
    -- upvalues: v26 (copy), v14 (copy), v17 (copy), l_Sleepy_0 (copy), v13 (copy), l_Debris_0 (copy), v15 (copy), l_ReplicatedStorage_0 (copy), v22 (ref), v39 (copy), v23 (ref), v63 (copy), l_ContentProvider_0 (copy)
    v26.OnClientEvent:Connect(function(v143) --[[ Line: 380 ]]
        -- upvalues: v14 (ref), v17 (ref), l_Sleepy_0 (ref), v13 (ref), l_Debris_0 (ref), v15 (ref), l_ReplicatedStorage_0 (ref)
        local v144 = v14:GetAnimals()[v143];
        if not v144 then
            return;
        else
            local l_AnimalModel_0 = v144.AnimalModel;
            local v146 = v144.AnimalModel and l_AnimalModel_0.PrimaryPart;
            local l_Instance_0 = v144.Instance;
            local v148 = l_Instance_0 and l_Instance_0.PrimaryPart;
            if not v148 or not v146 then
                return;
            else
                local v149 = v17:Clone(l_Sleepy_0.SleepyImpact.SleepyImpact);
                v149:PivotTo(v148.CFrame * CFrame.new(0, (v149.Size.Y + l_AnimalModel_0:GetExtentsSize().Y) / 2, 0));
                v149.Parent = l_Instance_0;
                v13.weld(v149, v146);
                v13.emit(v149);
                l_Debris_0:AddItem(v149, 5);
                v15:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Phase 1: Sleepy"].Hit, v148.CFrame.Position, false);
                return;
            end;
        end;
    end);
    task.defer(function() --[[ Line: 404 ]]
        -- upvalues: v22 (ref), v39 (ref), v23 (ref), v63 (ref)
        v22 = v39();
        v23 = v63(15);
    end);
    task.spawn(pcall, function() --[[ Line: 409 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(pcall, function() --[[ Line: 413 ]]
        -- upvalues: l_ContentProvider_0 (ref), l_ReplicatedStorage_0 (ref)
        l_ContentProvider_0:PreloadAsync(l_ReplicatedStorage_0.Models.Events["Phase 1: Sleepy"]);
    end);
end;
return v6;