do
    ply = game.Players
    plr = ply.LocalPlayer
    Root = plr.Character.HumanoidRootPart
    replicated = game:GetService("ReplicatedStorage")
    Lv = game.Players.LocalPlayer.Data.Level.Value
    TeleportService = game:GetService("TeleportService")
    TW = game:GetService("TweenService")
    Lighting = game:GetService("Lighting")
    Enemies = workspace.Enemies
    vim1 = game:GetService("VirtualInputManager")
    vim2 = game:GetService("VirtualUser")
    TeamSelf = plr.Team
    RunSer = game:GetService("RunService")
    Stats = game:GetService("Stats")
    Energy = plr.Character.Energy.Value
    Boss = {}
    BringConnections = {}
    MaterialList = {}
    NPCList = {}
    shouldTween = false
    SoulGuitar = false
    KenTest = true
    debug = false
    Brazier1 = false
    Brazier2 = false
    Brazier3 = false
    Sec = 0.1
    ClickState = 0
    Num_self = 25
end

repeat
    local start = plr.PlayerGui:WaitForChild("Main"):WaitForChild("Loading") and game:IsLoaded()
    wait()
until start
World1 = game.PlaceId == 2753915549
World2 = game.PlaceId == 4442272183
World3 = game.PlaceId == 7449423635
Marines = function()
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
end
Pirates = function()
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
end

local AllBoats = {
    "Beast Hunter",
    "Lantern",
    "Guardian",
    "Grand Brigade",
    "Dinghy",
    "Sloop",
    "The Sentinel"
}


local Rock = workspace:FindFirstChild("Rocks")
if Rock then
    Rock:Destroy()
end
gay = (function()
    local lighting = game:GetService("Lighting")
    local lightingLayers = lighting:FindFirstChild("LightingLayers")
    if lightingLayers and game:GetService("Lighting") and game:GetService("Lighting") then
        local darkFog = lightingLayers:FindFirstChild("DarkFog")
        if darkFog then
            darkFog:Destroy()
        end
    end
    local Water = workspace._WorldOrigin["Foam;"]
    if Water and workspace._WorldOrigin["Foam;"] then
        Water:Destroy()
    end        
end)()

LowCpu = function()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end
CheckF = function()
    if GetBP("Dragon-Dragon") or GetBP("Gas-Gas") or GetBP("Yeti-Yeti") or GetBP("Kitsune-Kitsune") or GetBP("T-Rex-T-Rex") then
        return true
    end
end

CheckBoat = function()
    for i, v in pairs(workspace.Boats:GetChildren()) do
        if tostring(v.Owner.Value) == tostring(plr.Name) then
            return v
        end;
    end;
    return false
end;
CheckEnemiesBoat = function()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "FishBoat") and v:FindFirstChild("Health").Value > 0 then
            return true
        end;
    end;
    return false
end;
CheckPirateGrandBrigade = function()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade") and v:FindFirstChild("Health").Value > 0 then
            return true
        end
    end
    return false
end
CheckShark = function()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == "Shark" and Attack.Alive(v) then
            return true
        end;
    end;
    return false
end;
CheckTerrorShark = function()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == "Terrorshark" and Attack.Alive(v) then
            return true
        end;
    end;
    return false
end;
CheckPiranha = function()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == "Piranha" and Attack.Alive(v) then
            return true
        end;
    end;
    return false
end;
CheckFishCrew = function()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "Fish Crew Member" or v.Name == "Haunted Crew Member") and Attack.Alive(v) then
            return true
        end;
    end;
    return false
end;
CheckHauntedCrew = function()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "Haunted Crew Member") and Attack.Alive(v) then
            return true
        end;
    end;
    return false
end;
CheckSeaBeast = function()
    if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
        return true
    end;
    return false
end;
CheckLeviathan = function()
    if workspace.SeaBeasts:FindFirstChild("Leviathan") then
        return true
    end;
    return false
end;
local block = Instance.new("Part", workspace)
block.Size = Vector3.new(1, 1, 1)
block.Name = "Rip_Indra"
block.Anchored = true
block.CanCollide = false
block.CanTouch = false
block.Transparency = 1
local blockfind = workspace:FindFirstChild(block.Name)
if blockfind and blockfind ~= block then
    blockfind:Destroy()
end
task.spawn(function()
    while task.wait() do
        if block and block.Parent == workspace then
            if shouldTween then
                getgenv().OnFarm = true
            else
                getgenv().OnFarm = false
            end
        else
            getgenv().OnFarm = false
        end
    end
end)
task.spawn(function()
    local a = game.Players.LocalPlayer;
    repeat
        task.wait()
    until a.Character and a.Character.PrimaryPart;
    block.CFrame = a.Character.PrimaryPart.CFrame;
    while task.wait() do
        pcall(function()
            if getgenv().OnFarm then
                if block and block.Parent == workspace then
                    local b = a.Character and a.Character.PrimaryPart;
                    if b and (b.Position - block.Position).Magnitude <= 200 then
                        b.CFrame = block.CFrame
                    else
                        block.CFrame = b.CFrame
                    end
                end;
                local c = a.Character;
                if c then
                    for d, e in pairs(c:GetChildren()) do
                        if e:IsA("BasePart") then
                            e.CanCollide = false
                        end
                    end
                end
            else
                local c = a.Character;
                if c then
                    for d, e in pairs(c:GetChildren()) do
                        if e:IsA("BasePart") then
                            e.CanCollide = true
                        end
                    end
                end
            end
        end)
    end
end)
_tp = function(target)
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end
    local rootPart = character.HumanoidRootPart
    local distance = (target.Position - rootPart.Position).Magnitude
    local tweenInfo = TweenInfo.new(distance / 300, Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(block, tweenInfo, {
        CFrame = target
    })
    if plr.Character.Humanoid.Sit == true then
        block.CFrame = CFrame.new(block.Position.X, target.Y, block.Position.Z)
    end
    tween:Play()
    task.spawn(function()
        while tween.PlaybackState == Enum.PlaybackState.Playing do
            if not shouldTween then
                tween:Cancel()
                break
            end
            task.wait(0.1)
        end
    end)
end
TeleportToTarget = function(targetCFrame)
    if (targetCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 1000 then
        _tp(targetCFrame)
    else
        _tp(targetCFrame)
    end
end
notween = function(p)
    plr.Character.HumanoidRootPart.CFrame = p
end
function BTP(p)
    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character.HumanoidRootPart
    local humanoid = player.Character.Humanoid
    local playerGui = player.PlayerGui.Main
    local targetPosition = p.Position
    local lastPosition = humanoidRootPart.Position
    repeat
        humanoid.Health = 0
        humanoidRootPart.CFrame = p
        playerGui.Quest.Visible = false
        if (humanoidRootPart.Position - lastPosition).Magnitude > 1 then
            lastPosition = humanoidRootPart.Position
            humanoidRootPart.CFrame = p
        end
        task.wait(0.5)
    until (p.Position - humanoidRootPart.Position).Magnitude <= 2000
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.SailBoat_Hydra or _G.WardenBoss or _G.AutoFactory or _G.HighestMirage or _G.HCM or _G.PGB or _G.Leviathan1 or _G.UPGDrago or _G.Complete_Trials or _G.TpDrago_Prehis or _G.BuyDrago or _G.AutoFireFlowers or _G.DT_Uzoth or _G.AutoBerry or _G.Prehis_Find or _G.Prehis_Skills or _G.Prehis_DB or _G.Prehis_DE or _G.FarmBlazeEM or _G.Dojoo or _G.CollectPresent or _G.AutoLawKak or _G.TpLab or _G.AutoPhoenixF or _G.AutoFarmChest or _G.AutoHytHallow or _G.LongsWord or _G.BlackSpikey or _G.AutoHolyTorch or _G.TrainDrago or _G.AutoSaber or _G.FarmMastery_Dev or _G.CitizenQuest or _G.AutoEctoplasm or _G.KeysRen or _G.Auto_Rainbow_Haki or _G.obsFarm or _G.AutoBigmom or _G.Doughv2 or _G.AuraBoss or _G.Raiding or _G.Auto_Cavender or _G.TpPly or _G.Bartilo_Quest or _G.Level or _G.FarmEliteHunt or _G.AutoZou or _G.AutoFarm_Bone or getgenv().AutoMaterial or _G.CraftVM or _G.FrozenTP or _G.TPDoor or _G.AcientOne or _G.AutoFarmNear or _G.AutoRaidCastle or _G.DarkBladev3 or _G.AutoFarmRaid or _G.Auto_Cake_Prince or _G.Addealer or _G.TPNpc or _G.TwinHook or _G.FindMirage or _G.FarmChestM or _G.Shark or _G.TerrorShark or _G.Piranha or _G.MobCrew or _G.SeaBeast1 or _G.FishBoat or _G.AutoPole or _G.AutoPoleV2 or _G.Auto_SuperHuman or _G.AutoDeathStep or _G.Auto_SharkMan_Karate or _G.Auto_Electric_Claw or _G.AutoDragonTalon or _G.Auto_Def_DarkCoat or _G.Auto_God_Human or _G.Auto_Tushita or _G.AutoMatSoul or _G.AutoKenVTWO or _G.AutoSerpentBow or _G.AutoFMon or _G.Auto_Soul_Guitar or _G.TPGEAR or _G.AutoSaw or _G.AutoTridentW2 or _G.Auto_StartRaid or _G.AutoEvoRace or _G.AutoGetQuestBounty or _G.MarinesCoat or _G.TravelDres or _G.Defeating or _G.DummyMan or _G.Auto_Yama or _G.Auto_SwanGG or _G.SwanCoat or _G.AutoEcBoss or _G.Auto_Mink or _G.Auto_Human or _G.Auto_Skypiea or _G.Auto_Fish or _G.CDK_TS or _G.CDK_YM or _G.CDK or _G.AutoFarmGodChalice or _G.AutoFistDarkness or _G.AutoMiror or _G.Teleport or _G.AutoKilo or _G.AutoGetUsoap or _G.Praying or _G.TryLucky or _G.AutoColShad or _G.AutoUnHaki or _G.Auto_DonAcces or _G.AutoRipIngay or _G.DragoV3 or _G.DragoV1 or _G.SailBoats or NextIs or _G.FarmGodChalice or _G.IceBossRen or senth or senth2 or _G.Lvthan or _G.beasthunter or _G.DangerLV or _G.Relic123 or _G.tweenKitsune or _G.Collect_Ember or _G.AutofindKitIs or _G.snaguine or _G.TwFruits or _G.tweenKitShrine or _G.Tp_LgS or _G.Tp_MasterA or _G.tweenShrine or _G.FarmMastery_G or _G.FarmMastery_S then

                shouldTween = true
                if not plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = plr.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end
                if not plr.Character:FindFirstChild('highlight') then
                    local Test = Instance.new('Highlight')
                    Test.Name = "highlight"
                    Test.Enabled = true
                    Test.FillColor = Color3.fromRGB(2, 197, 60)
                    Test.OutlineColor = Color3.fromRGB(255, 255, 255)
                    Test.FillTransparency = 0.5
                    Test.OutlineTransparency = 0.2
                    Test.Parent = plr.Character
                end
                for _, no in pairs(plr.Character:GetDescendants()) do
                    if no:IsA("BasePart") then
                        no.CanCollide = false
                    end
                end
            else
                shouldTween = false
                if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
                if plr.Character:FindFirstChild('highlight') then
                    plr.Character:FindFirstChild('highlight'):Destroy()
                end
            end
        end)
    end
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "catt farming ",
    SubTitle = "by idk",
    TabWidth = 180,
    Size = UDim2.fromOffset(560, 370),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})
