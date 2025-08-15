local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PinkMenu"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
MainFrame.BorderColor3 = Color3.fromRGB(220, 20, 60)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 400)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

local TabButtons = Instance.new("Frame")
TabButtons.Name = "TabButtons"
TabButtons.Parent = MainFrame
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(1, 0, 0, 40)

local tabs = {"Main", "Visual", "Player", "Teleport", "Target", "Animations", "Settings"}

for i, tabName in ipairs(tabs) do
    local tab = Instance.new("TextButton")
    tab.Name = tabName.."Tab"
    tab.Parent = TabButtons
    tab.Size = UDim2.new(1/#tabs, -2, 1, 0)
    tab.Position = UDim2.new((i-1)/#tabs, 0, 0, 0)
    tab.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
    tab.Text = tabName
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 14
    tab.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = tab
end

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Parent = MainFrame
ContentArea.BackgroundTransparency = 1
ContentArea.Position = UDim2.new(0, 10, 0, 50)
ContentArea.Size = UDim2.new(1, -20, 1, -60)

local LeftColumn = Instance.new("Frame")
LeftColumn.Name = "LeftColumn"
LeftColumn.Parent = ContentArea
LeftColumn.BackgroundTransparency = 1
LeftColumn.Size = UDim2.new(0.5, -5, 1, 0)
LeftColumn.Position = UDim2.new(0, 0, 0, 0)

for i = 1, 3 do
    local panel = Instance.new("Frame")
    panel.Name = "Panel_"..i
    panel.Parent = LeftColumn
    panel.Size = UDim2.new(1, 0, 0.3, -10)
    panel.Position = UDim2.new(0, 0, (i-1)*0.3, 0)
    panel.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
    panel.BorderColor3 = Color3.fromRGB(220, 20, 60)
    panel.BorderSizePixel = 2
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = panel
end

local RightColumn = Instance.new("Frame")
RightColumn.Name = "RightColumn"
RightColumn.Parent = ContentArea
RightColumn.BackgroundTransparency = 1
RightColumn.Size = UDim2.new(0.5, -5, 1, 0)
RightColumn.Position = UDim2.new(0.5, 5, 0, 0)

local smallPanel = Instance.new("Frame")
smallPanel.Name = "SmallPanel"
smallPanel.Parent = RightColumn
smallPanel.Size = UDim2.new(1, 0, 0.2, -10)
smallPanel.Position = UDim2.new(0, 0, 0, 0)
smallPanel.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
smallPanel.BorderColor3 = Color3.fromRGB(220, 20, 60)
smallPanel.BorderSizePixel = 2

local corner1 = Instance.new("UICorner")
corner1.CornerRadius = UDim.new(0, 4)
corner1.Parent = smallPanel

for i = 1, 2 do
    local panel = Instance.new("Frame")
    panel.Name = "Panel_"..(i+3)
    panel.Parent = RightColumn
    panel.Size = UDim2.new(1, 0, 0.4, -10)
    panel.Position = UDim2.new(0, 0, 0.2 + (i-1)*0.4, 0)
    panel.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
    panel.BorderColor3 = Color3.fromRGB(220, 20, 60)
    panel.BorderSizePixel = 2
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = panel
end

local function toggleMenu()
    MainFrame.Visible = not MainFrame.Visible
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        toggleMenu()
    end
end)
