local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local Settings = {
    Aimbot = {Enabled = false, FOV = 90, Smoothness = 10, Keybind = Enum.UserInputType.MouseButton2},
    ESP = {Enabled = false, Box = false, Name = true, Distance = true, Skeleton = false},
    Movement = {NoClip = false, Speed = 25, JumpPower = 50},
    Visuals = {Info = true}
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PhantomMenu"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromHex("#000000")
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 350)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromHex("#C4B5FD")
UIStroke.Thickness = 1
UIStroke.Parent = MainFrame

local TabButtons = Instance.new("Frame")
TabButtons.Name = "TabButtons"
TabButtons.Parent = MainFrame
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(1, 0, 0, 40)

local MainTab = Instance.new("TextButton")
MainTab.Name = "MainTab"
MainTab.Parent = TabButtons
MainTab.Size = UDim2.new(0.33, -4, 1, 0)
MainTab.Position = UDim2.new(0, 0, 0, 0)
MainTab.BackgroundColor3 = Color3.fromHex("#1E1E1E")
MainTab.Text = "MAIN"
MainTab.TextColor3 = Color3.fromHex("#E2DAFF")
MainTab.Font = Enum.Font.GothamSemibold
MainTab.TextSize = 14
MainTab.BorderSizePixel = 0

local VisualTab = Instance.new("TextButton")
VisualTab.Name = "VisualTab"
VisualTab.Parent = TabButtons
VisualTab.Size = UDim2.new(0.33, -4, 1, 0)
VisualTab.Position = UDim2.new(0.33, 0, 0, 0)
VisualTab.BackgroundColor3 = Color3.fromHex("#1E1E1E")
VisualTab.Text = "VISUAL"
VisualTab.TextColor3 = Color3.fromHex("#E2DAFF")
VisualTab.Font = Enum.Font.GothamSemibold
VisualTab.TextSize = 14
VisualTab.BorderSizePixel = 0

local PlayerTab = Instance.new("TextButton")
PlayerTab.Name = "PlayerTab"
PlayerTab.Parent = TabButtons
PlayerTab.Size = UDim2.new(0.33, -4, 1, 0)
PlayerTab.Position = UDim2.new(0.66, 0, 0, 0)
PlayerTab.BackgroundColor3 = Color3.fromHex("#1E1E1E")
PlayerTab.Text = "PLAYER"
PlayerTab.TextColor3 = Color3.fromHex("#E2DAFF")
PlayerTab.Font = Enum.Font.GothamSemibold
PlayerTab.TextSize = 14
PlayerTab.BorderSizePixel = 0

local TabContent = Instance.new("Frame")
TabContent.Name = "TabContent"
TabContent.Parent = MainFrame
TabContent.BackgroundTransparency = 1
TabContent.Position = UDim2.new(0, 10, 0, 45)
TabContent.Size = UDim2.new(1, -20, 1, -50)

local MainContent = Instance.new("ScrollingFrame")
MainContent.Name = "MainContent"
MainContent.Parent = TabContent
MainContent.Size = UDim2.new(1, 0, 1, 0)
MainContent.BackgroundTransparency = 1
MainContent.ScrollBarThickness = 3
MainContent.ScrollBarImageColor3 = Color3.fromHex("#A78BFA")

local AimbotSection = Instance.new("Frame")
AimbotSection.Name = "AimbotSection"
AimbotSection.Parent = MainContent
AimbotSection.Size = UDim2.new(1, 0, 0, 150)
AimbotSection.BackgroundTransparency = 1

local AimbotLabel = Instance.new("TextLabel")
AimbotLabel.Parent = AimbotSection
AimbotLabel.Size = UDim2.new(1, 0, 0, 20)
AimbotLabel.Position = UDim2.new(0, 0, 0, 0)
AimbotLabel.BackgroundTransparency = 1
AimbotLabel.Text = "AIMBOT"
AimbotLabel.TextColor3 = Color3.fromHex("#E2DAFF")
AimbotLabel.Font = Enum.Font.GothamBold
AimbotLabel.TextSize = 14
AimbotLabel.TextXAlignment = Enum.TextXAlignment.Left

