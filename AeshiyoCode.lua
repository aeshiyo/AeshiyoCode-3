local function CreateLoader()
    local LoaderUI = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local LoadingBar = Instance.new("Frame")
    local Progress = Instance.new("Frame")
    local AuthorLabel = Instance.new("TextLabel")

    LoaderUI.Name = "AeshiyoLoader"
    LoaderUI.Parent = game:GetService("CoreGui")
    LoaderUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = LoaderUI
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.4, 0, 0.45, 0)
    MainFrame.Size = UDim2.new(0, 250, 0, 100)

    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.Text = "Aeshiyomm2"
    Title.TextColor3 = Color3.fromRGB(0, 255, 200)
    Title.TextSize = 20
    Title.Font = Enum.Font.SciFi
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.1, 0, 0.1, 0)
    Title.Size = UDim2.new(0.8, 0, 0, 25)

    LoadingBar.Name = "LoadingBar"
    LoadingBar.Parent = MainFrame
    LoadingBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    LoadingBar.BorderSizePixel = 0
    LoadingBar.Position = UDim2.new(0.1, 0, 0.5, 0)
    LoadingBar.Size = UDim2.new(0.8, 0, 0, 10)

    Progress.Name = "Progress"
    Progress.Parent = LoadingBar
    Progress.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
    Progress.BorderSizePixel = 0
    Progress.Size = UDim2.new(0, 0, 1, 0)

    AuthorLabel.Name = "AuthorLabel"
    AuthorLabel.Parent = MainFrame
    AuthorLabel.Text = "AeshiyoCode<3"
    AuthorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    AuthorLabel.TextSize = 12
    AuthorLabel.Font = Enum.Font.SciFi
    AuthorLabel.BackgroundTransparency = 1
    AuthorLabel.Position = UDim2.new(0.1, 0, 0.75, 0)
    AuthorLabel.Size = UDim2.new(0.8, 0, 0, 15)

    local startTime = tick()
    local duration = 5 -- 5 секунд загрузки

    coroutine.wrap(function()
        while tick() - startTime < duration do
            local progress = (tick() - startTime) / duration
            Progress.Size = UDim2.new(progress, 0, 1, 0)
            game:GetService("RunService").RenderStepped:Wait()
        end
        LoaderUI:Destroy()
    end)()
end

CreateLoader()