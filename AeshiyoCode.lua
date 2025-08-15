local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CleanMenu"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 250)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

local TabButtons = Instance.new("Frame")
TabButtons.Name = "TabButtons"
TabButtons.Parent = MainFrame
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(1, 0, 0, 30)
TabButtons.Position = UDim2.new(0, 0, 0, 5)

local tabs = {"Main", "Visual", "Player", "Teleport", "Target", "Animations", "Settings"}

for i, tabName in ipairs(tabs) do
    local tab = Instance.new("TextButton")
    tab.Name = tabName.."Tab"
    tab.Parent = TabButtons
    tab.Size = UDim2.new(1/#tabs, -2, 1, 0)
    tab.Position = UDim2.new((i-1)/#tabs, 0, 0, 0)
    tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tab.Text = tabName
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.Font = Enum.Font.Gotham
    tab.TextSize = 12
    tab.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = tab
    
    tab.MouseEnter:Connect(function()
        TweenService:Create(tab, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)
    
    tab.MouseLeave:Connect(function()
        TweenService:Create(tab, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
    end)
end

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Parent = MainFrame
ContentArea.BackgroundTransparency = 1
ContentArea.Position = UDim2.new(0, 10, 0, 40)
ContentArea.Size = UDim2.new(1, -20, 1, -50)

local function toggleMenu()
    MainFrame.Visible = not MainFrame.Visible
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        toggleMenu()
    end
end)