local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Name = "AimbotToggle"
AimbotToggle.Parent = AimbotSection
AimbotToggle.Size = UDim2.new(1, 0, 0, 25)
AimbotToggle.Position = UDim2.new(0, 0, 0, 25)
AimbotToggle.BackgroundColor3 = Color3.fromHex("#1E1E1E")
AimbotToggle.Text = "Enable Aimbot"
AimbotToggle.TextColor3 = Color3.fromHex("#E2DAFF")
AimbotToggle.Font = Enum.Font.Gotham
AimbotToggle.TextSize = 13
AimbotToggle.AutoButtonColor = false

local FOVSlider = Instance.new("Frame")
FOVSlider.Name = "FOVSlider"
FOVSlider.Parent = AimbotSection
FOVSlider.Size = UDim2.new(1, 0, 0, 40)
FOVSlider.Position = UDim2.new(0, 0, 0, 55)
FOVSlider.BackgroundTransparency = 1

local FOVLabel = Instance.new("TextLabel")
FOVLabel.Parent = FOVSlider
FOVLabel.Size = UDim2.new(1, 0, 0, 15)
FOVLabel.Position = UDim2.new(0, 0, 0, 0)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "FOV: "..Settings.Aimbot.FOV
FOVLabel.TextColor3 = Color3.fromHex("#E2DAFF")
FOVLabel.Font = Enum.Font.Gotham
FOVLabel.TextSize = 12
FOVLabel.TextXAlignment = Enum.TextXAlignment.Left

local SmoothnessSlider = Instance.new("Frame")
SmoothnessSlider.Name = "SmoothnessSlider"
SmoothnessSlider.Parent = AimbotSection
SmoothnessSlider.Size = UDim2.new(1, 0, 0, 40)
SmoothnessSlider.Position = UDim2.new(0, 0, 0, 100)
SmoothnessSlider.BackgroundTransparency = 1

local SmoothnessLabel = Instance.new("TextLabel")
SmoothnessLabel.Parent = SmoothnessSlider
SmoothnessLabel.Size = UDim2.new(1, 0, 0, 15)
SmoothnessLabel.Position = UDim2.new(0, 0, 0, 0)
SmoothnessLabel.BackgroundTransparency = 1
SmoothnessLabel.Text = "Smoothness: "..Settings.Aimbot.Smoothness
SmoothnessLabel.TextColor3 = Color3.fromHex("#E2DAFF")
SmoothnessLabel.Font = Enum.Font.Gotham
SmoothnessLabel.TextSize = 12
SmoothnessLabel.TextXAlignment = Enum.TextXAlignment.Left

local NoClipToggle = Instance.new("TextButton")
NoClipToggle.Name = "NoClipToggle"
NoClipToggle.Parent = MainContent
NoClipToggle.Size = UDim2.new(1, 0, 0, 25)
NoClipToggle.Position = UDim2.new(0, 0, 0, 160)
NoClipToggle.BackgroundColor3 = Color3.fromHex("#1E1E1E")
NoClipToggle.Text = "NoClip"
NoClipToggle.TextColor3 = Color3.fromHex("#E2DAFF")
NoClipToggle.Font = Enum.Font.Gotham
NoClipToggle.TextSize = 13
NoClipToggle.AutoButtonColor = false

local VisualContent = Instance.new("ScrollingFrame")
VisualContent.Name = "VisualContent"
VisualContent.Parent = TabContent
VisualContent.Size = UDim2.new(1, 0, 1, 0)
VisualContent.BackgroundTransparency = 1
VisualContent.Visible = false
VisualContent.ScrollBarThickness = 3
VisualContent.ScrollBarImageColor3 = Color3.fromHex("#A78BFA")

local ESPSection = Instance.new("Frame")
ESPSection.Name = "ESPSection"
ESPSection.Parent = VisualContent
ESPSection.Size = UDim2.new(1, 0, 0, 200)
ESPSection.BackgroundTransparency = 1

local ESPLabel = Instance.new("TextLabel")
ESPLabel.Parent = ESPSection
ESPLabel.Size = UDim2.new(1, 0, 0, 20)
ESPLabel.Position = UDim2.new(0, 0, 0, 0)
ESPLabel.BackgroundTransparency = 1
ESPLabel.Text = "ESP"
ESPLabel.TextColor3 = Color3.fromHex("#E2DAFF")
ESPLabel.Font = Enum.Font.GothamBold
ESPLabel.TextSize = 14
ESPLabel.TextXAlignment = Enum.TextXAlignment.Left

