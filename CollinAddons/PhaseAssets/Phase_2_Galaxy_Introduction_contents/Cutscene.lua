--[[
    Cutscene (ModuleScript)
    Path: ServerScriptService → CollinAddons → PhaseAssets → Phase 2: Galaxy Introduction
    Parent: Phase 2: Galaxy Introduction
    ⚠️  NESTED SCRIPT: This script is inside another script
    Exported: 2025-12-16 21:47:50
]]
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = "";
for v1 = 1, 5 do
    local v2 = script[("Chunk_%*"):format((tostring(v1)))];
    v0 = v0 .. v2.Value;
    v2.Value = "";
end;
return v0;