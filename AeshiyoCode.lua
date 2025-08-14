local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local Settings = {
    Aimbot = {Enabled = false, FOV = 90, Smoothness = 10, TeamCheck = true, VisibleCheck = true, Keybind = Enum.UserInputType.MouseButton2},
    ESP = {Enabled = false, Boxes = false, Names = true, Distance = true, Skeletons = false, TeamCheck = true},
    Movement = {Speed = false, SpeedValue = 25, Jump = false, JumpPower = 50}
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CyberHackUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 350)
MainFrame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(180, 120, 255)
UIStroke.Thickness = 2
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
MainTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainTab.Text = "MAIN"
MainTab.TextColor3 = Color3.fromRGB(220, 220, 220)
MainTab.Font = Enum.Font.GothamSemibold
MainTab.TextSize = 14
MainTab.BorderSizePixel = 0

local VisualTab = Instance.new("TextButton")
VisualTab.Name = "VisualTab"
VisualTab.Parent = TabButtons
VisualTab.Size = UDim2.new(0.33, -4, 1, 0)
VisualTab.Position = UDim2.new(0.33, 0, 0, 0)
VisualTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
VisualTab.Text = "VISUAL"
VisualTab.TextColor3 = Color3.fromRGB(220, 220, 220)
VisualTab.Font = Enum.Font.GothamSemibold
VisualTab.TextSize = 14
VisualTab.BorderSizePixel = 0

local PlayerTab = Instance.new("TextButton")
PlayerTab.Name = "PlayerTab"
PlayerTab.Parent = TabButtons
PlayerTab.Size = UDim2.new(0.33, -4, 1, 0)
PlayerTab.Position = UDim2.new(0.66, 0, 0, 0)
PlayerTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
PlayerTab.Text = "PLAYER"
PlayerTab.TextColor3 = Color3.fromRGB(220, 220, 220)
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
MainContent.ScrollBarImageColor3 = Color3.fromRGB(180, 120, 255)

local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Name = "AimbotToggle"
AimbotToggle.Parent = MainContent
AimbotToggle.Size = UDim2.new(1, 0, 0, 30)
AimbotToggle.Position = UDim2.new(0, 0, 0, 0)
AimbotToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
AimbotToggle.Text = ""
AimbotToggle.AutoButtonColor = false

local AimbotLabel = Instance.new("TextLabel")
AimbotLabel.Parent = AimbotToggle
AimbotLabel.Size = UDim2.new(0.7, 0, 1, 0)
AimbotLabel.Position = UDim2.new(0, 10, 0, 0)
AimbotLabel.BackgroundTransparency = 1
AimbotLabel.Text = "Aimbot"
AimbotLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
AimbotLabel.Font = Enum.Font.Gotham
AimbotLabel.TextSize = 14
AimbotLabel.TextXAlignment = Enum.TextXAlignment.Left

local AimbotStatus = Instance.new("Frame")
AimbotStatus.Parent = AimbotToggle
AimbotStatus.Size = UDim2.new(0, 20, 0, 20)
AimbotStatus.Position = UDim2.new(0.9, -20, 0.15, 0)
AimbotStatus.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

local FOVSlider = Instance.new("Frame")
FOVSlider.Name = "FOVSlider"
FOVSlider.Parent = MainContent
FOVSlider.Size = UDim2.new(1, 0, 0, 40)
FOVSlider.Position = UDim2.new(0, 0, 0, 40)
FOVSlider.BackgroundTransparency = 1

local FOVLabel = Instance.new("TextLabel")
FOVLabel.Parent = FOVSlider
FOVLabel.Size = UDim2.new(0.5, 0, 0, 20)
FOVLabel.Position = UDim2.new(0, 0, 0, 0)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "FOV: "..Settings.Aimbot.FOV
FOVLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
FOVLabel.Font = Enum.Font.Gotham
FOVLabel.TextSize = 14
FOVLabel.TextXAlignment = Enum.TextXAlignment.Left

local SmoothnessSlider = Instance.new("Frame")
SmoothnessSlider.Name = "SmoothnessSlider"
SmoothnessSlider.Parent = MainContent
SmoothnessSlider.Size = UDim2.new(1, 0, 0, 40)
SmoothnessSlider.Position = UDim2.new(0, 0, 0, 80)
SmoothnessSlider.BackgroundTransparency = 1

local SmoothnessLabel = Instance.new("TextLabel")
SmoothnessLabel.Parent = SmoothnessSlider
SmoothnessLabel.Size = UDim2.new(0.5, 0, 0, 20)
SmoothnessLabel.Position = UDim2.new(0, 0, 0, 0)
SmoothnessLabel.BackgroundTransparency = 1
SmoothnessLabel.Text = "Smoothness: "..Settings.Aimbot.Smoothness
SmoothnessLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
SmoothnessLabel.Font = Enum.Font.Gotham
SmoothnessLabel.TextSize = 14
SmoothnessLabel.TextXAlignment = Enum.TextXAlignment.Left

