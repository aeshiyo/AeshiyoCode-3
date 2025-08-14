-- Загрузчик
local LoaderUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local LoadingBar = Instance.new("Frame")
local Progress = Instance.new("Frame")

LoaderUI.Name = "LoaderUI"
LoaderUI.Parent = game:GetService("CoreGui")
LoaderUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = LoaderUI
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.4, 0, 0.45, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 70)

Title.Name = "Title"
Title.Parent = MainFrame
Title.Text = "Onyx Hub Loading..."
Title.TextColor3 = Color3.fromRGB(255, 216, 0)
Title.TextSize = 20
Title.Font = Enum.Font.SourceSansBold
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.1, 0, 0.1, 0)
Title.Size = UDim2.new(0.8, 0, 0, 30)

LoadingBar.Name = "LoadingBar"
LoadingBar.Parent = MainFrame
LoadingBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LoadingBar.BorderSizePixel = 0
LoadingBar.Position = UDim2.new(0.1, 0, 0.7, 0)
LoadingBar.Size = UDim2.new(0.8, 0, 0, 10)

Progress.Name = "Progress"
Progress.Parent = LoadingBar
Progress.BackgroundColor3 = Color3.fromRGB(255, 216, 0)
Progress.BorderSizePixel = 0
Progress.Size = UDim2.new(0, 0, 1, 0)

-- Анимация загрузки
spawn(function()
    for i = 1, 100 do
        Progress.Size = UDim2.new(i/100, 0, 1, 0)
        wait(0.03)
    end
    LoaderUI:Destroy()
    InitESP() -- Запускаем ESP после загрузки
end)

-- Базовая функция ESP
function InitESP()
    local function CreateESP(player)
        local character = player.Character or player.CharacterAdded:Wait()
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.Name = "ESP_"..player.Name
        highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
        highlight.FillTransparency = 0.8
        
        player.CharacterAdded:Connect(function(newChar)
            highlight:Destroy()
            wait(1)
            highlight = Instance.new("Highlight")
            highlight.Parent = newChar
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.8
        end)
    end

    -- ESP для всех игроков
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game:GetService("Players").LocalPlayer then
            CreateESP(player)
        end
    end

    -- ESP для новых игроков
    game:GetService("Players").PlayerAdded:Connect(function(player)
        CreateESP(player)
    end)
end

-- Активация по RightShift
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        InitESP()
    end
end)
