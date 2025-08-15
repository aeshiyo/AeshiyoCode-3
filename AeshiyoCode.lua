local Akiri = loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/Librarys/Akiri/Akiri.lua"))()

local Window = Akiri:CreateWindow({
    Title = "Aeshiyo Murder Mystery II", 
    SubTitle = "by AeshiyoCode",
    Size = UDim2.new(0, 500, 0, 350)
})

local MainTab = Window:CreateTab("Главная")
local VisualsTab = Window:CreateTab("Визуалы") 
local SettingsTab = Window:CreateTab("Настройки")

local EspSection = VisualsTab:CreateSection("ESP")
local PlayerSection = MainTab:CreateSection("Игрок")

MainTab:CreateButton({
    Name = "Тест функция",
    Callback = function()
    end
})

VisualsTab:CreateToggle({
    Name = "Включить ESP", 
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