local ESPToggle = Instance.new("TextButton")
ESPToggle.Name = "ESPToggle"
ESPToggle.Parent = ESPSection
ESPToggle.Size = UDim2.new(1, 0, 0, 25)
ESPToggle.Position = UDim2.new(0, 0, 0, 25)
ESPToggle.BackgroundColor3 = Color3.fromHex("#1E1E1E")
ESPToggle.Text = "Enable ESP"
ESPToggle.TextColor3 = Color3.fromHex("#E2DAFF")
ESPToggle.Font = Enum.Font.Gotham
ESPToggle.TextSize = 13
ESPToggle.AutoButtonColor = false

local BoxToggle = Instance.new("TextButton")
BoxToggle.Name = "BoxToggle"
BoxToggle.Parent = ESPSection
BoxToggle.Size = UDim2.new(1, 0, 0, 25)
BoxToggle.Position = UDim2.new(0, 0, 0, 55)
BoxToggle.BackgroundColor3 = Color3.fromHex("#1E1E1E")
BoxToggle.Text = "Show Box"
BoxToggle.TextColor3 = Color3.fromHex("#E2DAFF")
BoxToggle.Font = Enum.Font.Gotham
BoxToggle.TextSize = 13
BoxToggle.AutoButtonColor = false

local NameToggle = Instance.new("TextButton")
NameToggle.Name = "NameToggle"
NameToggle.Parent = ESPSection
NameToggle.Size = UDim2.new(1, 0, 0, 25)
NameToggle.Position = UDim2.new(0, 0, 0, 85)
NameToggle.BackgroundColor3 = Color3.fromHex("#1E1E1E")
NameToggle.Text = "Show Name"
NameToggle.TextColor3 = Color3.fromHex("#E2DAFF")
NameToggle.Font = Enum.Font.Gotham
NameToggle.TextSize = 13
NameToggle.AutoButtonColor = false

local DistanceToggle = Instance.new("TextButton")
DistanceToggle.Name = "DistanceToggle"
DistanceToggle.Parent = ESPSection
DistanceToggle.Size = UDim2.new(1, 0, 0, 25)
DistanceToggle.Position = UDim2.new(0, 0, 0, 115)
DistanceToggle.BackgroundColor3 = Color3.fromHex("#1E1E1E")
DistanceToggle.Text = "Show Distance"
DistanceToggle.TextColor3 = Color3.fromHex("#E2DAFF")
DistanceToggle.Font = Enum.Font.Gotham
DistanceToggle.TextSize = 13
DistanceToggle.AutoButtonColor = false

local SkeletonToggle = Instance.new("TextButton")
SkeletonToggle.Name = "SkeletonToggle"
SkeletonToggle.Parent = ESPSection
SkeletonToggle.Size = UDim2.new(1, 0, 0, 25)
SkeletonToggle.Position = UDim2.new(0, 0, 0, 145)
SkeletonToggle.BackgroundColor3 = Color3.fromHex("#1E1E1E")
SkeletonToggle.Text = "Skeleton ESP"
SkeletonToggle.TextColor3 = Color3.fromHex("#E2DAFF")
SkeletonToggle.Font = Enum.Font.Gotham
SkeletonToggle.TextSize = 13
SkeletonToggle.AutoButtonColor = false

local PlayerContent = Instance.new("ScrollingFrame")
PlayerContent.Name = "PlayerContent"
PlayerContent.Parent = TabContent
PlayerContent.Size = UDim2.new(1, 0, 1, 0)
PlayerContent.BackgroundTransparency = 1
PlayerContent.Visible = false
PlayerContent.ScrollBarThickness = 3
PlayerContent.ScrollBarImageColor3 = Color3.fromHex("#A78BFA")

local MovementSection = Instance.new("Frame")
MovementSection.Name = "MovementSection"
MovementSection.Parent = PlayerContent
MovementSection.Size = UDim2.new(1, 0, 0, 150)
MovementSection.BackgroundTransparency = 1

local MovementLabel = Instance.new("TextLabel")
MovementLabel.Parent = MovementSection
MovementLabel.Size = UDim2.new(1, 0, 0, 20)
MovementLabel.Position = UDim2.new(0, 0, 0, 0)
MovementLabel.BackgroundTransparency = 1
MovementLabel.Text = "MOVEMENT"
MovementLabel.TextColor3 = Color3.fromHex("#E2DAFF")
MovementLabel.Font = Enum.Font.GothamBold
MovementLabel.TextSize = 14
MovementLabel.TextXAlignment = Enum.TextXAlignment.Left