local Tabs = {
    Main = Window:AddTab({ Title = "Tab Farming", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Tab Config", Icon = "settings" }),
    Melee = Window:AddTab({ Title = "Tab Fighting Style", Icon = "sword" }),
    Quests = Window:AddTab({ Title = "Tab Items Farm", Icon = "target" }),
    New = Window:AddTab({ Title = "Tab Events", Icon = "star" }),
    SeaEvent = Window:AddTab({ Title = "Tab Sea Events", Icon = "anchor" }),
    Mirage = Window:AddTab({ Title = "Tab Mirage RaceV4", Icon = "moon" }),
    Drago = Window:AddTab({ Title = "Tab Drago Dojo", Icon = "flame" }),
    Prehistoric = Window:AddTab({ Title = "Tab Prehistoric", Icon = "mountain" }),
    Raids = Window:AddTab({ Title = "Tab Raid", Icon = "crosshair" }),
    Combat = Window:AddTab({ Title = "Tab PvP", Icon = "swords" }),
    Travel = Window:AddTab({ Title = "Tab Location", Icon = "map" }),
    Fruit = Window:AddTab({ Title = "Tab Fruits", Icon = "apple" }),
    Shop = Window:AddTab({ Title = "Tab Shop", Icon = "shopping-bag" }),
    Misc = Window:AddTab({ Title = "Tab Misc", Icon = "grid" })
}

Tabs.Settings:AddSection("Settings / Configure")
local _Weapon = {
    "Melee",
    "Sword",
    "Blox Fruit",
    "Gun"
}
local Weapon_Config = Tabs.Settings:AddDropdown("Weapon_Config", {
    Title = "Select Weapon",
    Values = _Weapon,
    Multi = false,
    Default = 1
})
Weapon_Config:OnChanged(function(Value)
    _G.ChooseWP = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.ChooseWP == "Melee" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                        end
                    end
                end
            elseif _G.ChooseWP == "Sword" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                        end
                    end
                end
            elseif _G.ChooseWP == "Gun" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                        end
                    end
                end
            elseif _G.ChooseWP == "Blox Fruit" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                        end
                    end
                end
            end
        end)
    end
end)

local Initialize = Tabs.Settings:AddToggle("Initialize", {
    Title = "Auto Click",
    Description = "[ Auto Click Melee,Sword,fruit M1 ]",
    Default = true
})
Initialize:OnChanged(function(Value)
    _G.Seriality = Value
end)
local Bringmob = Tabs.Settings:AddToggle("Bringmob", {
    Title = "Bring Mobs",
    Description = "",
    Default = true
})
Bringmob:OnChanged(function(Value)
    _B = Value
end)
local BusuAura = Tabs.Settings:AddToggle("BusuAura", {
    Title = "Auto Turn on Buso",
    Description = "",
    Default = true
})
BusuAura:OnChanged(function(Value)
    Boud = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if Boud then
                local _HasBuso = {
                    "HasBuso",
                    "Buso"
                }
                if not plr.Character:FindFirstChild(_HasBuso[1]) then
                    replicated.Remotes.CommF_:InvokeServer(_HasBuso[2])
                end
            end
        end)
    end
end)

local RaceV3Aura = Tabs.Settings:AddToggle("RaceV3Aura", {
    Title = "Auto Turn on Race V3",
    Description = "",
    Default = false
})
RaceV3Aura:OnChanged(function(Value)
    _G.RaceClickAutov3 = Value
end)
spawn(function()
    while wait(.2) do
        pcall(function()
            if _G.RaceClickAutov3 then
                repeat
                    replicated.Remotes.CommE:FireServer("ActivateAbility")
                    wait(30)
                until not _G.RaceClickAutov3
            end
        end)
    end
end)
local RaceV4Aura = Tabs.Settings:AddToggle("RaceV4Aura", {
    Title = "Auto Turn on Race V4",
    Description = "",
    Default = false
})
RaceV4Aura:OnChanged(function(Value)
    _G.RaceClickAutov4 = Value
end)
spawn(function()
    while wait(.2) do
        pcall(function()
            if _G.RaceClickAutov4 then
                if plr.Character:FindFirstChild("RaceEnergy") then
                    if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
                        Useskills("nil", "Y")
                    end
                end
            end
        end)
    end
end)
local RandomAround = Tabs.Settings:AddToggle("RandomAround", {
    Title = "Auto Turn on Spin Position",
    Description = "",
    Default = false
})
RandomAround:OnChanged(function(Value)
    RandomCFrame = Value
end)
local Byp = Tabs.Settings:AddToggle("Byp", {
    Title = "Turn on Bypass Teleport",
    Description = "",
    Default = false
})
Byp:OnChanged(function(Value)
    _G.Bypass = Value
end)
local SafeModes = Tabs.Settings:AddToggle("SafeModes", {
    Title = "Panic Mode",
    Description = "turn on for safe ur health if low",
    Default = false
})
SafeModes:OnChanged(function(Value)
    _G.Safemode = Value
end)
spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.Safemode then
                local Calc_Health = plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth * 100
                if Calc_Health < Num_self then
                    shouldTween = true
                    _tp(Root.CFrame * CFrame.new(0, 500, 0))
                else
                    shouldTween = false
                end
            end
        end)
    end
end)
local UnDetectedAFK = Tabs.Settings:AddToggle("UnDetectedAFK", {
    Title = "Anti AFK",
    Description = "",
    Default = true
})
UnDetectedAFK:OnChanged(function(Value)
    _G.AntiAFK = Value
end)
plr.Idled:connect(function()
    vim2:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vim2:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
local DisblesVFX = Tabs.Settings:AddToggle("DisblesVFX", {
    Title = "Remove Hit VFX",
    Description = "",
    Default = false
})
DisblesVFX:OnChanged(function(Value)
    _G.DistroyHit = Value
end)
spawn(function()
    while wait(Sec) do
        if _G.DistroyHit then
            pcall(function()
                local __Efeect = {
                    "SlashHit",
                    "CurvedRing",
                    "SwordSlash",
                    "SlashTail"
                }
                for _, x in pairs(workspace["_WorldOrigin"]:GetChildren()) do
                    if table.find(__Effect, x.Name) then
                        x:Destroy()
                    end
                end
            end)
        end
    end
end)
local DisblesVFX = Tabs.Settings:AddToggle("DisblesVFX", {
    Title = "Remove Death & Respawned VFX",
    Description = "",
    Default = false
})
DisblesVFX:OnChanged(function(Value)
    RDeath = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if RDeath then
                if replicated.Effect.Container:FindFirstChild("Death") then
                    replicated.Effect.Container.Death:Destroy()
                end
                if replicated.Effect.Container:FindFirstChild("Respawn") then
                    replicated.Effect.Container.Respawn:Destroy()
                end
            end
        end)
    end
end)	
local DisblesVFX = Tabs.Settings:AddToggle("DisblesVFX", {
    Title = "Disable Notify",
    Description = "",
    Default = false
})
DisblesVFX:OnChanged(function(Value)
    RemoveDamage = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if RemoveDamage then
                replicated.Assets.GUI.DamageCounter.Enabled = false
                plr.PlayerGui.Notifications.Enabled = false
            else
                replicated.Assets.GUI.DamageCounter.Enabled = true
                plr.PlayerGui.Notifications.Enabled = true
            end
        end)
    end
