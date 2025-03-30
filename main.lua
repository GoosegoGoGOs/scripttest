-- Пробуем загрузить UI, если падает — пиздец
local success, library = pcall(function()
    return loadstring(game:GetService("HttpService"):HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/master/main.lua"))()
end)
if not success then
    print("UI library fucked up: " .. library .. " le le le")
    return
end

-- Создаём меню
local ui = library.new("Team Fuckshit Apocalypse", "c00lkid Reborn")
local page = ui:addPage("TOTAL FUCKING CHAOS", 1)
local section = page:addSection("Rip Their Asses Apart")

-- Переменные
local decalId = "rbxassetid://123456789"
local spamMessage = "TEAM FUCKSHIT OWNS YOU CUNTS"
local isSpamming = false

-- Декали
local function spawnDecalApocalypse()
    if not game.Workspace then
        print("Workspace is fucked, can’t spawn shit! le le le")
        return
    end
    for i = 1, 200 do
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

-- Чат-спам
local function toggleChatSpam()
    local chatEvent = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
    if not chatEvent or not chatEvent:FindFirstChild("SayMessageRequest") then
        print("Chat system fucked, no spam for you! le le le")
        return
    end
    isSpamming = not isSpamming
    if isSpamming then
        spawn(function()
            while isSpamming do
                pcall(function()
                    chatEvent.SayMessageRequest:FireServer(spamMessage .. " " .. math.random(1, 999), "All")
                end)
                wait(0.5)
            end
        end)
        print("Chat spam on steroids, motherfuckers! le le le")
    else
        print("Chat spam off, you weak-ass bitch! le le le")
    end
end

-- Взрывы
local function explosionHell()
    if not game.Workspace then
        print("Workspace is fucked, no booms! le le le")
        return
    end
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

-- Кнопки
section:addButton("Decal Apocalypse", spawnDecalApocalypse)
section:addToggle("Chat Spam Insanity", false, toggleChatSpam)
section:addButton("Explosion Hell", explosionHell)
section:addTextbox("Decal ID", "rbxassetid://123456789", function(value)
    decalId = value
    print("Decal ID set to: " .. value .. " le le le")
end)
section:addTextbox("Spam Message", "TEAM FUCKSHIT OWNS YOU CUNTS", function(value)
    spamMessage = value
    print("Spam message set to: " .. value .. " le le le")
end)

-- Запуск
ui:SelectPage(1)
print("Team Fuckshit Apocalypse loaded, time to destroy everything, you insane bastard! le le le")
