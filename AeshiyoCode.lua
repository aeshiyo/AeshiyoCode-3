local function CreateLoader()
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
    MainFrame.Size = UDim2.new(0, 250, 0, 100)

    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.Text = "Aeshiyocode<3 | Murder Mystery 2 | V1.0 | t.me"
    Title.TextColor3 = Color3.fromRGB(255, 216, 0)
    Title.TextSize = 18
    Title.Font = Enum.Font.SourceSansBold
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.1, 0, 0.1, 0)
    Title.Size = UDim2.new(0.8, 0, 0, 25)
    Title.TextStrokeTransparency = 0.5
    Title.TextStrokeColor3 = Color3.new(0,0,0)

    LoadingBar.Name = "LoadingBar"
    LoadingBar.Parent = MainFrame
    LoadingBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    LoadingBar.BorderSizePixel = 0
    LoadingBar.Position = UDim2.new(0.1, 0, 0.5, 0)
    LoadingBar.Size = UDim2.new(0.8, 0, 0, 10)

    Progress.Name = "Progress"
    Progress.Parent = LoadingBar
    Progress.BackgroundColor3 = Color3.fromRGB(255, 216, 0)
    Progress.BorderSizePixel = 0
    Progress.Size = UDim2.new(0, 0, 1, 0)

    local startTime = tick()
    local duration = 2

    coroutine.wrap(function()
        while tick() - startTime < duration do
            local progress = (tick() - startTime) / duration
            Progress.Size = UDim2.new(progress, 0, 1, 0)
            game:GetService("RunService").RenderStepped:Wait()
        end
        LoaderUI:Destroy()
        CreateMainUI()
    end)()
end

local function CreateMainUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MM2HubUI"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.Enabled = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderColor3 = Color3.fromRGB(255, 216, 0)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
    MainFrame.Size = UDim2.new(0, 350, 0, 300)

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.Text = "Aeshiyocode<3 | Murder Mystery 2 | V1.0 | t.me"
    Title.TextColor3 = Color3.fromRGB(255, 216, 0)
    Title.TextSize = 18
    Title.Font = Enum.Font.SourceSansBold
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.1, 0, 0.05, 0)
    Title.Size = UDim2.new(0.8, 0, 0, 25)
    Title.TextStrokeTransparency = 0.5
    Title.TextStrokeColor3 = Color3.new(0,0,0)

    local Tabs = {"Main", "Visual", "Player", "Teleport", "Target", "Animations", "Settings"}
    local TabButtons = Instance.new("Frame")
    TabButtons.Name = "TabButtons"
    TabButtons.Parent = MainFrame
    TabButtons.BackgroundTransparency = 1
    TabButtons.Position = UDim2.new(0.05, 0, 0.15, 0)
    TabButtons.Size = UDim2.new(0.9, 0, 0, 30)

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = TabButtons
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.Padding = UDim.new(0, 5)

    for _, tab in pairs(Tabs) do
        local Button = Instance.new("TextButton")
        Button.Name = tab
        Button.Parent = TabButtons
        Button.Text = tab
        Button.TextColor3 = Color3.fromRGB(255, 216, 0)
        Button.TextSize = 14
        Button.Font = Enum.Font.SourceSansBold
        Button.BackgroundTransparency = 1
        Button.Size = UDim2.new(0, 45, 0, 20)
    end

    local Categories = {
        {"Rage Functions", {"Kill All V2", "Attack Speed (CPS) [20/100]"}},
        {"Kill Player (Murder)", {"Select Player", "Kill Target"}},
        {"Rage aim", {"Prediction Power [12/30]", "Target Bone [Head]", "Enable Aim"}},
        {"Input", {"Input Infinite yield"}},
        {"Auto Farm", {"Auto Farm Coins", "Movement Speed [25/100]", "Check Interval [0.1/0.5]"}},
        {"Grab Gun", {"Grab Gun", "Auto Grab Gun"}}
    }

    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Position = UDim2.new(0.05, 0, 0.25, 0)
    ContentFrame.Size = UDim2.new(0.9, 0, 0, 200)
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, #Categories * 60)
    ContentFrame.ScrollBarThickness = 5

    local UIListLayout2 = Instance.new("UIListLayout")
    UIListLayout2.Parent = ContentFrame
    UIListLayout2.Padding = UDim.new(0, 10)

    for i, category in pairs(Categories) do
        local CategoryFrame = Instance.new("Frame")
        CategoryFrame.Name = category[1]
        CategoryFrame.Parent = ContentFrame
        CategoryFrame.BackgroundTransparency = 1
        CategoryFrame.Size = UDim2.new(1, 0, 0, 50)
        
        local CategoryLabel = Instance.new("TextLabel")
        CategoryLabel.Name = "CategoryLabel"
        CategoryLabel.Parent = CategoryFrame
        CategoryLabel.Text = category[1]
        CategoryLabel.TextColor3 = Color3.fromRGB(255, 216, 0)
        CategoryLabel.TextSize = 16
        CategoryLabel.Font = Enum.Font.SourceSansBold
        CategoryLabel.BackgroundTransparency = 1
        CategoryLabel.Position = UDim2.new(0, 0, 0, 0)
        CategoryLabel.Size = UDim2.new(1, 0, 0, 20)
        
        for j, option in pairs(category[2]) do
            local OptionButton = Instance.new("TextButton")
            OptionButton.Name = option
            OptionButton.Parent = CategoryFrame
            OptionButton.Text = "  "..option
            OptionButton.TextXAlignment = Enum.TextXAlignment.Left
            OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            OptionButton.TextSize = 14
            OptionButton.Font = Enum.Font.SourceSans
            OptionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            OptionButton.Position = UDim2.new(0, 0, 0, 20 + (j-1)*25)
            OptionButton.Size = UDim2.new(1, 0, 0, 20)
        end
    end

    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Insert then
            ScreenGui.Enabled = not ScreenGui.Enabled
        end
    end)
end

CreateLoader()