local VisualContent = Instance.new("ScrollingFrame")
VisualContent.Name = "VisualContent"
VisualContent.Parent = TabContent
VisualContent.Size = UDim2.new(1, 0, 1, 0)
VisualContent.BackgroundTransparency = 1
VisualContent.Visible = false
VisualContent.ScrollBarThickness = 3
VisualContent.ScrollBarImageColor3 = Color3.fromRGB(180, 120, 255)

local ESPToggle = Instance.new("TextButton")
ESPToggle.Name = "ESPToggle"
ESPToggle.Parent = VisualContent
ESPToggle.Size = UDim2.new(1, 0, 0, 30)
ESPToggle.Position = UDim2.new(0, 0, 0, 0)
ESPToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ESPToggle.Text = ""
ESPToggle.AutoButtonColor = false

local ESPLabel = Instance.new("TextLabel")
ESPLabel.Parent = ESPToggle
ESPLabel.Size = UDim2.new(0.7, 0, 1, 0)
ESPLabel.Position = UDim2.new(0, 10, 0, 0)
ESPLabel.BackgroundTransparency = 1
ESPLabel.Text = "ESP"
ESPLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ESPLabel.Font = Enum.Font.Gotham
ESPLabel.TextSize = 14
ESPLabel.TextXAlignment = Enum.TextXAlignment.Left

local ESPStatus = Instance.new("Frame")
ESPStatus.Parent = ESPToggle
ESPStatus.Size = UDim2.new(0, 20, 0, 20)
ESPStatus.Position = UDim2.new(0.9, -20, 0.15, 0)
ESPStatus.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

local PlayerContent = Instance.new("ScrollingFrame")
PlayerContent.Name = "PlayerContent"
PlayerContent.Parent = TabContent
PlayerContent.Size = UDim2.new(1, 0, 1, 0)
PlayerContent.BackgroundTransparency = 1
PlayerContent.Visible = false
PlayerContent.ScrollBarThickness = 3
PlayerContent.ScrollBarImageColor3 = Color3.fromRGB(180, 120, 255)

