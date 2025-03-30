-- Создаём меню
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "TeamFuckshitMenu"

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
Title.Text = "Team Fuckshit Apocalypse"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Frame

-- Переменные
local decalId = "rbxassetid://123456789"
local spamMessage = "TEAM FUCKSHIT OWNS YOU CUNTS"
local isSpamming = false

-- Функция для кнопок
local function createButton(name, posY, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.8, 0, 0, 40)
    Button.Position = UDim2.new(0.1, 0, 0, posY)
    Button.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 18
    Button.Font = Enum.Font.SourceSans
    Button.Parent = Frame
    Button.MouseButton1Click:Connect(callback)
end

-- Функция для текстовых полей
local function createTextBox(name, posY, default, callback)
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.8, 0, 0, 40)
    TextBox.Position = UDim2.new(0.1, 0, 0, posY)
    TextBox.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    TextBox.Text = default
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 18
    TextBox.Font = Enum.Font.SourceSans
    TextBox.Parent = Frame
    TextBox.FocusLost:Connect(function()
        callback(TextBox.Text)
    end)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 100, 0, 20)
    Label.Position = UDim2.new(0.1, 0, 0, posY - 20)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 14
    Label.Parent = Frame
end

-- Декали
local function spawnDecalApocalypse()
    print("Trying to spawn decals... le le le")
    if not game.Workspace then
        print("Workspace is fucked, can’t spawn shit! le le le")
        return
    end
    local success, err = pcall(function()
        for i = 1, 10 do -- Уменьшил до 10 для теста
            local part = Instance.new("Part")
            part.Anchored = true
            part.Size = Vector3.new(5, 5, 0.1)
            part.Position = Vector3.new(math.random(-20, 20), 50, math.random(-20, 20))
            part.BrickColor = BrickColor.Random()
            part.Parent = game.Workspace
            print("Spawned part " .. i .. " le le le")
            local decal = Instance.new("Decal")
            decal.Texture = decalId
            decal.Face = Enum.NormalId.Front
            decal.Parent = part
            local backDecal = Instance.new("Decal")
            backDecal.Texture = decalId
            backDecal.Face = Enum.NormalId.Back
            backDecal.Parent = part
        end
    end)
    if success then
        print("Decal apocalypse unleashed, you fucking legends! le le le")
    else
        print("Decal spawn failed: " .. err .. " le le le")
    end
end

-- Чат-спам
local function toggleChatSpam()
    print("Trying to toggle chat spam... le le le")
    local replicated = game:GetService("ReplicatedStorage")
    local chatEvent = replicated:FindFirstChild("DefaultChatSystemChatEvents")
    if not chatEvent then
        print("No DefaultChatSystemChatEvents, chat fucked! le le le")
        return
    end
    local sayMessage = chatEvent:FindFirstChild("SayMessageRequest")
    if not sayMessage then
        print("No SayMessageRequest, spam dead! le le le")
        return
    end
    isSpamming = not isSpamming
    if isSpamming then
        spawn(function()
            while isSpamming do
                local success, err = pcall(function()
                    sayMessage:FireServer(spamMessage .. " " .. math.random(1, 999), "All")
                end)
                if not success then
                    print("Chat spam failed: " .. err .. " le le le")
                end
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
    print("Trying to spawn explosions... le le le")
    if not game.Workspace then
        print("Workspace is fucked, no booms! le le le")
        return
    end
    local success, err = pcall(function()
        for i = 1, 5 do -- Уменьшил до 5 для теста
            local explosion = Instance.new("Explosion")
            explosion.Position = Vector3.new(math.random(-10, 10), 10, math.random(-10, 10))
            explosion.BlastRadius = 20
            explosion.BlastPressure = 100000
            explosion.Parent = game.Workspace
            print("Explosion " .. i .. " spawned le le le")
            wait(0.2)
        end
    end)
    if success then
        print("Explosion hell unleashed, burn in chaos! le le le")
    else
        print("Explosion spawn failed: " .. err .. " le le le")
    end
end

-- Создаём элементы меню
createButton("Decal Apocalypse", 60, spawnDecalApocalypse)
createButton("Toggle Chat Spam", 110, toggleChatSpam)
createButton("Explosion Hell", 160, explosionHell)
createTextBox("Decal ID", 210, "rbxassetid://123456789", function(value)
    decalId = value
    print("Decal ID set to: " .. value .. " le le le")
end)
createTextBox("Spam Message", 290, "TEAM FUCKSHIT OWNS YOU CUNTS", function(value)
    spamMessage = value
    print("Spam message set to: " .. value .. " le le le")
end)

-- Сообщение о запуске
print("Team Fuckshit Apocalypse loaded with debug, let’s find the fuckup! le le le")
