-- Создаём базовое меню без HttpGet
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "TeamFuckshitMenu"

-- Фрейм меню
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui

-- Заголовок
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
print("Team Fuckshit Apocalypse loaded with built-in UI, no HttpGet bullshit! le le le")