local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Name = "SpeedToggle"
SpeedToggle.Parent = PlayerContent
SpeedToggle.Size = UDim2.new(1, 0, 0, 30)
SpeedToggle.Position = UDim2.new(0, 0, 0, 0)
SpeedToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
SpeedToggle.Text = ""
SpeedToggle.AutoButtonColor = false

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = SpeedToggle
SpeedLabel.Size = UDim2.new(0.7, 0, 1, 0)
SpeedLabel.Position = UDim2.new(0, 10, 0, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Speed Hack"
SpeedLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 14
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

local SpeedStatus = Instance.new("Frame")
SpeedStatus.Parent = SpeedToggle
SpeedStatus.Size = UDim2.new(0, 20, 0, 20)
SpeedStatus.Position = UDim2.new(0.9, -20, 0.15, 0)
SpeedStatus.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

local InfoFrame = Instance.new("Frame")
InfoFrame.Name = "InfoFrame"
InfoFrame.Parent = ScreenGui
InfoFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
InfoFrame.BorderSizePixel = 0
InfoFrame.Position = UDim2.new(0.01, 0, 0.05, 0)
InfoFrame.Size = UDim2.new(0, 150, 0, 100)

local InfoStroke = Instance.new("UIStroke")
InfoStroke.Color = Color3.fromRGB(180, 120, 255)
InfoStroke.Thickness = 2
InfoStroke.Parent = InfoFrame

local TimeLabel = Instance.new("TextLabel")
TimeLabel.Parent = InfoFrame
TimeLabel.Size = UDim2.new(1, -10, 0, 25)
TimeLabel.Position = UDim2.new(0, 5, 0, 5)
TimeLabel.BackgroundTransparency = 1
TimeLabel.Text = "Time: 00:00"
TimeLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
TimeLabel.Font = Enum.Font.Gotham
TimeLabel.TextSize = 14
TimeLabel.TextXAlignment = Enum.TextXAlignment.Left

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Parent = InfoFrame
FPSLabel.Size = UDim2.new(1, -10, 0, 25)
FPSLabel.Position = UDim2.new(0, 5, 0, 30)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "FPS: 0"
FPSLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
FPSLabel.Font = Enum.Font.Gotham
FPSLabel.TextSize = 14
FPSLabel.TextXAlignment = Enum.TextXAlignment.Left

local PingLabel = Instance.new("TextLabel")
PingLabel.Parent = InfoFrame
PingLabel.Size = UDim2.new(1, -10, 0, 25)
PingLabel.Position = UDim2.new(0, 5, 0, 55)
PingLabel.BackgroundTransparency = 1
PingLabel.Text = "Ping: 0ms"
PingLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
PingLabel.Font = Enum.Font.Gotham
PingLabel.TextSize = 14
PingLabel.TextXAlignment = Enum.TextXAlignment.Left

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

AimbotToggle.MouseButton1Click:Connect(function()
    Settings.Aimbot.Enabled = not Settings.Aimbot.Enabled
    AimbotStatus.BackgroundColor3 = Settings.Aimbot.Enabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
end)

ESPToggle.MouseButton1Click:Connect(function()
    Settings.ESP.Enabled = not Settings.ESP.Enabled
    ESPStatus.BackgroundColor3 = Settings.ESP.Enabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
end)

SpeedToggle.MouseButton1Click:Connect(function()
    Settings.Movement.Speed = not Settings.Movement.Speed
    SpeedStatus.BackgroundColor3 = Settings.Movement.Speed and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Settings.Movement.Speed and Settings.Movement.SpeedValue or 16
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

local function GetTeam(Player)
    if not Player.Character then return nil end
    local Shirt = Player.Character:FindFirstChildOfClass("Shirt")
    if Shirt then return Shirt.ShirtTemplate end
    return nil
end

local function IsEnemy(Player)
    if not Settings.Aimbot.TeamCheck then return true end
    return GetTeam(Player) ~= GetTeam(LocalPlayer)
end

local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = Settings.Aimbot.FOV

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if IsEnemy(player) then
                local character = player.Character
                local rootPart = character.HumanoidRootPart
                
                if Settings.Aimbot.VisibleCheck then
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterDescendantsInstances = {character, LocalPlayer.Character}
                    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                    
                    local origin = Camera.CFrame.Position
                    local direction = (rootPart.Position - origin).Unit * 1000
                    local raycastResult = workspace:Raycast(origin, direction, raycastParams)
                    
                    if raycastResult and not raycastResult.Instance:IsDescendantOf(character) then
                        continue
                    end
                end
                
                local screenPoint, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                if onScreen then
                    local mouseLocation = Vector2.new(Mouse.X, Mouse.Y)
                    local playerLocation = Vector2.new(screenPoint.X, screenPoint.Y)
                    local distance = (mouseLocation - playerLocation).Magnitude
                    
                    if distance < shortestDistance then
                        closestPlayer = player
                        shortestDistance = distance
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

local ESPObjects = {}

local function CreateESP(player)
    if player == LocalPlayer then return end
    
    local esp = {
        Player = player,
        Drawings = {}
    }
    
    function esp:Update()
        if not self.Player.Character or not self.Player.Character:FindFirstChild("HumanoidRootPart") then
            self:Remove()
            return
        end
        
        if not IsEnemy(self.Player) and not Settings.ESP.TeamCheck then
            for _, drawing in pairs(self.Drawings) do
                drawing.Visible = false
            end
            return
        end
        
        local character = self.Player.Character
        local rootPart = character.HumanoidRootPart
        local head = character:FindFirstChild("Head")
        
        if not head then return end
        
        local screenPosition, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
        if not onScreen then
            for _, drawing in pairs(self.Drawings) do
                drawing.Visible = false
            end
            return
        end
        
        if not self.Drawings.Text then
            self.Drawings.Text = Drawing.new("Text")
            self.Drawings.Text.Size = 14
            self.Drawings.Text.Outline = true
            self.Drawings.Text.Center = true
            self.Drawings.Text.Color = Color3.new(1, 1, 1)
        end
        
        self.Drawings.Text.Position = Vector2.new(screenPosition.X, screenPosition.Y)
        self.Drawings.Text.Text = player.Name .. (Settings.ESP.Distance and (" (" .. math.floor((rootPart.Position - Camera.CFrame.Position).Magnitude) .. "m)") or "")
        self.Drawings.Text.Visible = Settings.ESP.Enabled and Settings.ESP.Names
    end
    
    function esp:Remove()
        for _, drawing in pairs(self.Drawings) do
            drawing:Remove()
        end
        ESPObjects[player] = nil
    end
    
    ESPObjects[player] = esp
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    CreateESP(player)
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPObjects[player] then
        ESPObjects[player]:Remove()
    end
end)

local startTime = os.time()
local lastUpdate = 0

RunService.RenderStepped:Connect(function(deltaTime)
    for _, esp in pairs(ESPObjects) do
        esp:Update()
    end
    
    if os.time() - lastUpdate >= 1 then
        local playTime = os.time() - startTime
        local minutes = math.floor(playTime / 60)
        local seconds = playTime % 60
        TimeLabel.Text = string.format("Time: %02d:%02d", minutes, seconds)
        
        local fps = math.floor(1 / deltaTime)
        FPSLabel.Text = "FPS: "..fps
        
        lastUpdate = os.time()
    end
    
    if Settings.Movement.Speed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Settings.Movement.SpeedValue
    end
end)