end)      


Tabs.Mirage:AddSection("Mystic Island / Full Moon")
FullMOOn = Tabs.Mirage:AddParagraph({
    Title = " FullMoon Status ",
    Content = ""
})
Ismirage = Tabs.Mirage:AddParagraph({
    Title = " Mirage Island Status ",
    Content = ""
})
spawn(function()
    while wait(.2) do
        if workspace.Map:FindFirstChild("MysticIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
            Ismirage:SetDesc(" Mirage Island : True")
        else
            Ismirage:SetDesc(" Mirage Island : False")
        end
    end
end)
spawn(function()
    while wait(.2) do
        pcall(function()
            moon8 = "http://www.roblox.com/asset/?id=9709150401"
            moon7 = "http://www.roblox.com/asset/?id=9709150086"
            moon6 = "http://www.roblox.com/asset/?id=9709149680"
            moon5 = "http://www.roblox.com/asset/?id=9709149431"
            moon4 = "http://www.roblox.com/asset/?id=9709149052"
            moon3 = "http://www.roblox.com/asset/?id=9709143733"
            moon2 = "http://www.roblox.com/asset/?id=9709139597"
            moon1 = "http://www.roblox.com/asset/?id=9709135895"
            moon = Getmoon()
            if moon == moon1 then
                FullMOOn:SetDesc("Moon : 0 / 8")
            elseif moon == moon2 then
                FullMOOn:SetDesc("Moon : 1 / 8")
            elseif moon == moon3 then
                FullMOOn:SetDesc("Moon : 2 / 8")
            elseif moon == moon4 then
                FullMOOn:SetDesc("Moon : 3 / 8 [ Next Night ]")
            elseif moon == moon5 then
                FullMOOn:SetDesc("Moon : 4 / 8 [ Full Moon ]")
            elseif moon == moon6 then
                FullMOOn:SetDesc("Moon : 5 / 8 [ Last Night ]")
            elseif moon == moon7 then
                FullMOOn:SetDesc("Moon : 6 / 8")
            elseif moon == moon8 then
                FullMOOn:SetDesc("Moon : 7 / 8")
            end
        end)
    end
end)
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Find Mirage Island",
    Description = "turn on for finding & tween mirage island",
    Default = false
})
Q:OnChanged(function(Value)
    _G.FindMirage = Value
end)
spawn(function()
    while wait() do
        if _G.FindMirage then
            pcall(function()
                if not workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island", true) then
                    local myBoat = CheckBoat()
                    if not myBoat then
                        local buyBoatCFrame = CFrame.new(- 16927.451, 9.086, 433.864)
                        TeleportToTarget(buyBoatCFrame)
                        if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                        end
                    else
                        if plr.Character.Humanoid.Sit == false then
                            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(boatSeatCFrame)
                        else
                            repeat
                                wait()
                                local targetDestination = CFrame.new(- 10000000, 31, 37016.25)
                                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(- 10000000, 150, 37016.25))
                                else
                                    _tp(CFrame.new(- 10000000, 31, 37016.25))
                                end
                            until not _G.FindMirage or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island") or plr.Character.Humanoid.Sit == false
                            plr.Character.Humanoid.Sit = false
                        end
                    end
                else
                    _tp(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 300, 0))
                end
            end)
        end
    end
end)
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Tween To Highest Point",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.HighestMirage = Value
end)
spawn(function()
    while wait(Sec) do
        if _G.HighestMirage then
            pcall(function()
                if workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island", true) then
                    _tp(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 400, 0))
                end
            end)
        end
    end
end)
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Collect Gear",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.TPGEAR = Value
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.TPGEAR then
                for i, v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do
                    if v.Name == "Part" then
                        if v.ClassName == "MeshPart" then
                            _tp(v.CFrame)
                        end
                    end
                end
            end
        end
    end)
end)
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Change Transparency can see",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.can = Value
end)
spawn(function()
    pcall(function()
        while wait(Sec) do
            if _G.can then
                for i, v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do
                    if v.Name == "Part" then
                        if v.ClassName == "MeshPart" then
                            v.Transparency = 0
                        else
                            v.Transparency = 1
                        end
                    end
                end
            end
        end
    end)
end)
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Tween Advanced Fruit Dealer",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.Addealer = Value
end)
spawn(function()
    while wait() do
        if _G.Addealer then
            pcall(function()
                for _, v in pairs(replicated.NPCs:GetChildren()) do
                    if v.Name == "Advanced Fruit Dealer" then
                        _tp(v.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Collect Mirage Chest",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.FarmChestM = Value
end)
spawn(function()
    while wait(.2) do
        if _G.FarmChestM then
            pcall(function()
                if workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest") or workspace.Map.MysticIsland.Chests:FindFirstChild("FragChest") then
                    local CollectionService = game:GetService("CollectionService")
                    local Players = game:GetService("Players")
                    local Player = Players.LocalPlayer
                    local Character = Player.Character or Player.CharacterAdded:Wait()
                    if not Character then
                        return
                    end
                    local Position = Character:GetPivot().Position
                    local Chests = CollectionService:GetTagged("_ChestTagged")
                    local Distance, Nearest = math.huge, nil
                    for i = 1, # Chests do
                        local Chest = Chests[i]
                        local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
                        if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then
                            if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then
                                Distance = Magnitude
                                Nearest = Chest
                            end
                        end
                    end
                    if Nearest then
                        _tp(Nearest:GetPivot())
                    end
                end
            end)
        end
    end
end)

Tabs.Mirage:AddSection("Skull Guitars / Misc")
local CheckSoul = Tabs.Mirage:AddParagraph({
    Title = " Skull Guitar Quests ",
    Content = ""
})
spawn(function()
    while wait(.2) do
        pcall(function()
            if Quest1 == true then
                CheckSoul:SetDesc(" Quest Number : Quest1")
            elseif Quest2 == true then
                CheckSoul:SetDesc(" Quest Number : Quest2")
            elseif Quest3 == true then
                CheckSoul:SetDesc(" Quest Number : Quest3")
            elseif Quest4 == true then
                CheckSoul:SetDesc(" Quest Number : Quest4")
            elseif GetWP("Skull Guitar") then
                CheckSoul:SetDesc(" Quest Number : Collect!!")
            else
                CheckSoul:SetDesc(" Quest Number : No Quest!!")
            end
        end)
    end
end)
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Skull Guitar",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.Auto_Soul_Guitar = Value
end)
task.spawn(function()
    while wait() do
        if _G.Auto_Soul_Guitar then
            pcall(function()
                local v = GetConnectionEnemies("Living Zombie")
                if v then
                    v.HumanoidRootPart.CFrame = CFrame.new(- 10138.3974609375, 138.6524658203125, 5902.89208984375)
                    v.Head.CanCollide = false
                    v.Humanoid.Sit = false
                    v.HumanoidRootPart.CanCollide = false
                    v.Humanoid.JumpPower = 0
                    v.Humanoid.WalkSpeed = 0
                    if v.Humanoid:FindFirstChild('Animator') then
                        v.Humanoid:FindFirstChild('Animator'):Destroy()
                    end
                end
            end)
        end
    end
end)
function getT(num)
    local rotation
    if num == 1 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
    elseif num == 3 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
    elseif num == 4 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
    elseif num == 7 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
    elseif num == 10 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
    end
    if rotation then
        return rotation.Z
    end
end
function getRT(num)
    local Trophy_Q = workspace.Map["Haunted Castle"].Trophies.Quest
    local Trophy_Pos
    for _, v in pairs(Trophy_Q:GetChildren()) do
        if num == 1 and v.Name == "Trophy1" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation
        elseif num == 2 and v.Name == "Trophy2" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation         
        elseif num == 3 and v.Name == "Trophy3" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation       
        elseif num == 4 and v.Name == "Trophy4" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation  
        elseif num == 5 and v.Name == "Trophy5" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation     
        end          
        if Trophy_Pos then
            return Trophy_Pos.Z   
        end
    end
end
GetFirePlacard = function(Number, Side)
    if tostring(workspace.Map["Haunted Castle"]["Placard" .. Number][Side].Indicator.BrickColor) ~= "Pearl" then
        fireclickdetector(workspace.Map["Haunted Castle"]["Placard" .. Number][Side].ClickDetector)
    end
end
spawn(function()
    repeat
        task.wait()
    until _G.Auto_Soul_Guitar
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Soul_Guitar then
                if World3 then
                    replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
                    replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                    if replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check") == nil then
                        _tp(CFrame.new(- 8655.0166015625, 141.3166961669922, 6160.0224609375))
                        replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
                        replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Swamp == false then
                        Quest1 = true;
                        Quest2 = false;
                        Quest3 = false;
                        Quest4 = false;
                        local v = GetConnectionEnemies("Living Zombie")
                        if v then
                            repeat
                                task.wait()
                                Attack.Kill(v, _G.Auto_Soul_Guitar)
                            until not _G.Auto_Soul_Guitar or v.Humanoid.Health <= 0 or not v.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
                        else
                            _tp(CFrame.new(- 10170.7275390625, 138.6524658203125, 5934.26513671875))
                        end
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Gravestones == false then
                        Quest1 = false;
                        Quest2 = true;
                        Quest3 = false;
                        Quest4 = false;
                        GetFirePlacard("7", "Left")
                        GetFirePlacard("6", "Left")
                        GetFirePlacard("5", "Left")
                        GetFirePlacard("4", "Right")
                        GetFirePlacard("3", "Left")
                        GetFirePlacard("2", "Right")
                        GetFirePlacard("1", "Right")
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Ghost == false then
                        replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
                        replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Trophies == false then
                        Quest1 = false;
                        Quest2 = false;
                        Quest3 = true;
                        Quest4 = false;
                        _tp(CFrame.new(- 9532.8232421875, 6.471667766571045, 6078.068359375))
                        repeat
                            wait()
                            local z1 = getRT(1)
                            local _z1 = getT(1)
                            if z1 and _z1 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
                            end
                        until z1 == _z1
                        repeat
                            wait()
                            local z2 = getRT(2)
                            local _z2 = getT(3)
                            if z2 and _z2 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
                            end
                        until z2 == _z2
                        repeat
                            wait()
                            local z3 = getRT(3)
                            local _z3 = getT(4)
                            if z3 and _z3 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
                            end
                        until z3 == _z3
                        repeat
                            wait()
                            local z4 = getRT(4)
                            local _z4 = getT(7)
                            if z4 and _z4 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
                            end
                        until z4 == _z4
                        repeat
                            wait()
                            local z5 = getRT(5)
                            local _z5 = getT(10)
                            if z5 and _z5 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))
                            end
                        until z5 == _z5
                        repeat
                            wait()
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))
                        until workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Pipes == false then
                        Quest1 = false;
                        Quest2 = false;
                        Quest3 = false;
                        Quest4 = true;
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                    end
                end
            end
        end)
    end
