--// Murder Mystery 2 Script by (ваше имя) \\--
loadstring(game:HttpGet("https://raw.githubusercontent.com/Raylib/Raylib/main/GUI"))() -- Подключение Raylib GUI

local ESP = {
    Enabled = true,
    MurdererColor = Color3.fromRGB(255, 0, 0), -- Красный
    SheriffColor = Color3.fromRGB(0, 0, 255),   -- Синий
    InnocentColor = Color3.fromRGB(0, 255, 0)   -- Зелёный
}

local Aimbot = {
    Enabled = false,
    Target = nil,
    Smoothness = 0.5
}

-- Создание GUI
local Window = Raylib:CreateWindow({
    Name = "MM2 HUB | V1.0",
    LoadingTitle = "Загрузка...",
    LoadingSubtitle = "Скрипт активируется",
    LoadingIcon = "🌌",
    ConfigurationSaving = true
})

local MainTab = Window:CreateTab("Главная")
local ESPToggle = MainTab:CreateToggle({
    Name = "ESP (Подсветка игроков)",
    CurrentValue = ESP.Enabled,
    Flag = "ESPEnabled",
    Callback = function(Value)
        ESP.Enabled = Value
    end
})

local AimbotToggle = MainTab:CreateToggle({
    Name = "Aimbot (Автонаведение)",
    CurrentValue = Aimbot.Enabled,
    Flag = "AimbotEnabled",
    Callback = function(Value)
        Aimbot.Enabled = Value
    end
})

-- Функция ESP
local function UpdateESP()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local highlight = player.Character:FindFirstChild("Highlight") or Instance.new("Highlight", player.Character)
            highlight.Adornee = player.Character
            
            if player.Backpack:FindFirstChild("Knife") or player.Character:FindFirstChild("Knife") then
                highlight.FillColor = ESP.MurdererColor
            elseif player.Backpack:FindFirstChild("Gun") or player.Character:FindFirstChild("Gun") then
                highlight.FillColor = ESP.SheriffColor
            else
                highlight.FillColor = ESP.InnocentColor
            end
            
            highlight.Enabled = ESP.Enabled
        end
    end
end

-- Функция Aimbot
local function AimAt(target)
    if not target or not target.Character or not target.Character:FindFirstChild("Head") then return end
    local camera = workspace.CurrentCamera
    camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position)
end

-- Основной цикл
game:GetService("RunService").RenderStepped:Connect(function()
    if ESP.Enabled then UpdateESP() end
    if Aimbot.Enabled then
        local closestPlayer = FindClosestPlayer() -- (Нужно дописать логику поиска ближайшего игрока)
        AimAt(closestPlayer)
    end
end)

Raylib:Notify("Скрипт успешно загружен!", "Нажмите Insert, чтобы открыть меню.")
