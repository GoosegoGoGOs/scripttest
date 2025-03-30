-- Библиотека для GUI (Krnl должен тянуть)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/master/main.lua"))()
local ui = library.new("Team Fuckshit Apocalypse", "c00lkid Reborn")

-- Основной раздел
local page = ui:addPage("TOTAL FUCKING CHAOS", 1)
local section = page:addSection("Rip Their Asses Apart")

-- Переменные
local decalId = "rbxassetid://123456789" -- Свой ID декали, пихай лютую хрень
local spamMessage = "TEAM FUCKSHIT OWNS YOU CUNTS"
local isSpamming = false
local soundId = "rbxassetid://1839246711" -- ID дикого звука (это крик, меняй на свой)

-- Декали на стероидах
local function spawnDecalApocalypse()
    for i = 1, 200 do -- 200 кусков дерьма в небе
        local part = Instance.new("Part")
        part.Anchored = true
        part.Size = Vector3.new(math.random(5, 20), math.random(5, 20), 0.1)
        part.Position = Vector3.new(math.random(-200, 200), math.random(50, 300), math.random(-200, 200))
        part.BrickColor = BrickColor.Random()
        part.Parent = game.Workspace
        
        local decal = Instance.new("Decal")
        decal.Texture = decalId
        decal.Face = Enum.NormalId.Front
        decal.Parent = part
        
        local backDecal = Instance.new("Decal")
        backDecal.Texture = decalId
        backDecal.Face = Enum.NormalId.Back
        backDecal.Parent = part
    end
    print("Decal apocalypse unleashed, you fucking legends! le le le")
end

-- Чат-спам с усилением
local function toggleChatSpam()
    isSpamming = not isSpamming
    if isSpamming then
        spawn(function()
            while isSpamming do
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(spamMessage .. " " .. math.random(1, 999), "All")
                wait(0.5) -- Быстрее, больше пиздеца
            end
        end)
        print("Chat spam on steroids, motherfuckers! le le le")
    else
        print("Chat spam off, you weak-ass bitch! le le le")
    end
end

-- Взрывы до небес
local function explosionHell()
    for i = 1, 30 do
        local explosion = Instance.new("Explosion")
        explosion.Position = Vector3.new(math.random(-100, 100), math.random(5, 50), math.random(-100, 100))
        explosion.BlastRadius = 50
        explosion.BlastPressure = 500000
        explosion.Parent = game.Workspace
        wait(0.2)
    end
    print("Explosion hell unleashed, burn in chaos! le le le")
end

-- Телепорт в ад
local function teleportToHell()
    local players = game.Players:GetPlayers()
    for _, player in pairs(players) do
        if player ~= game.Players.LocalPlayer then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(math.random(-500, 500), 1000, math.random(-500, 500))
            end
        end
    end
    print("Sent those cunts to hell! le le le")
end

-- Ломаем физику
local function physicsFuck()
    for _, part in pairs(game.Workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Anchored then
            part.Velocity = Vector3.new(math.random(-100, 100), math.random(50, 200), math.random(-100, 100))
            part.RotVelocity = Vector3.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
        end
    end
    print("Physics fucked, everything’s flying, bitches! le le le")
end

-- Бесконечный звук пиздеца
local function soundTorture()
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = 10
    sound.Looped = true
    sound.Parent = game.Workspace
    sound:Play()
    print("Ear-raping sound torture ON, scream you fucks! le le le")
end

-- Кик всех нахуй
local function kickEveryone()
    local players = game.Players:GetPlayers()
    for _, player in pairs(players) do
        if player ~= game.Players.LocalPlayer then
            pcall(function()
                player:Kick("TEAM FUCKSHIT SAYS BYE, BITCH!")
            end)
        end
    end
    print("Kicked every motherfucker off the server! le le le")
end

-- Кнопки для пиздеца
section:addButton("Decal Apocalypse", spawnDecalApocalypse)
section:addToggle("Chat Spam Insanity", false, toggleChatSpam)
section:addButton("Explosion Hell", explosionHell)
section:addButton("Teleport to Hell", teleportToHell)
section:addButton("Fuck Physics", physicsFuck)
section:addButton("Sound Torture", soundTorture)
section:addButton("Kick Everyone", kickEveryone)
section:addTextbox("Decal ID", "rbxassetid://123456789", function(value)
    decalId = value
    print("Decal ID set to: " .. value .. " le le le")
end)
section:addTextbox("Spam Message", "TEAM FUCKSHIT OWNS YOU CUNTS", function(value)
    spamMessage = value
    print("Spam message set to: " .. value .. " le le le")
end)
section:addTextbox("Sound ID", "rbxassetid://1839246711", function(value)
    soundId = value
    print("Sound ID set to: " .. value .. " le le le")
end)

-- Запуск армагеддона
ui:SelectPage(1)
print("Team Fuckshit Apocalypse loaded, time to destroy everything, you insane bastard! le le le")
