--[[
    AnimalClient (ModuleScript)
    Path: ReplicatedStorage → Classes
    Parent: Classes
    Exported: 2025-12-16 21:47:54
]]
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("TweenService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Trove);
local v6 = require(l_ReplicatedStorage_0.Packages.Gradients);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v8 = require(l_Datas_0.Animals);
local _ = require(l_Datas_0.Game);
local v10 = require(l_Datas_0.Rarities);
local v11 = require(l_Datas_0.Mutations);
local v12 = require(l_Datas_0.Traits);
local _ = l_ReplicatedStorage_0:WaitForChild("Others").AnimalTemplate;
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v15 = require(l_Shared_0.Animals);
local l_AnimalOverhead_0 = l_ReplicatedStorage_0:WaitForChild("Overheads").AnimalOverhead;
local l_Animals_0 = l_ReplicatedStorage_0:WaitForChild("Models").Animals;
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v19 = require(l_Utils_0.NumberUtils);
local v20 = require(l_Utils_0.TimeUtils);
local l_Animals_1 = l_ReplicatedStorage_0:WaitForChild("Animations").Animals;
local l_RenderedMovingAnimals_0 = workspace:WaitForChild("RenderedMovingAnimals");
local v23 = {};
v23.__index = v23;
local function _(v24, v25) --[[ Line: 67 ]] --[[ Name: PlayAnimation ]]
    for v26, v27 in v24.AnimationTracks do
        if v25 == v26 then
            if not v27.IsPlaying then
                v27:Play();
            end;
        elseif v27.IsPlaying then
            v27:Stop();
        end;
    end;
end;
v23.GetUID = function(v29) --[[ Line: 85 ]] --[[ Name: GetUID ]]
    return v29.UID;
end;
v23.new = function(v30) --[[ Line: 89 ]] --[[ Name: new ]]
    -- upvalues: v23 (copy), v5 (copy), v8 (copy), v10 (copy), l_Animals_0 (copy), l_RenderedMovingAnimals_0 (copy), v15 (copy), v20 (copy), v19 (copy), l_HttpService_0 (copy), v12 (copy), l_Animals_1 (copy), l_AnimalOverhead_0 (copy), v11 (copy), v6 (copy)
    local v31 = setmetatable({}, v23);
    v31.UID = v30.Name;
    v31.Collector = v5.new();
    v31.Instance = v30;
    v31.Index = v31.Instance:GetAttribute("Index");
    v31.Mutation = v31.Instance:GetAttribute("Mutation");
    local v32 = v8[v31.Index];
    if not v32 then
        warn("Failed to find animal data: " .. v31.Index);
    end;
    local v33 = v10[v32.Rarity];
    v31.AnimalModel = l_Animals_0:FindFirstChild(v31.Index):Clone();
    local l_ExtentsSize_0 = v31.AnimalModel:GetExtentsSize();
    for _, v36 in v31.AnimalModel:GetDescendants() do
        if v36:IsA("BasePart") then
            v36.CanCollide = false;
            v36.CanQuery = false;
            v36.CanTouch = false;
            v36.Massless = true;
            v36.Anchored = false;
        end;
    end;
    v31.Collector:Add(v31.AnimalModel);
    if v31.AnimalModel.PrimaryPart then
        v31.AnimalModel.PrimaryPart.Anchored = true;
    end;
    v31.AnimalModel:AddTag("RenderedMovingAnimal");
    v31.AnimalModel.Parent = l_RenderedMovingAnimals_0;
    if v31.Mutation then
        v31.Collector:Add(v15:ApplyMutation(v31.AnimalModel, v31.Index, v31.Mutation));
    end;
    local function v38() --[[ Line: 132 ]] --[[ Name: updateOverhead ]]
        -- upvalues: v32 (copy), v20 (ref), v19 (ref), v15 (ref), v31 (copy)
        local v37 = nil;
        v37 = if v32.LuckyBlock then v32.LuckyBlock.Timer <= 0 and "READY!" or v20:E(v32.LuckyBlock.Timer) else ("$%*/s"):format((v19:ToString(v15:GetGeneration(v31.Index, v31.Mutation, v31.Traits))));
        v31.Overhead.Generation.Text = v37;
    end;
    local v39 = v31.Collector:Extend();
    local function v46() --[[ Line: 145 ]] --[[ Name: updateTraits ]]
        -- upvalues: v39 (copy), v31 (copy), l_HttpService_0 (ref), v15 (ref), v12 (ref), v38 (copy)
        v39:Clean();
        local l_Attribute_0 = v31.Instance:GetAttribute("Traits");
        v31.Traits = if l_Attribute_0 then l_HttpService_0:JSONDecode(l_Attribute_0) else nil;
        if v31.Traits then
            local v41 = v15:ApplyTraits(v31.AnimalModel, v31.Index, v31.Traits);
            if v41 then
                v39:Add(v41);
            end;
            for _, v43 in v31.Traits do
                local v44 = v12[v43];
                if v44 then
                    local v45 = v39:Clone(v31.Overhead.Traits.Template);
                    v45.Image = v44.Icon;
                    v45.Visible = true;
                    v45.Parent = v31.Overhead.Traits;
                end;
            end;
            v31.Overhead.Traits.Visible = true;
        else
            v31.Overhead.Traits.Visible = false;
        end;
        v38();
    end;
    local v47 = v31.AnimalModel.AnimationController or Instance.new("AnimationController", v31.AnimalModel);
    local v48 = v47.Animator or Instance.new("Animator", v47);
    local l_l_Animals_1_FirstChild_0 = l_Animals_1:FindFirstChild(v31.Index);
    local v50 = l_l_Animals_1_FirstChild_0 and l_l_Animals_1_FirstChild_0:FindFirstChild("Walk");
    if v50 then
        v31.WalkTrack = v48:LoadAnimation(v50);
        v31.WalkTrack.Looped = true;
        v31.WalkTrack:Play();
        v31.WalkTrack:AdjustSpeed(v50:GetAttribute("Speed") or 1);
    end;
    local v51 = l_l_Animals_1_FirstChild_0 and l_l_Animals_1_FirstChild_0:FindFirstChild("Idle");
    if v51 then
        v31.IdleTrack = v48:LoadAnimation(v51);
        v31.IdleTrack.Looped = true;
        v31.IdleTrack:AdjustSpeed(v51:GetAttribute("Speed") or 1);
    end;
    local function v52() --[[ Line: 196 ]] --[[ Name: updateForceIdle ]]
        -- upvalues: v31 (copy)
        if v31.Instance:GetAttribute("ForceIdle") then
            v31.WalkTrack:Stop();
            v31.IdleTrack:Play();
            return;
        else
            v31.WalkTrack:Play();
            v31.IdleTrack:Stop();
            return;
        end;
    end;
    v31.Collector:Add(v31.Instance:GetAttributeChangedSignal("ForceIdle"):Connect(v52));
    v31.Collector:Add(task.spawn(v52));
    v31.Overhead = l_AnimalOverhead_0:Clone();
    v31.Overhead.DisplayName.Text = v32.DisplayName;
    v31.Overhead.Price.Text = ("$%*"):format((v19:ToString(v15:GetPrice(v31.Index))));
    v31.Overhead.Rarity.Text = v32.Rarity;
    v31.Overhead.Rarity.TextColor3 = v10[v32.Rarity].Color;
    v38();
    v31.Overhead.Mutation.Visible = v31.Mutation ~= nil;
    if v31.Mutation then
        local v53 = v11[v31.Mutation];
        v31.Overhead.Mutation.Text = if v53.UseRichText then v53.DisplayWithRichText else v53.DisplayText;
        v31.Overhead.Mutation.RichText = v53.UseRichText;
        if v53.GradientPreset then
            v31.Overhead.Mutation.TextColor3 = Color3.fromRGB(255, 255, 255);
            v31.Collector:Add(v6.apply(v31.Overhead.Mutation, v53.GradientPreset));
        else
            v31.Overhead.Mutation.TextColor3 = v53.MainColor;
        end;
    end;
    if v10[v32.Rarity].StrokeColor then
        v31.Overhead.Rarity.UIStroke.Color = v10[v32.Rarity].StrokeColor;
    end;
    v31.Overhead.MaxDistance = v31.Overhead.MaxDistance + 60;
    if v33.GradientPreset then
        v31.Collector:Add(v6.apply(v31.Overhead.Rarity, v33.GradientPreset));
    end;
    local l_FirstChild_0 = v31.AnimalModel:FindFirstChild("OVERHEAD_ATTACHMENT", true);
    if not l_FirstChild_0 then
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Name = "Info";
        l_Attachment_0.CFrame = CFrame.new(0, l_ExtentsSize_0.Y * 0.75 * (v32.OverheadYOffsetModifier or 1), 0);
        l_Attachment_0.Parent = v31.Instance.PrimaryPart;
        l_FirstChild_0 = l_Attachment_0;
    end;
    v31.Overhead.Parent = l_FirstChild_0;
    v31.AnimalModel:PivotTo(v31.Instance:GetPivot());
    local l_PrimaryPart_0 = v31.AnimalModel.PrimaryPart;
    if l_PrimaryPart_0 then
        l_PrimaryPart_0.RootPriority = 100;
        local v57 = v31.Collector:Add(Instance.new("WeldConstraint"));
        v57.Part0 = l_PrimaryPart_0;
        v57.Part1 = v31.Instance.PrimaryPart;
        v57.Parent = l_PrimaryPart_0;
        l_PrimaryPart_0.Anchored = false;
    end;
    v31.Collector:Add(v31.Instance:GetAttributeChangedSignal("Traits"):Connect(v46));
    task.spawn(v46);
    return v31;
end;
v23.Destroy = function(v58) --[[ Line: 279 ]] --[[ Name: Destroy ]]
    v58.Collector:Destroy();
end;
return v23;