end)
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Farm Material Skull Guitar",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.AutoMatSoul = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoMatSoul and GetWP("Skull Guitar") == false then
                if GetM("Bones") >= 500 and GetM("Ectoplasm") >= 250 and GetM("Dark Fragment") >= 1 then
                    replicated.Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
                else
                    if GetM("Ectoplasm") <= 250 then
                        if _G.AutoMatSoul and World2 then
                            local EctoTable = {
                                "Ship Deckhand",
                                "Ship Engineer",
                                "Ship Steward",
                                "Ship Officer",
                                "Arctic Warrior"
                            }
                            local xz = GetConnectionEnemies(EctoTable)
                            if xz then
                                repeat
                                    task.wait()
                                    Attack.Kill(xz, _G.AutoMatSoul)
                                until not _G.AutoMatSoul or not xz.Parent or xz.Humanoid.Health <= 0
                            else
                                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            end
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    elseif GetM("Dark Fragment") < 1 then
                        if _G.AutoMatSoul and World2 then
                            local black = GetConnectionEnemies("Darkbeard")
                            if black then
                                repeat
                                    task.wait()
                                    Attack.Kill(black, _G.AutoMatSoul)
                                until _G.AutoMatSoul or black.Humanoid.Health <= 0
                            else
                                _tp(CFrame.new(3798.4575195313, 13.826690673828, - 3399.806640625))
                            end
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                        if not GetConnectionEnemies("Darkbeard") then
                            Hop()
                        end
                    elseif GetM("Bones") <= 500 then
                        if _G.AutoMatSoul and World3 then
                            local BonesTable = {
                                "Reborn Skeleton",
                                "Living Zombie",
                                "Demonic Soul",
                                "Posessed Mummy"
                            }
                            local zx = GetConnectionEnemies(BonesTable)
                            if zx then
                                repeat
                                    task.wait()
                                    Attack.Kill(zx, _G.AutoMatSoul)
                                until not _G.AutoMatSoul or zx.Humanoid.Health <= 0 or not zx.Parent or zx.Humanoid.Health <= 0
                            else
                                _tp(CFrame.new(- 9504.8564453125, 172.14292907714844, 6057.259765625))
                            end
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    end
                end
            end
        end)
    end
end)
Tabs.Mirage:AddButton({
    Title = "Talk With Stone",
    Description = "",
    Callback = function()
        replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Begin")
        replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Check")
        replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Teleport")
        replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Continue")
    end
})
local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Look At Moon",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    LookM = Value
end)
function MoveCamtoMoon()
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position, Lighting:GetMoonDirection() + plr.Character.HumanoidRootPart.CFrame.Position)
end
task.spawn(function()
    while task.wait() do
        if LookM then
            MoveCamtoMoon()
            wait(.1)
            replicated.Remotes.CommE:FireServer("ActivateAbility")
        end
    end
end)

Tabs.Mirage:AddSection("Trials Quests / Misc V4")
local CheckTier = Tabs.Mirage:AddParagraph({
    Title = " Tiers V4 Status ",
    Content = ""
})
spawn(function()
    pcall(function()
        while wait(.2) do
            CheckTier:SetDesc(" Tiers - V4  :" .. " " .. plr.Data.Race.C.Value)
        end
    end)
end)

local Q = Tabs.Mirage:AddToggle("Q", {
    Title = "Auto Train V4",
    Description = "turn on for farm tier + auto upgrade your tier level",
    Default = false
})
Q:OnChanged(function(Value)
    _G.AcientOne = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AcientOne then
                local BonesTable = {
                    "Reborn Skeleton",
                    "Living Zombie",
                    "Demonic Soul",
                    "Posessed Mummy"
                }
                for i = 1, # BonesTable do
                    if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
                        vim1:SendKeyEvent(true, "Y", false, game)
                        replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
                        _tp(CFrame.new(- 8987.041015625, 215.862060546875, 5886.71044921875))
                    elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
                        local v = GetConnectionEnemies(BonesTable)
                        if v then
                            repeat
                                wait()
                                Attack.Kill(v, _G.AcientOne)
                            until _G.AcientOne == false or v.Humanoid.Health <= 0 or not v.Parent
                        else
                            _tp(CFrame.new(- 9495.6806640625, 453.58624267578125, 5977.3486328125))
                        end
                    end
                end
            end
        end)
    end
end)


Tabs.Drago:AddSection("Dojo Quest & Drago Race")
local DojoQ = Tabs.Drago:AddToggle("DojoQ", {
    Title = "Auto Dojo Trainer",
    Description = "turn on for do dojo belt quest white to black",
    Default = false
})
DojoQ:OnChanged(function(Value)
    _G.Dojoo = Value
end)
function printBeltName(data)
    if type(data) == "table" and data.Quest["BeltName"] then
        return data.Quest["BeltName"]
    end
