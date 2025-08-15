local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MinecraftMenu"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 420, 0, 260)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 0) -- Углы без скругления как в Minecraft
UICorner.Parent = MainFrame

local TabButtons = Instance.new("Frame")
TabButtons.Name = "TabButtons"
TabButtons.Parent = MainFrame
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(1, -10, 0, 32)
TabButtons.Position = UDim2.new(0, 5, 0, 5)

local tabs = {"Main", "Visual", "Player", "Teleport", "Target", "Animations", "Settings"}
local tabWidth = 1/#tabs

for i, tabName in ipairs(tabs) do
    local tab = Instance.new("TextButton")
    tab.Name = tabName.."Tab"
    tab.Parent = TabButtons
    tab.Size = UDim2.new(tabWidth, -2, 1, 0)
    tab.Position = UDim2.new((i-1)*tabWidth, 0, 0, 0)
    tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tab.Text = " "..tabName.." " -- Добавляем пробелы для лучшего отображения
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.Font = Enum.Font.SourceSansBold -- Близкий к Minecraft шрифт
    tab.TextSize = 14
    tab.TextXAlignment = Enum.TextXAlignment.Center
    tab.BorderSizePixel = 0
    
    -- Стиль кнопок как в Minecraft
    local highlight = Instance.new("Frame")
    highlight.Name = "Highlight"
    highlight.Parent = tab
    highlight.Size = UDim2.new(1, 0, 0, 2)
    highlight.Position = UDim2.new(0, 0, 1, -2)
    highlight.BackgroundColor3 = Color3.fromRGB(85, 255, 85)
    highlight.BorderSizePixel = 0
    highlight.Visible = false
    
    tab.MouseEnter:Connect(function()
        highlight.Visible = true
        tab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    
    tab.MouseLeave:Connect(function()
        highlight.Visible = false
        tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end)
end

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Parent = MainFrame
ContentArea.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ContentArea.BorderColor3 = Color3.fromRGB(60, 60, 60)
ContentArea.BorderSizePixel = 2
ContentArea.Position = UDim2.new(0, 5, 0, 42)
ContentArea.Size = UDim2.new(1, -10, 1, -52)

local function toggleMenu()
    MainFrame.Visible = not MainFrame.Visible
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        toggleMenu()
    end
end)
