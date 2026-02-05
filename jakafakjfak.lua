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
            if _G.SailBoat_Hydra  or _G.HighestMirage or _G.HCM or _G.PGB or _G.Addealer or _G.TPNpc or _G.TwinHook or _G.FindMirage or _G.FarmChestM or _G.Shark or _G.TerrorShark or _G.Piranha or _G.MobCrew or _G.SeaBeast1 or _G.FishBoat or _G.AutoPole or _G.AutoPoleV2 or _G.Auto_SuperHuman or _G.AutoDeathStep or _G.Auto_SharkMan_Karate or _G.Auto_Electric_Claw or _G.AutoDragonTalon or _G.Auto_Def_DarkCoat or _G.Auto_God_Human or _G.Auto_Tushita or _G.AutoMatSoul or _G.AutoKenVTWO or _G.AutoSerpentBow or _G.AutoFMon or _G.Auto_Soul_Guitar or _G.TPGEAR or _G.AutoSaw or _G.AutoTridentW2 or _G.Auto_StartRaid or _G.AutoEvoRace or _G.AutoGetQuestBounty or _G.MarinesCoat or _G.TravelDres or _G.Defeating or _G.DummyMan or _G.Auto_Yama or _G.Auto_SwanGG or _G.SwanCoat or _G.AutoEcBoss or _G.Auto_Mink or _G.Auto_Human or _G.Auto_Skypiea or _G.Auto_Fish or _G.CDK_TS or _G.CDK_YM or _G.CDK or _G.AutoFarmGodChalice or _G.AutoFistDarkness or _G.AutoMiror or _G.Teleport or _G.AutoKilo or _G.AutoGetUsoap or _G.Praying or _G.TryLucky or _G.AutoColShad or _G.AutoUnHaki or _G.Auto_DonAcces or _G.AutoRipIngay or _G.DragoV3 or _G.DragoV1 or _G.SailBoats or NextIs or _G.FarmGodChalice or _G.IceBossRen  or _G.Lvthan or _G.beasthunter or _G.DangerLV or  _G.tweenKitsune  or _G.AutofindKitIs  or _G.TwFruits or _G.tweenKitShrine or _G.tweenShrine then

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
    SeaEvent = Window:AddTab({ Title = "Tab Sea Events", Icon = "anchor" }),
    Mirage = Window:AddTab({ Title = "Tab Mirage RaceV4", Icon = "moon" }),

   
}

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
                        if _G.SailBoats or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then
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