end
spawn(function()
    while wait(Sec) do
        if _G.Dojoo then
            pcall(function()
                local args = {
                    [1] = {
                        ["NPC"] = "Dojo Trainer",
                        ["Command"] = "RequestQuest"
                    }
                }
                local progress = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
                local NameBelt = printBeltName(progress)
                if debug == false and not progress and not NameBelt then
                    _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
                    debug = true
                elseif debug == true and (CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                    if NameBelt == "White" then
                        local v = GetConnectionEnemies("Skull Slayer")
                        if v then
                            repeat
                                task.wait()
                                Attack.Kill(v, _G.Dojoo)
                            until not progress or not _G.Dojoo or not Attack.Alive(v)
                        else
                            _tp(CFrame.new(- 16759.58984375, 71.28376770019531, 1595.3399658203125))
                        end
                    elseif NameBelt == "Yellow" then
                        repeat
                            task.wait()
                            _G.SeaBeast1 = true
                            _G.TerrorShark = true
                            _G.Shark = true
                            _G.Piranha = true
                            _G.MobCrew = true
                            _G.FishBoat = true
                            _G.SailBoats = true
                        until not _G.Dojoo or not progress
                        _G.SeaBeast1 = false
                        _G.TerrorShark = false
                        _G.Shark = false
                        _G.Piranha = false
                        _G.MobCrew = false
                        _G.FishBoat = false
                        _G.SailBoats = false
                    elseif NameBelt == "Green" then
                        repeat
                            task.wait()
                            _G.SailBoats = true
                        until not _G.Dojoo or not progress
                        _G.SailBoats = false
                    elseif NameBelt == "Purple" then
                        repeat
                            task.wait()
                            _G.FarmEliteHunt = true
                        until not _G.Dojoo or not progress
                        _G.FarmEliteHunt = false
                    elseif NameBelt == "Red" then
                        repeat
                            task.wait()
                            _G.SailBoats = true
                            _G.FishBoat = true
                        until not _G.Dojoo or not progress
                        _G.SailBoats = false
                        _G.FishBoat = false
                    elseif NameBelt == "Black" then
                        repeat
                            task.wait()
                            if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
                                _G.Prehis_Find = true
                                if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
                                    _G.Prehis_Skills = false
                                    _G.Prehis_Find = true
                                else
                                    _G.Prehis_Skills = true
                                    _G.Prehis_Find = false
                                end
                            else
                                _G.Prehis_Find = true
                                _G.Prehis_Skills = false
                            end
                        until not _G.Dojoo or not progress
                        _G.Prehis_Find = false
                        _G.Prehis_Skills = false
                    elseif NameBelt == "Orange" or NameBelt == "Blue" then
                        return nil
                    end
                end
                if not progress then
                    debug = false
                    local args = {
                        [1] = {
                            ["NPC"] = "Dojo Trainer",
                            ["Command"] = "ClaimQuest"
                        }
                    }
                    replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
                end
            end)
        end
    end
end)
local BlazeEM = Tabs.Drago:AddToggle("BlazeEM", {
    Title = "Auto Dragon Hunter",
    Description = "turn on for farm blaze ember + auto collect blaze ember",
    Default = false
})
BlazeEM:OnChanged(function(Value)
    _G.FarmBlazeEM = Value
end)
checkQuesta = function()
    local a = {
        [1] = {
            ["Context"] = "Check"
        }
    }
    local b = nil;
    pcall(function()
        local c = {
            [1] = {
                ["Context"] = "RequestQuest"
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(c))
    end)
    local d, e = pcall(function()
        b = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(a))
    end)
    local f = false;
    local g;
    local h;
    local i;
    if b then
        if b.Text then
            f = true;
            local j = b.Text;
            if string.find(tostring(j), "Defeat") then
                i = 1;
                g = string.sub(tostring(j), 8, 9)
                g = tonumber(g)
                local k = {
                    "Hydra Enforcer",
                    "Venomous Assailant"
                }
                for l, m in pairs(k) do
                    if string.find(j, m) then
                        h = m;
                        break
                    end
                end
            elseif string.find(tostring(j), "Destroy") then
                g = 10;
                i = 2;
                h = nil
            end
        end
    end;
    return f, h, g, i
end
BackTODoJo = function()
    for a, b in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
        if b.Name == "NotificationTemplate" then
            if string.find(b.Text, "Head back to the Dojo to complete more tasks") then
                return true
            end
        end
    end;
    return false
end
DragonMobClear = function(a, b, c)
    if workspace.Enemies:FindFirstChild(b) then
        for d, e in pairs(workspace.Enemies:GetChildren()) do
            if e.Name == b and Attack.Alive(e) then
                if a then
                    Attack.Kill(e, a)
                end
            end
        end
    else
        _tp(c)
    end
end
spawn(function()
    while wait() do
        if _G.FarmBlazeEM then
            pcall(function()
                local a, v, h, x = checkQuesta()
                if a == true and not BackTODoJo() then
                    if x == 1 then
                        if v == "Hydra Enforcer" or v == "Venomous Assailant" then
                            repeat
                                wait()
                                DragonMobClear(true, v, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                            until not _G.FarmBlazeEM or not a or BackTODoJo()
                        end
                    elseif x == 2 then
                        if workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then
                            repeat
                                wait()
                                spawn(function()
                                    _tp(workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4, 0, 0))
                                end)
                                if (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then
                                    MousePos = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
                                    Useskills("Melee", "Z")
                                    Useskills("Melee", "X")
                                    Useskills("Melee", "C")
                                    wait(.5)
                                    Useskills("Sword", "Z")
                                    Useskills("Sword", "X")
                                    wait(.5)
                                    Useskills("Blox Fruit", "Z")
                                    Useskills("Blox Fruit", "X")
                                    Useskills("Blox Fruit", "C")
                                    wait(.5)
                                    Useskills("Gun", "Z")
                                    Useskills("Gun", "X")
                                end
                            until not _G.FarmBlazeEM or not a or BackTODoJo()
                        end
                    end
                else
                    _tp(CFrame.new(5813, 1208, 884))
                    DragonMobClear(false, nil, nil)
                end
            end)
        end
    end
end)
spawn(function()
    while wait(.1) do
        if _G.FarmBlazeEM then
            pcall(function()
                if workspace.EmberTemplate:FindFirstChild("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame
                end
            end)
        end
    end
end)

Tabs.Drago:AddSection("Drago Trial")
GetQuestDracoLevel = function()
    local v371 = {
        [1] = {
            NPC = "Dragon Wizard",
            Command = "Upgrade"
        }
    };
    return replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371))
end
Toggle = Tabs.Drago:AddToggle("Toggle", {
    Title = "Tween To Upgrade Droco Trial",
    Description = "",
    Default = false
})
Toggle:OnChanged(function(Value)
    _G.UPGDrago = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.UPGDrago then
                if GetQuestDracoLevel() == false then
                    return nil
                elseif GetQuestDracoLevel() == true then
                    if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
                        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
                    else
                        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
                        local v371 = {
                            [1] = {
                                NPC = "Dragon Wizard",
                                Command = "Upgrade"
                            }
                        };
                        replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));
                    end
                end
            end
        end)
    end
end)
Toggle = Tabs.Drago:AddToggle("Toggle", {
    Title = "Auto Drago (V1)",
    Description = "turn on for auto quest1 auto prehistoric event + collect dragon eggs",
    Default = false
})
Toggle:OnChanged(function(Value)
    _G.DragoV1 = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.DragoV1 then
                if GetM("Dragon Egg") <= 0 then
                    repeat
                        wait()
                        _G.Prehis_Find = true
                        _G.Prehis_Skills = true
                        _G.Prehis_DE = true
                    until not _G.DragoV1 or GetM("Dragon Egg") >= 1
                    _G.Prehis_Find = false
                    _G.Prehis_Skills = false
                    _G.Prehis_DE = false
                end
            end
        end)
    end
end)
local fireflower = Tabs.Drago:AddToggle("fireflower", {
    Title = "Auto Drago (V2)",
    Description = "turn on for auto kill Forest Pirate & Collect fireflower",
    Default = false
})
fireflower:OnChanged(function(Value)
    _G.AutoFireFlowers = Value
end)
spawn(function()
    while wait(Sec) do
        if _G.AutoFireFlowers then
            local FireFlower = workspace:FindFirstChild("FireFlowers")
            local v = GetConnectionEnemies("Forest Pirate")
            if v then
                repeat
                    wait()
                    Attack.Kill(v, _G.AutoFireFlowers)
                until not _G.AutoFireFlowers or not v.Parent or v.Humanoid.Health <= 0 or FireFlower
            else
                _tp(CFrame.new(- 13206.452148438, 425.89199829102, - 7964.5537109375))
            end
            if FireFlower then
                for i, v in pairs(FireFlower:GetChildren()) do
                    if (v:IsA("Model") and v.PrimaryPart) then
                        local FlowerPos = v.PrimaryPart.Position;
                        local playerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                        local Magnited = (FlowerPos - playerRoot).Magnitude;
                        if (Magnited <= 100) then
                            vim1:SendKeyEvent(true, "E", false, game)
                            wait(1.5)
                            vim1:SendKeyEvent(false, "E", false, game)
                        else
                            _tp(CFrame.new(FlowerPos));
                        end
                    end
                end
            end
        end
    end
end)
Toggle = Tabs.Drago:AddToggle("Toggle", {
    Title = "Auto Drago (V3)",
    Description = "turn on for sea event kill terror shark",
    Default = false
})
Toggle:OnChanged(function(Value)
    _G.DragoV3 = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.DragoV3 then
                repeat
                    wait()
                    _G.DangerSc = "Lv Infinite"
                    _G.SailBoats = true
                    _G.TerrorShark = true
                until not _G.DragoV3
                _G.DangerSc = "Lv 1"
                _G.SailBoats = false
                _G.TerrorShark = false
            end
        end)
    end
end)

Toggle = Tabs.Drago:AddToggle("Toggle", {
    Title = "Auto Train Drago v4",
    Description = "turn on for training Drago race v4 + auto upgrade tier",
    Default = false
})
Toggle:OnChanged(function(Value)
    _G.TrainDrago = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.TrainDrago then
                local DragoM = {
                    "Venomous Assailant",
                    "Hydra Enforcer"
                }
                for i = 1, # DragoM do
                    if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
                        vim1:SendKeyEvent(true, "Y", false, game)
                        replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy", 2)
                        _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                    elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
                        local v = GetConnectionEnemies(DragoM)
                        if v then
                            repeat
                                wait()
                                Attack.Kill(v, _G.TrainDrago)
                            until _G.TrainDrago == false or v.Humanoid.Health <= 0 or not v.Parent
                        else
                            _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                        end
                    end
                end
            end
        end)
    end