local SpeedSlider = Instance.new("Frame")
SpeedSlider.Name = "SpeedSlider"
SpeedSlider.Parent = MovementSection
SpeedSlider.Size = UDim2.new(1, 0, 0, 40)
SpeedSlider.Position = UDim2.new(0, 0, 0, 25)
SpeedSlider.BackgroundTransparency = 1

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = SpeedSlider
SpeedLabel.Size = UDim2.new(1, 0, 0, 15)
SpeedLabel.Position = UDim2.new(0, 0, 0, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Speed: "..Settings.Movement.Speed
SpeedLabel.TextColor3 = Color3.fromHex("#E2DAFF")
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 12
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

local JumpSlider = Instance.new("Frame")
JumpSlider.Name = "JumpSlider"
JumpSlider.Parent = MovementSection
JumpSlider.Size = UDim2.new(1, 0, 0, 40)
JumpSlider.Position = UDim2.new(0, 0, 0, 80)
JumpSlider.BackgroundTransparency = 1

local JumpLabel = Instance.new("TextLabel")
JumpLabel.Parent = JumpSlider
JumpLabel.Size = UDim2.new(1, 0, 0, 15)
JumpLabel.Position = UDim2.new(0, 0, 0, 0)
JumpLabel.BackgroundTransparency = 1
JumpLabel.Text = "Jump Power: "..Settings.Movement.JumpPower
JumpLabel.TextColor3 = Color3.fromHex("#E2DAFF")
JumpLabel.Font = Enum.Font.Gotham
JumpLabel.TextSize = 12
JumpLabel.TextXAlignment = Enum.TextXAlignment.Left

local InfoFrame = Instance.new("Frame")
InfoFrame.Name = "InfoFrame"
InfoFrame.Parent = ScreenGui
InfoFrame.BackgroundColor3 = Color3.fromHex("#000000")
InfoFrame.BackgroundTransparency = 0.3
InfoFrame.BorderSizePixel = 0
InfoFrame.Position = UDim2.new(0.01, 0, 0.01, 0)
InfoFrame.Size = UDim2.new(0, 150, 0, 80)

local InfoStroke = Instance.new("UIStroke")
InfoStroke.Color = Color3.fromHex("#C4B5FD")
InfoStroke.Thickness = 1
InfoStroke.Parent = InfoFrame

local TimeLabel = Instance.new("TextLabel")
TimeLabel.Parent = InfoFrame
TimeLabel.Size = UDim2.new(1, -10, 0, 20)
TimeLabel.Position = UDim2.new(0, 5, 0, 5)
TimeLabel.BackgroundTransparency = 1
TimeLabel.Text = "Time: 00:00"
TimeLabel.TextColor3 = Color3.fromHex("#E2DAFF")
TimeLabel.Font = Enum.Font.Gotham
TimeLabel.TextSize = 12
TimeLabel.TextXAlignment = Enum.TextXAlignment.Left

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Parent = InfoFrame
FPSLabel.Size = UDim2.new(1, -10, 0, 20)
FPSLabel.Position = UDim2.new(0, 5, 0, 30)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "FPS: 0"
FPSLabel.TextColor3 = Color3.fromHex("#E2DAFF")
FPSLabel.Font = Enum.Font.Gotham
FPSLabel.TextSize = 12
FPSLabel.TextXAlignment = Enum.TextXAlignment.Left

local PingLabel = Instance.new("TextLabel")
PingLabel.Parent = InfoFrame
PingLabel.Size = UDim2.new(1, -10, 0, 20)
PingLabel.Position = UDim2.new(0, 5, 0, 55)
PingLabel.BackgroundTransparency = 1
PingLabel.Text = "Ping: 0ms"
PingLabel.TextColor3 = Color3.fromHex("#E2DAFF")
PingLabel.Font = Enum.Font.Gotham
PingLabel.TextSize = 12
PingLabel.TextXAlignment = Enum.TextXAlignment.Left

local function CreateSlider(parent, name, position, min, max, default, callback)
    local slider = Instance.new("Frame")
    slider.Name = name
    slider.Parent = parent
    slider.Size = UDim2.new(1, 0, 0, 20)
    slider.Position = position
    slider.BackgroundTransparency = 1

    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Parent = slider
    track.Size = UDim2.new(1, 0, 0, 4)
    track.Position = UDim2.new(0, 0, 0, 15)
    track.BackgroundColor3 = Color3.fromHex("#1E1E1E")
    track.BorderSizePixel = 0

    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Parent = track
    fill.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromHex("#A78BFA")
    fill.BorderSizePixel = 0

    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Parent = track
    button.Size = UDim2.new(0, 10, 0, 10)
    button.Position = UDim2.new((default - min)/(max - min), -5, 0.5, -5)
    button.BackgroundColor3 = Color3.fromHex("#E2DAFF")
    button.Text = ""
    button.AutoButtonColor = false

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
            callback(value)
        end
    end)

    return slider
