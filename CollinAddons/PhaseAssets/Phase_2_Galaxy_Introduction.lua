--[[
    Phase 2: Galaxy Introduction (ModuleScript)
    Path: ServerScriptService → CollinAddons → PhaseAssets
    Parent: PhaseAssets
    Exported: 2025-12-16 21:47:50
]]
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_SoundService_0 = game:GetService("SoundService");
local l_HttpService_0 = game:GetService("HttpService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v11 = {};
local v12 = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local _ = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v15 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v16 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v17 = require(l_ReplicatedStorage_0.Packages.Serialization);
local v18 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v19 = require(l_ReplicatedStorage_0.Packages.TopbarPlus);
local v20 = require(l_ReplicatedStorage_0.Packages.Observers);
local v21 = require(l_ReplicatedStorage_0.Packages.Moonlite);
local _ = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v23 = require(l_ReplicatedStorage_0.Packages.Squash);
local _ = require(l_ReplicatedStorage_0.Packages.Timer);
local v25 = require(l_ReplicatedStorage_0.Packages.Trove);
local l_Name_0 = script.Name;
local v27 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
local v28 = {
    "I created admin abuse!", 
    "My admin is better!", 
    "Blah Blah Blah", 
    "Me and Albert made admin!"
};
local v29 = l_ReplicatedStorage_0.Models.Events["Phase 2: Galaxy Introduction"];
local v30 = workspace.Events["Phase 2: Galaxy Introduction"];
local v31 = v25.new();
v11.PlayInitialCutscene = function(_) --[[ Line: 40 ]]
    -- upvalues: v15 (copy), l_Name_0 (copy), v31 (copy), v19 (copy), l_StarterGui_0 (copy), v12 (copy), l_SoundService_0 (copy), v20 (copy), l_ReplicatedStorage_0 (copy), l_Players_0 (copy), v17 (copy), v23 (copy), l_HttpService_0 (copy), v21 (copy), v18 (copy), l_TextChatService_0 (copy), v28 (copy)
    local l_v15_ActiveEventData_0 = v15:GetActiveEventData(l_Name_0);
    assert(l_v15_ActiveEventData_0);
    local v34 = l_v15_ActiveEventData_0.startedAt + 45.666 + 1 - workspace:GetServerTimeNow();
    if v34 <= 0 then
        return;
    else
        local function _(v35) --[[ Line: 48 ]] --[[ Name: _ ]]
            -- upvalues: l_v15_ActiveEventData_0 (copy)
            return l_v15_ActiveEventData_0.startedAt + v35 - workspace:GetServerTimeNow();
        end;
        local v37 = v31:Extend();
        local v38 = v37:Clone(script.Cutscene.Assets);
        local v39 = v37:Clone(script.RainingTacos);
        v39.Volume = 0.1;
        v39.Parent = v38["Computer Desk"].Computer["Meshes/Computer_Cube.008"];
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        task.spawn(pcall, function() --[[ Line: 59 ]]
            -- upvalues: v19 (ref), l_StarterGui_0 (ref)
            pcall(v19.setTopbarEnabled, false);
            l_StarterGui_0:SetCore("TopbarEnabled", false);
        end);
        v37:Add(function() --[[ Line: 64 ]]
            -- upvalues: l_CurrentCamera_0 (copy), v12 (ref), v19 (ref), l_StarterGui_0 (ref)
            task.wait();
            l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
            local _, v42 = v12:GetCharacter();
            l_CurrentCamera_0.CameraSubject = v42;
            l_CurrentCamera_0.FieldOfView = 70;
            task.spawn(pcall, function() --[[ Line: 71 ]]
                -- upvalues: v19 (ref), l_StarterGui_0 (ref)
                pcall(v19.setTopbarEnabled, true);
                l_StarterGui_0:SetCore("TopbarEnabled", true);
            end);
        end);
        l_SoundService_0.Cutscene.Volume = 0;
        v37:Add(function() --[[ Line: 78 ]]
            -- upvalues: l_SoundService_0 (ref)
            l_SoundService_0.Cutscene.Volume = 1;
        end);
        v37:Add(v20.observeTag("Plot", function(v43) --[[ Line: 82 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref)
            if not v43:IsA("PVInstance") then
                return nil;
            elseif v43:GetAttribute("Order") ~= 2 then
                return nil;
            else
                v43.Parent = l_ReplicatedStorage_0;
                return function() --[[ Line: 90 ]]
                    -- upvalues: v43 (copy), l_ReplicatedStorage_0 (ref)
                    if v43.Parent == l_ReplicatedStorage_0 then
                        v43.Parent = workspace.Plots;
                    end;
                end;
            end;
        end));
        v38.Parent = workspace;
        v37:Add(v20.observeCharacters(function(_, v45) --[[ Line: 99 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref)
            v45.Parent = l_ReplicatedStorage_0;
            return function() --[[ Line: 102 ]]
                -- upvalues: v45 (copy), l_ReplicatedStorage_0 (ref)
                if v45.Parent == l_ReplicatedStorage_0 then
                    v45.Parent = workspace;
                end;
            end;
        end));
        v37:Add(v20.observeChildren(l_Players_0.LocalPlayer.PlayerGui, function(v46) --[[ Line: 109 ]]
            if not v46:IsA("LayerCollector") then
                return nil;
            elseif v46:GetAttribute("ShowInCutscene") then
                return nil;
            else
                local l_Enabled_0 = v46.Enabled;
                v46.Enabled = false;
                return function() --[[ Line: 117 ]]
                    -- upvalues: v46 (copy), l_Enabled_0 (copy)
                    if v46.Enabled == l_Enabled_0 then
                        return;
                    else
                        v46.Enabled = l_Enabled_0;
                        return;
                    end;
                end;
            end;
        end));
        local v48 = v17.des(v23.frombuffer(l_HttpService_0:JSONDecode(require(script.Cutscene))));
        local v49 = v21.CreatePlayer(v48, v38);
        v49:ReplaceElementByPath("game.CurrentCamera", l_CurrentCamera_0);
        v39.TimePosition = 45.666 - v34;
        v49.TimePosition = 45.666 - v34;
        v49.Looped = false;
        xpcall(function() --[[ Line: 134 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), v37 (copy), v34 (copy)
            l_ReplicatedStorage_0.Sounds.Events["Phase 2: Galaxy Introduction"].Cutscene:Play();
            v37:Add(task.spawn(function() --[[ Line: 137 ]]
                -- upvalues: l_ReplicatedStorage_0 (ref), v34 (ref)
                while not l_ReplicatedStorage_0.Sounds.Events["Phase 2: Galaxy Introduction"].Cutscene.IsLoaded do
                    task.wait();
                end;
                l_ReplicatedStorage_0.Sounds.Events["Phase 2: Galaxy Introduction"].Cutscene.TimePosition = 54.666 - v34;
            end));
        end, warn);
        v39:Play();
        v37:Add(task.delay(l_v15_ActiveEventData_0.startedAt + 7 - workspace:GetServerTimeNow(), function() --[[ Line: 146 ]]
            -- upvalues: v18 (ref), v39 (copy)
            v18(v39, TweenInfo.new(3), {
                Volume = 0.05
            });
        end));
        local v50 = v31:Add(Instance.new("ColorCorrectionEffect"));
        v50.Parent = workspace.CurrentCamera;
        local v51 = l_v15_ActiveEventData_0.startedAt + 46.166 - workspace:GetServerTimeNow();
        if v51 > 0 then
            v31:Add(task.delay(v51, function() --[[ Line: 156 ]]
                -- upvalues: l_v15_ActiveEventData_0 (copy), v18 (ref), v50 (copy), v31 (ref)
                local v52 = l_v15_ActiveEventData_0.startedAt + 47.666 - workspace:GetServerTimeNow();
                local v53 = v18(v50, TweenInfo.new(v52 * 0.5), {
                    TintColor = Color3.new(0, 0, 0)
                });
                v31:Add(task.delay(v52, function() --[[ Line: 162 ]]
                    -- upvalues: v53 (copy), v18 (ref), v50 (ref), v52 (copy)
                    v53:Cancel();
                    v53:Destroy();
                    v18(v50, TweenInfo.new(v52 * 0.5), {
                        TintColor = Color3.new(1, 1, 1)
                    });
                end));
            end));
        end;
        v37:Add(task.spawn(function() --[[ Line: 172 ]]
            -- upvalues: l_TextChatService_0 (ref), v37 (copy), l_v15_ActiveEventData_0 (copy), v28 (ref), v38 (copy)
            l_TextChatService_0.BubbleChatConfiguration.BubbleDuration = 3;
            v37:Add(function() --[[ Line: 175 ]]
                -- upvalues: l_TextChatService_0 (ref)
                l_TextChatService_0.BubbleChatConfiguration.BubbleDuration = 15;
            end);
            local v54 = 0;
            while workspace:GetServerTimeNow() < l_v15_ActiveEventData_0.startedAt + 15 do
                v54 = v54 % #v28 + 1;
                l_TextChatService_0:DisplayBubble(v38.JandelR15.LowerTorso, v28[v54]);
                task.wait(1);
            end;
        end));
        v37:Add(function() --[[ Line: 186 ]]
            -- upvalues: v49 (copy)
            v49:Stop();
            v49:Destroy();
        end);
        v49:Compile();
        v49:Play();
        v37:Add(v49.Completed:Once(function() --[[ Line: 193 ]]
            -- upvalues: v37 (copy)
            v37:Destroy();
        end));
        return;
    end;
end;
v11.PlayTakeoffCutscene = function(_) --[[ Line: 200 ]]
    -- upvalues: v15 (copy), l_Name_0 (copy), v11 (copy), v31 (copy), v19 (copy), l_StarterGui_0 (copy), v12 (copy), l_SoundService_0 (copy), v20 (copy), l_Players_0 (copy), v17 (copy), v23 (copy), l_HttpService_0 (copy), v21 (copy)
    local l_v15_ActiveEventData_1 = v15:GetActiveEventData(l_Name_0);
    assert(l_v15_ActiveEventData_1);
    if l_v15_ActiveEventData_1.startedAt + 82.982 - workspace:GetServerTimeNow() <= 0 then
        return;
    else
        v11._rocketShipCutscenePlaying = true;
        local function _(v57) --[[ Line: 208 ]] --[[ Name: _ ]]
            -- upvalues: l_v15_ActiveEventData_1 (copy)
            return l_v15_ActiveEventData_1.startedAt + v57 - workspace:GetServerTimeNow();
        end;
        local v59 = v31:Extend();
        local v60 = v59:Clone(script.Cutscene2.Assets);
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        l_CurrentCamera_1.CameraType = Enum.CameraType.Scriptable;
        task.spawn(pcall, function() --[[ Line: 216 ]]
            -- upvalues: v19 (ref), l_StarterGui_0 (ref)
            pcall(v19.setTopbarEnabled, false);
            l_StarterGui_0:SetCore("TopbarEnabled", false);
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
        end);
        v59:Add(function() --[[ Line: 222 ]]
            -- upvalues: l_CurrentCamera_1 (copy), v12 (ref), v19 (ref), l_StarterGui_0 (ref), v11 (ref)
            task.wait();
            l_CurrentCamera_1.CameraType = Enum.CameraType.Custom;
            local _, v63 = v12:GetCharacter();
            l_CurrentCamera_1.CameraSubject = v63;
            l_CurrentCamera_1.FieldOfView = 70;
            task.spawn(pcall, function() --[[ Line: 229 ]]
                -- upvalues: v19 (ref), l_StarterGui_0 (ref)
                pcall(v19.setTopbarEnabled, true);
                l_StarterGui_0:SetCore("TopbarEnabled", true);
                l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
            end);
            v11._rocketShipCutscenePlaying = false;
        end);
        l_SoundService_0.Cutscene.Volume = 0;
        v59:Add(function() --[[ Line: 238 ]]
            -- upvalues: l_SoundService_0 (ref)
            l_SoundService_0.Cutscene.Volume = 1;
        end);
        v60.Parent = workspace;
        v59:Add(v20.observeChildren(l_Players_0.LocalPlayer.PlayerGui, function(v64) --[[ Line: 243 ]]
            if not v64:IsA("LayerCollector") then
                return nil;
            elseif v64:GetAttribute("ShowInCutscene") then
                return nil;
            else
                local l_Enabled_1 = v64.Enabled;
                v64.Enabled = false;
                return function() --[[ Line: 251 ]]
                    -- upvalues: v64 (copy), l_Enabled_1 (copy)
                    if v64.Enabled == l_Enabled_1 then
                        return;
                    else
                        v64.Enabled = l_Enabled_1;
                        return;
                    end;
                end;
            end;
        end));
        local v66 = v17.des(v23.frombuffer(l_HttpService_0:JSONDecode(require(script.Cutscene2))));
        local v67 = v21.CreatePlayer(v66, v60);
        v67:ReplaceElementByPath("game.CurrentCamera", l_CurrentCamera_1);
        v67.TimePosition = math.max(82.982 - (l_v15_ActiveEventData_1.startedAt + 82.982 - workspace:GetServerTimeNow()), 0);
        v67.Looped = false;
        v59:Add(function() --[[ Line: 267 ]]
            -- upvalues: v67 (copy)
            v67:Stop();
            v67:Destroy();
        end);
        v67:Compile();
        v67:Play();
        v59:Add(v67.Completed:Once(function() --[[ Line: 274 ]]
            -- upvalues: v59 (copy)
            v59:Destroy();
        end));
        return;
    end;
end;
v11.PlayTorusEffect = function(_) --[[ Line: 281 ]]
    -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v31 (copy), v29 (copy), v30 (copy), l_RunService_0 (copy), l_Lighting_0 (copy), v18 (copy), v27 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local l_SpaceshipFlyingTorus_0 = l_ReplicatedStorage_0.Sounds.Events["Phase 2: Galaxy Introduction"].SpaceshipFlyingTorus;
    local v72 = v31:Extend();
    local v73 = v72:Clone(v29.Torus);
    v73.Size = v73.Size * 6;
    v73:PivotTo(CFrame.new(0, 5000, 0));
    v73.Parent = v30;
    l_LocalPlayer_0.CameraMode = Enum.CameraMode.LockFirstPerson;
    l_CurrentCamera_2.CameraType = Enum.CameraType.Scriptable;
    local l_Size_0 = v73.Size;
    local v75 = math.max(l_Size_0.X, l_Size_0.Z);
    local v76 = math.min(l_Size_0.X, l_Size_0.Y, l_Size_0.Z);
    local v77 = (((v75 - v76) / 2 * 2 - v76) / 2 + v75 / 2) / 2;
    local v78 = v73.CFrame.Position - v73.CFrame.RightVector * v77;
    l_CurrentCamera_2.CFrame = CFrame.lookAt(v78, v78 + v73.CFrame.LookVector);
    v72:Add(l_RunService_0.PreRender:Connect(function(v79) --[[ Line: 299 ]]
        -- upvalues: v73 (copy)
        local l_v73_0 = v73;
        l_v73_0.CFrame = l_v73_0.CFrame * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v79 * 2.0943951023931953);
    end));
    local l_ExposureCompensation_0 = l_Lighting_0.ExposureCompensation;
    l_Lighting_0.ExposureCompensation = 4;
    v31:Add(v18(l_Lighting_0, v27, {
        ExposureCompensation = 2.5
    }));
    v72:Clone(v29.SpaceDepthOfField).Parent = l_Lighting_0;
    l_SpaceshipFlyingTorus_0.TimePosition = 0;
    l_SpaceshipFlyingTorus_0:Play();
    return function() --[[ Line: 312 ]]
        -- upvalues: l_Lighting_0 (ref), v18 (ref), v27 (ref), l_ExposureCompensation_0 (copy), l_LocalPlayer_0 (copy), l_CurrentCamera_2 (copy), v72 (copy), l_SpaceshipFlyingTorus_0 (copy)
        l_Lighting_0.ExposureCompensation = 3.5;
        v18(l_Lighting_0, v27, {
            ExposureCompensation = l_ExposureCompensation_0
        });
        l_LocalPlayer_0.CameraMode = Enum.CameraMode.Classic;
        l_CurrentCamera_2.CameraType = Enum.CameraType.Custom;
        v72:Destroy();
        l_SpaceshipFlyingTorus_0:Stop();
    end;
end;
v11.OnStart = function(v82) --[[ Line: 324 ]]
    -- upvalues: v15 (copy), l_Name_0 (copy), v31 (copy), v20 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v16 (copy), v11 (copy), v14 (copy), v18 (copy)
    local l_v15_ActiveEventData_2 = v15:GetActiveEventData(l_Name_0);
    assert(l_v15_ActiveEventData_2);
    local function _(v84) --[[ Line: 328 ]] --[[ Name: _ ]]
        -- upvalues: l_v15_ActiveEventData_2 (copy)
        return l_v15_ActiveEventData_2.startedAt + v84 - workspace:GetServerTimeNow();
    end;
    v31:Add(task.delay(l_v15_ActiveEventData_2.startedAt + 74.666 - workspace:GetServerTimeNow(), function() --[[ Line: 332 ]]
        -- upvalues: v31 (ref), l_v15_ActiveEventData_2 (copy), v20 (ref), l_RunService_0 (ref), l_ReplicatedStorage_0 (ref), v16 (ref), v82 (copy), v11 (ref)
        v31:Add(task.delay(l_v15_ActiveEventData_2.startedAt + 76.666 - workspace:GetServerTimeNow(), function() --[[ Line: 334 ]]
            -- upvalues: v31 (ref), v20 (ref), l_RunService_0 (ref), l_v15_ActiveEventData_2 (ref)
            v31:Add(v20.observeTag("Rocketship", function(v86) --[[ Line: 336 ]]
                -- upvalues: l_RunService_0 (ref), l_v15_ActiveEventData_2 (ref)
                local l_v86_Pivot_0 = v86:GetPivot();
                local v90 = l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 339 ]]
                    -- upvalues: l_v15_ActiveEventData_2 (ref), v86 (copy), l_v86_Pivot_0 (copy)
                    local v89 = math.lerp(0, 200, ((workspace:GetServerTimeNow() - (l_v15_ActiveEventData_2.startedAt + 76.666)) / 20) ^ 2) ^ 2;
                    v86:PivotTo(l_v86_Pivot_0 + Vector3.new(0, v89, 0));
                end);
                return function() --[[ Line: 344 ]]
                    -- upvalues: v90 (copy)
                    v90:Disconnect();
                end;
            end));
        end));
        l_ReplicatedStorage_0:SetAttribute("GalaxyIntroduction", true);
        v31:Add(function() --[[ Line: 351 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref)
            l_ReplicatedStorage_0:SetAttribute("GalaxyIntroduction", nil);
        end);
        v16:Update();
        v31:Add(task.delay(l_v15_ActiveEventData_2.startedAt + 85.982 - workspace:GetServerTimeNow(), function() --[[ Line: 356 ]]
            -- upvalues: v82 (ref), v31 (ref)
            while v82._rocketShipCutscenePlaying do
                task.wait();
            end;
            v31:Add(v82:PlayTorusEffect());
        end));
        v11:PlayTakeoffCutscene();
    end));
    v31:Add(function() --[[ Line: 365 ]]
        -- upvalues: v14 (ref)
        v14:Activate("Blink");
    end);
    local v91 = l_v15_ActiveEventData_2.startedAt + 1 - workspace:GetServerTimeNow();
    if v91 > 0 then
        local v92 = v31:Add(Instance.new("ColorCorrectionEffect"));
        v92.Parent = workspace.CurrentCamera;
        local v93 = v18(v92, TweenInfo.new(v91 * 0.5), {
            TintColor = Color3.new(0, 0, 0)
        });
        v31:Add(task.delay(v91, function() --[[ Line: 376 ]]
            -- upvalues: v93 (copy), v18 (ref), v92 (copy), v91 (copy), v11 (ref)
            v93:Cancel();
            v93:Destroy();
            v18(v92, TweenInfo.new(v91 * 0.5), {
                TintColor = Color3.new(1, 1, 1)
            });
            v11:PlayInitialCutscene();
        end));
        return;
    else
        v11:PlayInitialCutscene();
        return;
    end;
end;
v11.OnStop = function(_) --[[ Line: 391 ]]
    -- upvalues: v31 (copy)
    v31:Destroy();
end;
v11.OnLoad = function(_) --[[ Line: 395 ]]
    -- upvalues: l_ContentProvider_0 (copy), l_ReplicatedStorage_0 (copy)
    task.spawn(pcall, function() --[[ Line: 397 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(pcall, function() --[[ Line: 401 ]]
        -- upvalues: l_ContentProvider_0 (ref), l_ReplicatedStorage_0 (ref)
        l_ContentProvider_0:PreloadAsync(l_ReplicatedStorage_0.Sounds.Events["Phase 2: Galaxy Introduction"]);
    end);
    task.wait(6);
end;
return v11;