end)

local bdrago = Tabs.Drago:AddToggle("bdrago", {
    Title = "Swap Drago Race",
    Description = "",
    Default = false
})
bdrago:OnChanged(function(Value)
    _G.BuyDrago = Value
end)
spawn(function()
    while wait(Sec) do
        if _G.BuyDrago then
            pcall(function()
                if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
                    _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
                else
                    _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
                    local v371 = {
                        [1] = {
                            NPC = "Dragon Wizard",
                            Command = "DragonRace"
                        }
                    };
                    replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));
                end
            end)
        end
    end
end)
local UpTalon = Tabs.Drago:AddToggle("UpTalon", {
    Title = "Upgrade Dragon Talon With Uzoth",
    Description = "",
    Default = false
})
UpTalon:OnChanged(function(Value)
    _G.DT_Uzoth = Value
end)
spawn(function()
    while wait(Sec) do
        if _G.DT_Uzoth then
            local Uz_POS = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, - 1.36805838e-08, - 0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, - 6.23161966e-08, 0.811413169)
            _tp(Uz_POS)
            if (Uz_POS.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 25 then
                local ohTable1 = {
                    ["NPC"] = "Uzoth",
                    ["Command"] = "Upgrade"
                }
                replicated.Modules.Net["RF/InteractDragonQuest"]:InvokeServer(ohTable1)
            end
        end
    end
end)

Tabs.Prehistoric:AddSection("Volcanic Magnet")
Toggle = Tabs.Prehistoric:AddToggle("Toggle", {
    Title = "Auto Craft Volcanic Magnet",
    Description = "turn on for auto farm material and craft volcanic magnet & stop when you have 1 volcanic magnet",
    Default = false
})
Toggle:OnChanged(function(Value)
    _G.CraftVM = Value
end)
Tabs.Prehistoric:AddButton({
    Title = "Craft Volcanic Magnet",
    Description = "",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "Volcanic Magnet")
    end
})
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.CraftVM then
                if GetM("Volcanic Magnet") < 1 then
                    if GetM("Scrap Metal") >= 10 and GetM("Blaze Ember") >= 15 then
                        replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "Volcanic Magnet")
                    elseif GetM("Scrap Metal") < 10 then
                        local v = GetConnectionEnemies("Forest Pirate")
                        if v then
                            repeat
                                wait()
                                Attack.Kill(v, _G.CraftVM)
                            until not _G.CraftVM or not v.Parent or v.Humanoid.Health <= 0 or GetM("Scrap Metal") >= 10
                        else
                            _tp(CFrame.new(- 13206.452148438, 425.89199829102, - 7964.5537109375))
                        end
                    elseif GetM("Blaze Ember") < 15 then
                        repeat
                            wait()
                            _G.FarmBlazeEM = true
                        until not _G.CraftVM or GetM("Blaze Ember") >= 15
                        _G.FarmBlazeEM = false
                    end
                end
            end
        end)
    end
end)
Tabs.Prehistoric:AddSection("Prehistoric Island")
local Check_Volcano = Tabs.Prehistoric:AddParagraph({
    Title = " Prehistoric Island Status ",
    Content = ""
})
spawn(function()
    while wait(.2) do
        if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
            Check_Volcano:SetDesc(" Prehistoric Island : True")
        else
            Check_Volcano:SetDesc(" Prehistoric Island : False")
        end
    end
end)
Vocan = Tabs.Prehistoric:AddToggle("Vocan", {
    Title = "Auto Find Prehistoric Island",
    Description = "turn on for finding & tween & start prehistoric island",
    Default = false
})
Vocan:OnChanged(function(Value)
    _G.Prehis_Find = Value
end)
local targetDestination = nil
spawn(function()
    while wait() do
        if _G.Prehis_Find then
            pcall(function()
                if not workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then
                    local myBoat = CheckBoat()
                    if not myBoat then
                        local buyBoatCFrame = CFrame.new(- 16927.451, 9.086, 433.864)
                        TeleportToTarget(buyBoatCFrame)
                        if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                        end
                    else
                        if plr.Character.Humanoid.Sit == false then
                            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(boatSeatCFrame)
                        else
                            repeat
                                wait()
                                local targetDestination = CFrame.new(- 10000000, 31, 37016.25)
                                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(- 10000000, 150, 37016.25))
                                else
                                    _tp(CFrame.new(- 10000000, 31, 37016.25))
                                end
                            until not _G.Prehis_Find or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island") or plr.Character.Humanoid.Sit == false
                            plr.Character.Humanoid.Sit = false
                        end
                    end
                else
                    if (workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
                        _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame)
                    end
                    if workspace.Map:FindFirstChild("PrehistoricIsland", true) or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then
                        if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
                            if plr:DistanceFromCharacter(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame.Position) <= 150 then
                                fireproximityprompt(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt, math.huge)
                                vim1:SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vim1:SendKeyEvent(false, "E", false, game)
                            end
                            _tp(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)
local Vocan = Tabs.Prehistoric:AddToggle("Vocan", {
    Title = "Auto Patch Prehistoric Event",
    Description = "turn on for auto patch volcano + kill aura lava golems + auto remove lava",
    Default = false
})
Vocan:OnChanged(function(Value)
    _G.Prehis_Skills = Value
end)
spawn(function()
    while wait() do
        if _G.Prehis_Skills then
            local prehistoricIsland = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIsland then
                for _, obj in pairs(prehistoricIsland:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name:lower():find("lava") then
                        obj:Destroy()
                    end
                    if obj:IsA("MeshPart") and obj.Name:lower():find("lava") then
                        obj:Destroy()
                    end
                end
                local lavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
                if lavaModel and lavaModel:IsA("Model") then
                    lavaModel:Destroy()
                end
                local Island = workspace.Map:FindFirstChild("PrehistoricIsland")
                if Island then
                    local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
                    for _, v in pairs(Island:GetDescendants()) do
                        if v.Name == "TouchInterest" then
                            if not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
                                v.Parent:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Prehis_Skills then
                if workspace.Enemies:FindFirstChild("Lava Golem") then
                    local v = GetConnectionEnemies("Lava Golem")
                    if v then
                        repeat
                            wait()
                            Attack.Kill(v, _G.Prehis_Skills)
                            v.Humanoid:ChangeState(15)
                        until not _G.Prehis_Skills or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
                for i, v in pairs(game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks:GetChildren()) do
                    if v:FindFirstChild("VFXLayer") then
                        if v:FindFirstChild("VFXLayer").At0.Glow.Enabled == true or v.VFXLayer.At0.Glow.Enabled == true then
                            repeat
                                wait()
                                _tp(v.VFXLayer.CFrame)
                                if v.VFXLayer.At0.Glow.Enabled == true and plr:DistanceFromCharacter(v.VFXLayer.CFrame.Position) <= 150 then
                                    MousePos = v.VFXLayer.CFrame.Position
                                    Useskills("Melee", "Z")
                                    wait(.5)
                                    Useskills("Melee", "X")
                                    wait(.5)
                                    Useskills("Melee", "C")
                                    wait(.5)
                                    Useskills("Blox Fruit", "Z")
                                    wait(.5)
                                    Useskills("Blox Fruit", "X")
                                    wait(.5)
                                    Useskills("Blox Fruit", "C")
                                end
                            until not _G.Prehis_Skills or v:FindFirstChild("VFXLayer").At0.Glow.Enabled == false or v.VFXLayer.At0.Glow.Enabled == false
                        end
                    end
                end
            end
        end)
    end
end)
local Vocan = Tabs.Prehistoric:AddToggle("Vocan", {
    Title = "Auto Collect Dino Bones",
    Description = "",
    Default = false
})
Vocan:OnChanged(function(Value)
    _G.Prehis_DB = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_DB then
                if workspace:FindFirstChild("DinoBone") then
                    for i, v in pairs(workspace:GetChildren()) do
                        if v.Name == "DinoBone" then
                            _tp(v.CFrame)
                        end
                    end
                end
            end
        end)
    end
end)
local Vocan = Tabs.Prehistoric:AddToggle("Vocan", {
    Title = "Auto Collect Dragon Eggs",
    Description = "",
    Default = false
})
Vocan:OnChanged(function(Value)
    _G.Prehis_DE = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_DE then
                if workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg") then
                    _tp(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame)
                    fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30)
                end
            end
        end)
    end
