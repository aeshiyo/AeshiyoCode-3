local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DarkPurpleMenu"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
MainFrame.BorderColor3 = Color3.fromRGB(90, 50, 130)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 400)

local dragToggle = nil
local dragStart = nil
local startPos = nil

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragToggle then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local TabButtons = Instance.new("Frame")
TabButtons.Name = "TabButtons"
TabButtons.Parent = MainFrame
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(0, 100, 1, 0)

local tabs = {"MAIN", "VISUAL", "PLAYER", "TELEPORT", "TARGET", "ANIM", "SETTINGS"}

for i, tabName in ipairs(tabs) do
    local tab = Instance.new("TextButton")
    tab.Name = tabName.."Tab"
    tab.Parent = TabButtons
    tab.Size = UDim2.new(1, 0, 0, 40)
    tab.Position = UDim2.new(0, 0, 0, (i-1)*40)
    tab.BackgroundColor3 = Color3.fromRGB(50, 30, 70)
    tab.Text = tabName
    tab.TextColor3 = Color3.fromRGB(200, 180, 220)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 12
    tab.BorderSizePixel = 0
    
    local highlight = Instance.new("Frame")
    highlight.Name = "Highlight"
    highlight.Parent = tab
    highlight.Size = UDim2.new(0, 3, 1, 0)
    highlight.Position = UDim2.new(0, 0, 0, 0)
    highlight.BackgroundColor3 = Color3.fromRGB(150, 100, 200)
    highlight.BorderSizePixel = 0
    highlight.Visible = false
    
    tab.MouseEnter:Connect(function()
        highlight.Visible = true
        tab.BackgroundColor3 = Color3.fromRGB(70, 50, 90)
    end)
    
    tab.MouseLeave:Connect(function()
        highlight.Visible = false
        tab.BackgroundColor3 = Color3.fromRGB(50, 30, 70)
    end)
end

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Parent = MainFrame
ContentArea.BackgroundColor3 = Color3.fromRGB(40, 25, 60)
ContentArea.BorderSizePixel = 0
ContentArea.Position = UDim2.new(0, 105, 0, 5)
ContentArea.Size = UDim2.new(1, -110, 1, -10)

local function toggleMenu()
    MainFrame.Visible = not MainFrame.Visible
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        toggleMenu()
    end
end)
