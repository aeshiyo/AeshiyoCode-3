local ESPLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/ESP/Universal.lua"))()
local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/NotificationLib.lua"))()

local ESP = {
    Enabled = false,
    Boxes = true,
    Names = true,
    Distance = true,
    Health = false,
    TeamColor = true,
    Fill = 0.1
}

local Notifications = {
    Enabled = true,
    Duration = 3
}

local function SetupESP()
    ESPLib:Initialize()
    ESPLib:Toggle(ESP.Enabled)
    
    ESPLib.Settings = {
        Box = ESP.Boxes,
        Name = ESP.Names,
        Distance = ESP.Distance,
        HealthBar = ESP.Health,
        TeamColor = ESP.TeamColor,
        FillTransparency = ESP.Fill
    }
end

local function ShowNotification(title, text)
    if Notifications.Enabled then
        NotifyLib:Notify({
            Title = title,
            Description = text,
            Duration = Notifications.Duration
        })
    end
end

local ESPToggle = CreateToggle(VisualContent, "ESP Enabled", UDim2.new(0, 0, 0, 0), "ESP", "Enabled")
local BoxToggle = CreateToggle(VisualContent, "Box ESP", UDim2.new(0, 0, 0, 35), "ESP", "Boxes")
local NameToggle = CreateToggle(VisualContent, "Name ESP", UDim2.new(0, 0, 0, 70), "ESP", "Names")

ESP.Enabled = Settings.ESP.Enabled
ESP.Boxes = Settings.ESP.Box
ESP.Names = Settings.ESP.Name

ESP.Enabled = Settings.ESP.Enabled
ESP.Boxes = Settings.ESP.Box
ESP.Names = Settings.ESP.Name

ESP.Enabled = Settings.ESP.Enabled
ESP.Boxes = Settings.ESP.Box
ESP.Names = Settings.ESP.Name

SetupESP()

ShowNotification("Phantom Menu", "ESP System Loaded")