end)
Toggle = Tabs.Prehistoric:AddToggle("Toggle", {
    Title = "Auto Reset When Complete Volcano",
    Description = "Reset When Complete Volcano not collect dino bones and else..",
    Default = false
})
Toggle:OnChanged(function(Value)
    _G.ResetPH = Value
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.ResetPH then
                local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");
                if (v748 and v748:FindFirstChild("TouchInterest")) then
                    plr.Character.Humanoid.Health = 0
                else
                    if workspace:FindFirstChild("DinoBone") then
                        for i, v in pairs(workspace:GetChildren()) do
                            if v.Name == "DinoBone" then
                                _tp(v.CFrame)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

Tabs.SeaEvent:AddSection("Sea Event / Setting Sail")
local ListSeaBoat = {
    "Guardian",
    "PirateGrandBrigade",
    "MarineGrandBrigade",
    "PirateBrigade",
    "MarineBrigade",
    "PirateSloop",
    "MarineSloop",
    "Beast Hunter"
}
local ListSeaZone = {
    "Lv 1",
    "Lv 2",
    "Lv 3",
    "Lv 4",
    "Lv 5",
    "Lv 6",
    "Lv Infinite"
}
local SPYING = Tabs.SeaEvent:AddParagraph({
    Title = " Spy Status ",
    Content = ""
})
spawn(function()
    while wait(.2) do
        pcall(function()
            local spycheck = string.match(replicated.Remotes.CommF_:InvokeServer("InfoLeviathan", "1"), "%d+")
            if spycheck then
                SPYING:SetDesc(" Spy Leviathan  : " .. tostring(spycheck))
                if tostring(spycheck) == 5 then
                    SPYING:SetDesc(" Spy Leviathan : Already Done!!")
                end
            end
        end)
    end
end)
Tabs.SeaEvent:AddButton({
    Title = "Buy Fracments with Spy",
    Description = "Buy the spy for finding leviathan",
    Callback = function()
        replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan", "2")
    end
})
local FloD = Tabs.SeaEvent:AddParagraph({
    Title = " FlozenDimension Status ",
    Content = ""
})
spawn(function()
    pcall(function()
        while wait(.2) do
            if workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FloD:SetDesc(' Flozen Dimension : True')
            else
                FloD:SetDesc(' Flozen Dimension : False')
            end
        end
    end)
end)
local Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Teleport Frozen Dimension",
    Description = "turn on for teleport to frozen dimension and start the leviathan gate",
    Default = false
})
Q:OnChanged(function(Value)
    _G.FrozenTP = Value
end)
spawn(function()
    while wait(.1) do
        if _G.FrozenTP then
            pcall(function()
                if workspace.Map:FindFirstChild("LeviathanGate") then
                    _tp(workspace.Map.LeviathanGate.CFrame)
                    replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("OpenLeviathanGate")
                end
            end)
        end
    end
end)
local Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Drive To Hydra Island",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.SailBoat_Hydra = Value
end)
spawn(function()
    while wait() do
        if _G.SailBoat_Hydra then
            pcall(function()
                local myBoat = CheckBoat()
                if not myBoat then
                    local buyBoatCFrame = CFrame.new(- 16927.451, 9.086, 433.864)
                    TeleportToTarget(buyBoatCFrame)
                    if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                    end
                elseif myBoat then
                    if plr.Character.Humanoid.Sit == false then
                        local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                        _tp(boatSeatCFrame)
                    else
                        repeat
                            wait()
                            if CheckEnemiesBoat() or CheckPirateGrandBrigade() or CheckTerrorShark() then
                                _tp(CFrame.new(5433, 150, 290))
                            else
                                _tp(CFrame.new(5433, 35, 290))
                            end
                        until _G.SailBoat_Hydra == false or plr.Character:WaitForChild("Humanoid").Sit == false
                        plr.Character.Humanoid.Sit = false
                    end
                end
            end)
        end
    end
end)
local Q = Tabs.SeaEvent:AddDropdown("Q", {
    Title = "Choose Boats",
    Values = ListSeaBoat,
    Multi = false,
    Default = 1
})
Q:OnChanged(function(Value)
    _G.SelectedBoat = Value
end)
Tabs.SeaEvent:AddButton({
    Title = "Buy Boats",
    Description = "Buy the select boats",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
    end
})
local Q = Tabs.SeaEvent:AddDropdown("Q", {
    Title = "Choose Sea Level",
    Values = ListSeaZone,
    Multi = false,
    Default = 1
})
Q:OnChanged(function(Value)
    _G.DangerSc = Value
end)
local Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Sail Boat",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.SailBoats = Value
end)
spawn(function()
    while wait() do
        if _G.SailBoats then
            pcall(function()
                local myBoat = CheckBoat()
                if not myBoat and not (CheckShark() and _G.Shark or CheckTerrorShark() and _G.TerrorShark or CheckFishCrew() and _G.MobCrew or CheckPiranha() and _G.Piranha) and not (CheckEnemiesBoat() and _G.FishBoat) and not (CheckSeaBeast() and _G.SeaBeast1) and not (_G.PGB and CheckPirateGrandBrigade()) and not (_G.HCM and CheckHauntedCrew()) and not (_G.Leviathan1 and CheckLeviathan()) then
                    local buyBoatCFrame = CFrame.new(- 16927.451, 9.086, 433.864)
                    TeleportToTarget(buyBoatCFrame)
                    if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                    end
                elseif myBoat and not (CheckShark() and _G.Shark or CheckTerrorShark() and _G.TerrorShark or CheckFishCrew() and _G.MobCrew or CheckPiranha() and _G.Piranha) and not (CheckEnemiesBoat() and _G.FishBoat) and not (CheckSeaBeast() and _G.SeaBeast1) and not (_G.PGB and CheckPirateGrandBrigade()) and not (_G.HCM and CheckHauntedCrew()) and not (_G.Leviathan1 and CheckLeviathan()) then
                    if plr.Character.Humanoid.Sit == false then
                        local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                        _tp(boatSeatCFrame)
                    else
                        if _G.DangerSc == "Lv 1" then
                            CFrameSelectedZone = CFrame.new(- 21998.375, 30.0006084, - 682.309143)
                        elseif _G.DangerSc == "Lv 2" then
                            CFrameSelectedZone = CFrame.new(- 26779.5215, 30.0005474, - 822.858032)
                        elseif _G.DangerSc == "Lv 3" then
                            CFrameSelectedZone = CFrame.new(- 31171.957, 30.0001011, - 2256.93774)
                        elseif _G.DangerSc == "Lv 4" then
                            CFrameSelectedZone = CFrame.new(- 34054.6875, 30.2187767, - 2560.12012)
                        elseif _G.DangerSc == "Lv 5" then
                            CFrameSelectedZone = CFrame.new(- 38887.5547, 30.0004578, - 2162.99023)
                        elseif _G.DangerSc == "Lv 6" then
                            CFrameSelectedZone = CFrame.new(- 44541.7617, 30.0003204, - 1244.8584)
                        elseif _G.DangerSc == "Lv Infinite" then
                            CFrameSelectedZone = CFrame.new(- 10000000, 31, 37016.25)
                        end
                        repeat
                            wait()
                            if (not _G.FishBoat and CheckEnemiesBoat()) or (not _G.PGB and CheckPirateGrandBrigade()) or (not _G.TerrorShark and CheckTerrorShark()) then
                                _tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
                            else
                                _tp(CFrameSelectedZone)
                            end
                        until _G.SailBoats == false or (CheckShark() and _G.Shark or CheckTerrorShark() and _G.TerrorShark or CheckFishCrew() and _G.MobCrew or CheckPiranha() and _G.Piranha) or CheckSeaBeast() and _G.SeaBeast1 or CheckEnemiesBoat() and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or plr.Character:WaitForChild("Humanoid").Sit == false
                        plr.Character.Humanoid.Sit = false
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            for a, b in pairs(workspace.Boats:GetChildren()) do
                for c, d in pairs(workspace.Boats[b.Name]:GetDescendants()) do
                    if d:IsA("BasePart") then
                        if _G.SailBoats or _G.Prehis_Find or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then
                            d.CanCollide = false
                        else
                            d.CanCollide = true
                        end
                    end
                end
            end
        end)
    end
end)
Tabs.SeaEvent:AddSection("Entity Sea Event")
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Shark",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.Shark = Value
end)
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Piranha",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.Piranha = Value
end)
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Terror Shark",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.TerrorShark = Value
end)
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Fish Crew Member",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.MobCrew = Value
end)
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Haunted Crew Member",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.HCM = Value
end)
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Attack PirateGrandBrigade",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.PGB = Value
end)
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Attack Fish Boat",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.FishBoat = Value
end)
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Attack Sea Beast",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.SeaBeast1 = Value
end)
Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Attack Leviathan",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.Leviathan1 = Value
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Shark then
                local a = {
                    "Shark"
                }
                if CheckShark() then
                    for b, c in pairs(workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.Kill(c, _G.Shark)
                                until _G.Shark == false or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
            if _G.TerrorShark then
                local a = {
                    "Terrorshark"
                }
                if CheckTerrorShark() then
                    for b, c in pairs(workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.KillSea(c, _G.TerrorShark)
                                until _G.TerrorShark == false or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
            if _G.Piranha then
                local a = {
                    "Piranha"
                }
                if CheckPiranha() then
                    for b, c in pairs(workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.Kill(c, _G.Piranha)
                                until _G.Piranha == false or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
            if _G.MobCrew then
                local a = {
                    "Fish Crew Member"
                }
                if CheckFishCrew() then
                    for b, c in pairs(workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.Kill(c, _G.MobCrew)
                                until _G.MobCrew == false or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
            if _G.HCM then
                local a = {
                    "Haunted Crew Member"
                }
                if CheckHauntedCrew() then
                    for b, c in pairs(workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.Kill(c, _G.HCM)
                                until _G.HCM == false or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
            if _G.SeaBeast1 then
                if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
                    for a, b in pairs(workspace.SeaBeasts:GetChildren()) do
                        if b:FindFirstChild("HumanoidRootPart") and b:FindFirstChild("Health") and b.Health.Value > 0 then
                            repeat
                                task.wait()
                                spawn(function()
                                    _tp(CFrame.new(b.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, b.HumanoidRootPart.Position.Z))
                                end)
                                if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position) <= 500 then
                                    AitSeaSkill_Custom = b.HumanoidRootPart.CFrame;
                                    MousePos = AitSeaSkill_Custom.Position;
                                    if CheckF() then
                                        weaponSc("Blox Fruit")
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                    else
                                        Useskills("Melee", "Z")
                                        Useskills("Melee", "X")
                                        Useskills("Melee", "C")
                                        wait(.1)
                                        Useskills("Sword", "Z")
                                        Useskills("Sword", "X")
                                        wait(.1)
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                        wait(.1)
                                        Useskills("Gun", "Z")
                                        Useskills("Gun", "X")
                                    end
                                end
                            until _G.SeaBeast1 == false or not b:FindFirstChild("HumanoidRootPart") or not b.Parent or b.Health.Value <= 0
                        end
                    end
                end
            end
            if _G.Leviathan1 then
                if workspace.SeaBeasts:FindFirstChild("Leviathan") then
                    for a, b in pairs(workspace.SeaBeasts:GetChildren()) do
                        if b:FindFirstChild("HumanoidRootPart") and b:FindFirstChild("Leviathan Segment") and b:FindFirstChild("Health") and b.Health.Value > 0 then
                            repeat
                                task.wait()
                                spawn(function()
                                    _tp(CFrame.new(b.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, b.HumanoidRootPart.Position.Z))
                                end)
                                if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position) <= 500 then
                                    MousePos = b:FindFirstChild("Leviathan Segment").Position;
                                    if CheckF() then
                                        weaponSc("Blox Fruit")
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                    else
                                        Useskills("Melee", "Z")
                                        Useskills("Melee", "X")
                                        Useskills("Melee", "C")
                                        wait(.1)
                                        Useskills("Sword", "Z")
                                        Useskills("Sword", "X")
                                        wait(.1)
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                        wait(.1)
                                        Useskills("Gun", "Z")
                                        Useskills("Gun", "X")
                                    end
                                end
                            until _G.Leviathan1 == false or not b:FindFirstChild("HumanoidRootPart") or not b.Parent or b.Health.Value <= 0
                        end
                    end
                end
            end
            if _G.FishBoat then
                if CheckEnemiesBoat() then
                    for a, b in pairs(workspace.Enemies:GetChildren()) do
                        if b:FindFirstChild("Health") and b.Health.Value > 0 and b:FindFirstChild("VehicleSeat") then
                            repeat
                                task.wait()
                                spawn(function()
                                    if b.Name == "FishBoat" then
                                        _tp(b.Engine.CFrame * CFrame.new(0, - 50, - 25))
                                    end
                                end)
                                if plr:DistanceFromCharacter(b.Engine.CFrame.Position) <= 150 then
                                    AitSeaSkill_Custom = b.Engine.CFrame;
                                    MousePos = AitSeaSkill_Custom.Position;
                                    if CheckF() then
                                        weaponSc("Blox Fruit")
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                    else
                                        Useskills("Melee", "Z")
                                        Useskills("Melee", "X")
                                        Useskills("Melee", "C")
                                        wait(.1)
                                        Useskills("Sword", "Z")
                                        Useskills("Sword", "X")
                                        wait(.1)
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                        wait(.1)
                                        Useskills("Gun", "Z")
                                        Useskills("Gun", "X")
                                    end
                                end
                            until _G.FishBoat == false or not b:FindFirstChild("VehicleSeat") or b.Health.Value <= 0
                        end
                    end
                end
            end
            if _G.PGB then
                if CheckPirateGrandBrigade() then
                    for a, b in pairs(workspace.Enemies:GetChildren()) do
                        if b:FindFirstChild("Health") and b.Health.Value > 0 and b:FindFirstChild("VehicleSeat") then
                            repeat
                                task.wait()
                                spawn(function()
                                    if b.Name == "PirateBrigade" then
                                        _tp(b.Engine.CFrame * CFrame.new(0, - 30, - 10))
                                    elseif b.Name == "PirateGrandBrigade" then
                                        _tp(b.Engine.CFrame * CFrame.new(0, - 50, - 50))
                                    end
                                end)
                                if plr:DistanceFromCharacter(b.Engine.CFrame.Position) <= 150 then
                                    AitSeaSkill_Custom = b.Engine.CFrame;
                                    MousePos = AitSeaSkill_Custom.Position;
                                    if CheckF() then
                                        weaponSc("Blox Fruit")
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                    else
                                        Useskills("Melee", "Z")
                                        Useskills("Melee", "X")
                                        Useskills("Melee", "C")
                                        wait(.1)
                                        Useskills("Sword", "Z")
                                        Useskills("Sword", "X")
                                        wait(.1)
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                        wait(.1)
                                        Useskills("Gun", "Z")
                                        Useskills("Gun", "X")
                                    end
                                end
                            until _G.PGB == false or not b:FindFirstChild("VehicleSeat") or b.Health.Value <= 0
                        end
                    end
                end
            end
        end)
    end
end)

Tabs.SeaEvent:AddSection("Kitsune Island / Event")
local Check_Kitsu = Tabs.SeaEvent:AddParagraph({
    Title = " Kitsune Island Status ",
    Content = ""
})
spawn(function()
    while wait(.2) do
        if workspace.Map:FindFirstChild("KitsuneIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
            Check_Kitsu:SetDesc(" Kitsune Island : True")
        else
            Check_Kitsu:SetDesc(" Kitsune Island : False")
        end
    end
end)
local Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Find Kitsune Island",
    Description = "turn on for finding & tween kitsune island",
    Default = false
})
Q:OnChanged(function(Value)
    _G.AutofindKitIs = Value
end)
spawn(function()
    while wait() do
        if _G.AutofindKitIs then
            pcall(function()
                if not workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island", true) then
                    local myBoat = CheckBoat()
                    if not myBoat then
                        local buyBoatCFrame = CFrame.new(- 16927.451, 9.086, 433.864)
                        TeleportToTarget(buyBoatCFrame)
                        if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                        end
                    else
                        if plr.Character.Humanoid.Sit == false then
                            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(boatSeatCFrame)
                        else
                            local targetDestination = CFrame.new(- 10000000, 31, 37016.25)
                            repeat
                                wait()
                                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(- 10000000, 150, 37016.25))
                                else
                                    _tp(CFrame.new(- 10000000, 31, 37016.25))
                                end
                            until not _G.AutofindKitIs or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island") or plr.Character.Humanoid.Sit == false
                            plr.Character.Humanoid.Sit = false
                        end
                    end
                else
                    _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
                end
            end)
        end
    end