end

local function CreateToggleButton(button, callback)
    local status = Instance.new("Frame")
    status.Name = "Status"
    status.Parent = button
    status.Size = UDim2.new(0, 15, 0, 15)
    status.Position = UDim2.new(0.9, -15, 0.5, -7.5)
    status.BackgroundColor3 = Color3.fromHex("#FF5555")
    status.BorderSizePixel = 0

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = status

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromHex("#2A2A2A")}):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromHex("#1E1E1E")}):Play()
    end)

    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromHex("#333333")}):Play()
    end)

    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromHex("#2A2A2A")}):Play()
    end)

    button.MouseButton1Click:Connect(function()
        local newValue = not (status.BackgroundColor3 == Color3.fromHex("#55FF55"))
        status.BackgroundColor3 = newValue and Color3.fromHex("#55FF55") or Color3.fromHex("#FF5555")
        callback(newValue)
    end)
end

CreateToggleButton(AimbotToggle, function(value)
    Settings.Aimbot.Enabled = value
end)

CreateToggleButton(NoClipToggle, function(value)
    Settings.Movement.NoClip = value
end)

CreateToggleButton(ESPToggle, function(value)
    Settings.ESP.Enabled = value
end)

CreateToggleButton(BoxToggle, function(value)
    Settings.ESP.Box = value
end)

CreateToggleButton(NameToggle, function(value)
    Settings.ESP.Name = value
end)

CreateToggleButton(DistanceToggle, function(value)
    Settings.ESP.Distance = value
end)

CreateToggleButton(SkeletonToggle, function(value)
    Settings.ESP.Skeleton = value
end)

CreateSlider(FOVSlider, "FOVSlider", UDim2.new(0, 0, 0, 20), 1, 360, Settings.Aimbot.FOV, function(value)
    Settings.Aimbot.FOV = value
    FOVLabel.Text = "FOV: "..value
end)

CreateSlider(SmoothnessSlider, "SmoothnessSlider", UDim2.new(0, 0, 0, 20), 1, 20, Settings.Aimbot.Smoothness, function(value)
    Settings.Aimbot.Smoothness = value
    SmoothnessLabel.Text = "Smoothness: "..value
end)

CreateSlider(SpeedSlider, "SpeedSlider", UDim2.new(0, 0, 0, 20), 16, 100, Settings.Movement.Speed, function(value)
    Settings.Movement.Speed = value
    SpeedLabel.Text = "Speed: "..value
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

CreateSlider(JumpSlider, "JumpSlider", UDim2.new(0, 0, 0, 20), 50, 200, Settings.Movement.JumpPower, function(value)
    Settings.Movement.JumpPower = value
    JumpLabel.Text = "Jump Power: "..value
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = value
    end
end)

MainTab.MouseButton1Click:Connect(function()
    MainContent.Visible = true
    VisualContent.Visible = false
    PlayerContent.Visible = false
end)

VisualTab.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    VisualContent.Visible = true
    PlayerContent.Visible = false
end)

PlayerTab.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    VisualContent.Visible = false
    PlayerContent.Visible = true
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
        InfoFrame.Visible = Settings.Visuals.Info
    end
end)

local startTime = os.time()
local lastUpdate = 0

RunService.RenderStepped:Connect(function(deltaTime)
    if os.time() - lastUpdate >= 1 then
        local playTime = os.time() - startTime
        local minutes = math.floor(playTime / 60)
        local seconds = playTime % 60
        TimeLabel.Text = string.format("Time: %02d:%02d", minutes, seconds)
        
        local fps = math.floor(1 / deltaTime)
        FPSLabel.Text = "FPS: "..fps
        
        local ping = math.random(10, 50)
        PingLabel.Text = "Ping: "..ping.."ms"
        
        lastUpdate = os.time()
    end
end)
