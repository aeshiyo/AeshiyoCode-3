local Akiri = loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/Librarys/Akiri/Akiri.lua"))()

local Window = Akiri:CreateWindow({
    Title = "Aeshiyo MM2",
    SubTitle = "by AeshiyoCode",
    Size = UDim2.new(0, 500, 0, 400),
    TabWidth = 160
})

local MainTab = Window:CreateTab("Основное")
local CombatTab = Window:CreateTab("Комбат")
local VisualTab = Window:CreateTab("Визуалы")
local SettingsTab = Window:CreateTab("Настройки")

MainTab:CreateSection("Персонаж")
CombatTab:CreateSection("Оружие")
VisualTab:CreateSection("ESP")

MainTab:CreateButton({
    Name = "Телепорт к месту",
    Callback = function()
    end
})

CombatTab:CreateToggle({
    Name = "Авто-аим",
    Default = false,
    Callback = function(Value)
    end
})

VisualTab:CreateToggle({
    Name = "Игроки через стены",
    Default = false,
    Callback = function(Value)
    end
})

SettingsTab:CreateKeybind({
    Name = "Открыть меню",
    Default = Enum.KeyCode.RightControl,
    Callback = function(Key)
        Window:Toggle(Key)
    end
})

SettingsTab:CreateColorpicker({
    Name = "Цвет интерфейса",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        Window:ChangeTheme(Value)
    end
})
