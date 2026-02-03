

--// Services & Vars
local TweenService = game:GetService("TweenService")
local plr = game.Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")

shouldTween = true

--// TP FUNCTIONS
_tp = function(target)
    local char = plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local hrp = char.HumanoidRootPart
    local hum = char:FindFirstChildOfClass("Humanoid")

    local dist = (target.Position - hrp.Position).Magnitude
    local tween = TweenService:Create(
        hrp,
        TweenInfo.new(dist / 300, Enum.EasingStyle.Linear),
        { CFrame = target }
    )

    if hum and hum.Sit then
        hrp.CFrame = CFrame.new(hrp.Position.X, target.Y, hrp.Position.Z)
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

TeleportToTarget = function(cf)
    _tp(cf)
end

notween = function(cf)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        plr.Character.HumanoidRootPart.CFrame = cf
    end
end

--// CHECK FUNCTIONS
CheckBoat = function()
    for _,v in pairs(workspace.Boats:GetChildren()) do
        if tostring(v.Owner.Value) == plr.Name then
            return v
        end
    end
    return false
end

CheckEnemiesBoat = function()
    for _,v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == "FishBoat" and v:FindFirstChild("Health") and v.Health.Value > 0 then
            return true
        end
    end
    return false
end

CheckPirateGrandBrigade = function()
    for _,v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade")
        and v:FindFirstChild("Health") and v.Health.Value > 0 then
            return true
        end
    end
    return false
end

CheckTerrorShark = function()
    for _,v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == "Terrorshark" and Attack.Alive(v) then
            return true
        end
    end
    return false
end

--// ================= FLUENT UI =================
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/SleepyCattStar/CattStarTemp/refs/heads/main/Main.lua))()

local SeaEventTab = Window:AddTab({
    Title = "Sea Event",
    Icon = "waves"
})

SeaEventTab:AddSection("🦊 Kitsune Island / Event")

local Status = SeaEventTab:AddParagraph({
    Title = "Kitsune Island Status",
    Content = "Checking..."
})

task.spawn(function()
    while task.wait(0.2) do
        if workspace.Map:FindFirstChild("KitsuneIsland")
        or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
            Status:Set({
                Title = "Kitsune Island Status",
                Content = "Kitsune Island : TRUE"
            })
        else
            Status:Set({
                Title = "Kitsune Island Status",
                Content = "Kitsune Island : FALSE"
            })
        end
    end
end)

--// AUTO FIND ISLAND
SeaEventTab:AddToggle("AutoFindKitsune", {
    Title = "Auto Find Kitsune Island",
    Default = false
}):OnChanged(function(v)
    _G.AutofindKitIs = v
end)

task.spawn(function()
    while task.wait() do
        if _G.AutofindKitIs then
            pcall(function()
                local island = workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true)
                if not island then
                    local boat = CheckBoat()
                    if not boat then
                        local buyBoatCF = CFrame.new(-16927.451, 9.086, 433.864)
                        TeleportToTarget(buyBoatCF)
                        if plr.Character
                        and (buyBoatCF.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                        end
                    else
                        if not plr.Character.Humanoid.Sit then
                            _tp(boat.VehicleSeat.CFrame * CFrame.new(0,1,0))
                        else
                            local target = CFrame.new(-10000000,31,37016.25)
                            repeat
                                task.wait()
                                if CheckEnemiesBoat()
                                or CheckTerrorShark()
                                or CheckPirateGrandBrigade() then
                                    _tp(target * CFrame.new(0,120,0))
                                else
                                    _tp(target)
                                end
                            until not _G.AutofindKitIs
                            or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
                            or not plr.Character.Humanoid.Sit
                            plr.Character.Humanoid.Sit = false
                        end
                    end
                else
                    _tp(island.CFrame * CFrame.new(0,500,0))
                end
            end)
        end
    end
end)

--// AUTO SHRINE
SeaEventTab:AddToggle("AutoShrine", {
    Title = "Auto Teleport to Shrine",
    Default = false
}):OnChanged(function(v)
    _G.tweenShrine = v
end)

task.spawn(function()
    while task.wait(0.1) do
        if _G.tweenShrine then
            pcall(function()
                local island = workspace.Map:FindFirstChild("KitsuneIsland")
                or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
                if not island then return end

                local shrine = island:FindFirstChild("ShrineActive")
                if shrine then
                    for _,v in ipairs(shrine:GetDescendants()) do
                        if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                            replicated.Modules.Net["RE/TouchKitsuneStatue"]:FireServer()
                            repeat
                                task.wait()
                                _tp(v.CFrame * CFrame.new(0,2,0))
                            until not _G.tweenShrine
                        end
                    end
                else
                    _tp(island.CFrame * CFrame.new(0,500,0))
                end
            end)
        end
    end
end)

--// AUTO COLLECT EMBER
SeaEventTab:AddToggle("CollectEmber", {
    Title = "Auto Collect Azure Ember",
    Default = false
}):OnChanged(function(v)
    _G.Collect_Ember = v
end)

task.spawn(function()
    while task.wait(0.1) do
        if _G.Collect_Ember then
            pcall(function()
                if workspace:FindFirstChild("AttachedAzureEmber")
                or workspace:FindFirstChild("EmberTemplate") then
                    notween(workspace.EmberTemplate.Part.CFrame)
                else
                    local island = workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
                    if island then
                        _tp(island.CFrame * CFrame.new(0,500,0))
                        replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
                    end
                end
            end)
        end
    end
end)

--// AUTO TRADE EMBER
SeaEventTab:AddToggle("TradeEmber", {
    Title = "Auto Trade Azure Ember",
    Default = false
}):OnChanged(function(v)
    _G.Trade_Ember = v
end)

task.spawn(function()
    while task.wait(0.2) do
        if _G.Trade_Ember then
            if workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true) then
                replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
            end
        end
    end
end)

--// BUTTONS
SeaEventTab:AddButton({
    Title = "Trade Items (Azure)",
    Callback = function()
        replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
    end
})

SeaEventTab:AddButton({
    Title = "Talk to Kitsune Statue",
    Callback = function()
        replicated.Modules.Net["RE/TouchKitsuneStatue"]:FireServer()
    end
})
