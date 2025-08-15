local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Settings = {
    Aimbot = {
        Enabled = false,
        FOV = 90,
        Smoothness = 10,
        Keybind = Enum.UserInputType.MouseButton2,
        TeamCheck = false,
        WallCheck = false,
        LockPart = "Head"
    },
    ESP = {
        Enabled = false,
        Box = false,
        Name = true,
        Distance = true
    },
    Visuals = {
        Info = true
    }
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PhantomMenu"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 450)

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
TabButtons.Size = UDim2.new(1, 0, 0, 40)

local tabs = {"Main", "Visual", "Aimbot"}

for i, tabName in ipairs(tabs) do
    local tab = Instance.new("TextButton")
    tab.Name = tabName.."Tab"
    tab.Parent = TabButtons
    tab.Size = UDim2.new(1/#tabs, -2, 1, 0)
    tab.Position = UDim2.new((i-1)/#tabs, 0, 0, 0)
    tab.BackgroundColor3 = Color3.fromRGB(50, 35, 75)
    tab.Text = tabName
    tab.TextColor3 = Color3.fromRGB(200, 180, 220)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 14
end

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Parent = MainFrame
ContentArea.BackgroundTransparency = 1
ContentArea.Position = UDim2.new(0, 10, 0, 45)
ContentArea.Size = UDim2.new(1, -20, 1, -50)

local MainContent = Instance.new("ScrollingFrame")
MainContent.Name = "MainContent"
MainContent.Parent = ContentArea
MainContent.Size = UDim2.new(1, 0, 1, 0)
MainContent.BackgroundTransparency = 1
MainContent.ScrollBarThickness = 3

local AimbotContent = Instance.new("ScrollingFrame")
AimbotContent.Name = "AimbotContent"
AimbotContent.Parent = ContentArea
AimbotContent.Size = UDim2.new(1, 0, 1, 0)
AimbotContent.BackgroundTransparency = 1
AimbotContent.Visible = false
AimbotContent.ScrollBarThickness = 3

local VisualContent = Instance.new("ScrollingFrame")
VisualContent.Name = "VisualContent"
VisualContent.Parent = ContentArea
VisualContent.Size = UDim2.new(1, 0, 1, 0)
VisualContent.BackgroundTransparency = 1
VisualContent.Visible = false
VisualContent.ScrollBarThickness = 3

local function CreateToggle(parent, name, pos, settingTable, settingName)
    local toggle = Instance.new("TextButton")
    toggle.Name = name
    toggle.Parent = parent
    toggle.Size = UDim2.new(1, 0, 0, 30)
    toggle.Position = pos
    toggle.BackgroundColor3 = Color3.fromRGB(50, 35, 75)
    toggle.Text = name
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Font = Enum.Font.Gotham
    toggle.TextSize = 13
    
    local status = Instance.new("Frame")
    status.Name = "Status"
    status.Parent = toggle
    status.Size = UDim2.new(0, 15, 0, 15)
    status.Position = UDim2.new(0.9, -15, 0.5, -7.5)
    status.BackgroundColor3 = Settings[settingTable][settingName] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    
    toggle.MouseButton1Click:Connect(function()
        Settings[settingTable][settingName] = not Settings[settingTable][settingName]
        status.BackgroundColor3 = Settings[settingTable][settingName] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
    
    return toggle
end

local function CreateSlider(parent, name, pos, min, max, default, settingTable, settingName)
    local slider = Instance.new("Frame")
    slider.Name = name
    slider.Parent = parent
    slider.Size = UDim2.new(1, 0, 0, 40)
    slider.Position = pos
    slider.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel")
    label.Parent = slider
    label.Size = UDim2.new(1, 0, 0, 15)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name..": "..Settings[settingTable][settingName]
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Parent = slider
    track.Size = UDim2.new(1, 0, 0, 4)
    track.Position = UDim2.new(0, 0, 0, 20)
    track.BackgroundColor3 = Color3.fromRGB(50, 35, 75)
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Parent = track
    fill.Size = UDim2.new((Settings[settingTable][settingName] - min)/(max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(150, 100, 200)
    
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Parent = track
    button.Size = UDim2.new(0, 10, 0, 10)
    button.Position = UDim2.new((Settings[settingTable][settingName] - min)/(max - min), -5, 0.5, -5)
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = ""
    
    local dragging = false
    button.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local x = math.clamp((input.Position.X - track.AbsolutePosition.X)/track.AbsoluteSize.X, 0, 1)
            fill.Size = UDim2.new(x, 0, 1, 0)
            button.Position = UDim2.new(x, -5, 0.5, -5)
            local value = math.floor(min + (max - min) * x)
            Settings[settingTable][settingName] = value
            label.Text = name..": "..value
        end
    end)
    
    return slider
end

CreateToggle(MainContent, "ESP Enabled", UDim2.new(0, 0, 0, 0), "ESP", "Enabled")
CreateToggle(MainContent, "Box ESP", UDim2.new(0, 0, 0, 35), "ESP", "Box")
CreateToggle(MainContent, "Name ESP", UDim2.new(0, 0, 0, 70), "ESP", "Name")
CreateToggle(MainContent, "Distance ESP", UDim2.new(0, 0, 0, 105), "ESP", "Distance")

CreateToggle(AimbotContent, "Aimbot Enabled", UDim2.new(0, 0, 0, 0), "Aimbot", "Enabled")
CreateToggle(AimbotContent, "Team Check", UDim2.new(0, 0, 0, 35), "Aimbot", "TeamCheck")
CreateToggle(AimbotContent, "Wall Check", UDim2.new(0, 0, 0, 70), "Aimbot", "WallCheck")
CreateSlider(AimbotContent, "FOV", UDim2.new(0, 0, 0, 105), 1, 360, 90, "Aimbot", "FOV")
CreateSlider(AimbotContent, "Smoothness", UDim2.new(0, 0, 0, 150), 1, 20, 10, "Aimbot", "Smoothness")

for i, tab in ipairs(tabs) do
    local tabButton = MainFrame:FindFirstChild(tab.."Tab")
    if tabButton then
        tabButton.MouseButton1Click:Connect(function()
            MainContent.Visible = (tab == "Main")
            VisualContent.Visible = (tab == "Visual")
            AimbotContent.Visible = (tab == "Aimbot")
        end)
    end
end

local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Color = Color3.fromRGB(150, 100, 200)
FOVCircle.Thickness = 1
FOVCircle.Transparency = 1
FOVCircle.Filled = false

local function GetClosestPlayer()
    if not Settings.Aimbot.Enabled then return nil end
    
    local closestPlayer = nil
    local shortestDistance = Settings.Aimbot.FOV
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local head = player.Character:FindFirstChild(Settings.Aimbot.LockPart)
            
            if humanoid and humanoid.Health > 0 and head then
                if Settings.Aimbot.TeamCheck and player.Team == LocalPlayer.Team then
                    continue
                end
                
                local screenPoint, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local mousePos = UserInputService:GetMouseLocation()
                    local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - mousePos).Magnitude
                    
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

local target = nil
local isAiming = false

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Settings.Aimbot.Keybind then
        isAiming = true
        target = GetClosestPlayer()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Settings.Aimbot.Keybind then
        isAiming = false
        target = nil
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Visible = Settings.Aimbot.Enabled
    FOVCircle.Radius = Settings.Aimbot.FOV
    FOVCircle.Position = UserInputService:GetMouseLocation()
    
    if isAiming and target and target.Character then
        local head = target.Character:FindFirstChild(Settings.Aimbot.LockPart)
        if head then
            local screenPoint = Camera:WorldToViewportPoint(head.Position)
            local mousePos = UserInputService:GetMouseLocation()
            local targetPos = Vector2.new(screenPoint.X, screenPoint.Y)
            
            local delta = (targetPos - mousePos)
            local smoothDelta = delta / Settings.Aimbot.Smoothness
            
            mousemoverel(smoothDelta.X, smoothDelta.Y)
        end
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