end)
local Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Teleport to Shrine Actived",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.tweenShrine = Value
end)
spawn(function()
    while wait(.1) do
        if _G.tweenShrine then
            pcall(function()
                local kit_is = workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
                local shrineActive = kit_is:FindFirstChild("ShrineActive")
                if shrineActive then
                    for _, v in next, shrineActive:GetDescendants() do
                        if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                            replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                            repeat
                                wait()
                                _tp(v.CFrame * CFrame.new(0, 2, 0))
                            until _G.tweenShrine == false or not kit_is
                        end
                    end
                else
                    _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
                end
            end)
        end
    end
end)
local Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Collect Azure Ember",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.Collect_Ember = Value
end)
spawn(function()
    while wait(.1) do
        if _G.Collect_Ember then
            pcall(function()
                if workspace:WaitForChild("AttachedAzureEmber") or workspace:WaitForChild("EmberTemplate") then
                    notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                else
                    _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
                    replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
                end
            end)
        end
    end
end)
local Q = Tabs.SeaEvent:AddToggle("Q", {
    Title = "Auto Trade Azure Ember",
    Description = "",
    Default = false
})
Q:OnChanged(function(Value)
    _G.Trade_Ember = Value
end)
spawn(function()
    while wait(.1) do
        if _G.Trade_Ember then
            pcall(function()
                if workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island", true) then
                    replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                end
            end)
        end
    end
end)
Tabs.SeaEvent:AddButton({
    Title = "Trade Items Azure",
    Description = "",
    Callback = function()
        replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
    end
})
Tabs.SeaEvent:AddButton({
    Title = "Talk with kitsune statue",
    Description = "",
    Callback = function()
        replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
    end
})
