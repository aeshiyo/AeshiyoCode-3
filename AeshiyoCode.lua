local function CreateLoader()
    local LoaderUI = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local SubTitle = Instance.new("TextLabel")
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
    Title.Text = "AeshiyoMM2"
    Title.TextColor3 = Color3.fromRGB(255, 216, 0)
    Title.TextSize = 24
    Title.Font = Enum.Font.SourceSansBold
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.1, 0, 0.1, 0)
    Title.Size = UDim2.new(0.8, 0, 0, 30)
    Title.TextStrokeTransparency = 0.5
    Title.TextStrokeColor3 = Color3.new(0,0,0)

    SubTitle.Name = "SubTitle"
    SubTitle.Parent = MainFrame
    SubTitle.Text = "AeshiyoCode<3"
    SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubTitle.TextSize = 16
    SubTitle.Font = Enum.Font.SourceSans
    SubTitle.BackgroundTransparency = 1
    SubTitle.Position = UDim2.new(0.1, 0, 0.4, 0)
    SubTitle.Size = UDim2.new(0.8, 0, 0, 20)

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

    local startTime = tick()
    local duration = 3

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
    ScreenGui.Name = "AeshiyoMM2UI"
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
    Title.Text = "Onyx Hub | Murder Mystery 2 | V 1.1 | t.me/onyxhub"
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

    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Insert then
            ScreenGui.Enabled = not ScreenGui.Enabled
        end
    end)
end

CreateLoader()
