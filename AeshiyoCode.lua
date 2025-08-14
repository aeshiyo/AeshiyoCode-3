local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Настройки
local Settings = {
    Aimbot = {
        Enabled = false, 
        FOV = 100, 
        Smoothness = 20, 
        TeamCheck = true, 
        VisibleCheck = true, 
        Keybind = Enum.UserInputType.MouseButton2
    },
    ESP = {
        Enabled = false, 
        ShowTeam = false, 
        ShowDistance = true, 
        TextSize = 13,
        Boxes = false,
        Tracers = false
    },
    Misc = {
        AutoFarm = false, 
        SpeedHack = false, 
        SpeedMultiplier = 1.5
    }
}

-- Создание основного интерфейса
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2HackGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Главный фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 0)
MainFrame.ClipsDescendants = true
MainFrame.Visible = false

-- Скругление углов
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

-- Тень
local UIStroke = Instance.new("UIStroke")
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(60, 60, 70)
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Thickness = 1
UIStroke.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamSemibold
Title.Text = "MM2 HACK MENU"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.TextSize = 16
Title.BorderSizePixel = 0

-- Скругление заголовка
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 6)
TitleCorner.Parent = Title

-- Иконка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Title
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.Size = UDim2.new(0.1, 0, 1, 0)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(220, 220, 220)
CloseButton.TextSize = 20
CloseButton.TextStrokeTransparency = 0.8

-- Контейнер для кнопок
local ButtonsContainer = Instance.new("Frame")
ButtonsContainer.Name = "ButtonsContainer"
ButtonsContainer.Parent = MainFrame
ButtonsContainer.BackgroundTransparency = 1
ButtonsContainer.Position = UDim2.new(0, 10, 0, 45)
ButtonsContainer.Size = UDim2.new(1, -20, 1, -50)

-- Функция для создания кнопок
local function CreateButton(name, text, position, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = ButtonsContainer
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    button.Position = position
    button.Size = UDim2.new(1, 0, 0, 35)
    button.Font = Enum.Font.Gotham
    button.Text = text
    button.TextColor3 = Color3.fromRGB(220, 220, 220)
    button.TextSize = 14
    button.AutoButtonColor = false
    button.BorderSizePixel = 0
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    buttonStroke.Color = Color3.fromRGB(60, 60, 70)
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button
    
    local status = Instance.new("Frame")
    status.Name = "Status"
    status.Parent = button
    status.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    status.BorderSizePixel = 0
    status.Position = UDim2.new(0.85, 0, 0.2, 0)
    status.Size = UDim2.new(0, 20, 0, 20)
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 10)
    statusCorner.Parent = status
    
    -- Анимации при наведении
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(45, 45, 50)}
        ):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}
        ):Play()
    end)
    
    button.MouseButton1Down:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(35, 35, 40)}
        ):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(45, 45, 50)}
        ):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        callback()
        -- Анимация переключения статуса
        local statusColor = button.Status.BackgroundColor3 == Color3.fromRGB(255, 50, 50) and 
                           Color3.fromRGB(50, 255, 50) or 
                           Color3.fromRGB(255, 50, 50)
        
        game:GetService("TweenService"):Create(
            button.Status,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = statusColor}
        ):Play()
    end)
    
    return button
end

-- Создание кнопок
local AimbotButton = CreateButton("AimbotToggle", "Aimbot", UDim2.new(0, 0, 0, 0), function()
    Settings.Aimbot.Enabled = not Settings.Aimbot.Enabled
    AimbotButton.Text = "Aimbot: " .. (Settings.Aimbot.Enabled and "ON" or "OFF")
end)

local ESPButton = CreateButton("ESPToggle", "ESP", UDim2.new(0, 0, 0, 40), function()
    Settings.ESP.Enabled = not Settings.ESP.Enabled
    ESPButton.Text = "ESP: " .. (Settings.ESP.Enabled and "ON" or "OFF")
end)

local SpeedButton = CreateButton("SpeedToggle", "Speed Hack", UDim2.new(0, 0, 0, 80), function()
    Settings.Misc.SpeedHack = not Settings.Misc.SpeedHack
    SpeedButton.Text = "Speed: " .. (Settings.Misc.SpeedHack and "ON" or "OFF")
end)

local TeamCheckButton = CreateButton("TeamCheckToggle", "Team Check", UDim2.new(0, 0, 0, 120), function()
    Settings.Aimbot.TeamCheck = not Settings.Aimbot.TeamCheck
    TeamCheckButton.Text = "Team Check: " .. (Settings.Aimbot.TeamCheck and "ON" or "OFF")
end)

local VisibleCheckButton = CreateButton("VisibleCheckToggle", "Visible Check", UDim2.new(0, 0, 0, 160), function()
    Settings.Aimbot.VisibleCheck = not Settings.Aimbot.VisibleCheck
    VisibleCheckButton.Text = "Visible Check: " .. (Settings.Aimbot.VisibleCheck and "ON" or "OFF")
end)

-- Функция для открытия/закрытия меню
local function ToggleMenu()
    MainFrame.Visible = not MainFrame.Visible
    
    if MainFrame.Visible then
        -- Анимация открытия
        local tween = TweenService:Create(
            MainFrame,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 250, 0, 230)}
        )
        tween:Play()
    else
        -- Анимация закрытия
        local tween = TweenService:Create(
            MainFrame,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 250, 0, 0)}
        )
        tween:Play()
    end
end

-- Кнопка закрытия
CloseButton.MouseButton1Click:Connect(ToggleMenu)

-- Горячая клавиша для меню
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        ToggleMenu()
    end
end)

-- Остальной код (aimbot, ESP и т.д.) остается без изменений
-- ... [вставьте здесь остальную часть вашего исходного кода] ...

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

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Settings.Aimbot.Keybind and Settings.Aimbot.Enabled then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = target.Character.HumanoidRootPart
            local connection
            connection = RunService.RenderStepped:Connect(function()
                if not UserInputService:IsMouseButtonPressed(Settings.Aimbot.Keybind) then
                    connection:Disconnect()
                    return
                end
                
                local cameraCFrame = Camera.CFrame
                local targetPosition = rootPart.Position
                local smoothed = cameraCFrame:Lerp(CFrame.new(cameraCFrame.Position, targetPosition), Settings.Aimbot.Smoothness / 100)
                Camera.CFrame = smoothed
            end)
        end
    end
end)

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
        
        if not IsEnemy(self.Player) and not Settings.ESP.ShowTeam then
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
            self.Drawings.Text.Size = Settings.ESP.TextSize
            self.Drawings.Text.Outline = true
            self.Drawings.Text.Center = true
            self.Drawings.Text.Color = Color3.new(1, 1, 1)
        end
        
        self.Drawings.Text.Position = Vector2.new(screenPosition.X, screenPosition.Y)
        self.Drawings.Text.Text = player.Name .. (Settings.ESP.ShowDistance and (" (" .. math.floor((rootPart.Position - Camera.CFrame.Position).Magnitude) .. "m)") or "")
        self.Drawings.Text.Visible = Settings.ESP.Enabled
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

RunService.RenderStepped:Connect(function()
    for _, esp in pairs(ESPObjects) do
        esp:Update()
    end
    
    if Settings.Misc.SpeedHack and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16 * Settings.Misc.SpeedMultiplier
    end
end)
