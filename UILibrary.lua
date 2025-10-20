local Flint = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Themes = {
    Default = {
        Primary = Color3.fromRGB(140, 140, 140),
        Secondary = Color3.fromRGB(160, 160, 160),
        Tertiary = Color3.fromRGB(180, 180, 180),
        Background = Color3.fromRGB(18, 18, 18),
        SecondaryBackground = Color3.fromRGB(25, 25, 25),
        ElementBackground = Color3.fromRGB(30, 30, 30),
        DarkElement = Color3.fromRGB(100, 100, 100),
        Hover = Color3.fromRGB(120, 120, 120),
        TextPrimary = Color3.fromRGB(220, 220, 220),
        TextSecondary = Color3.fromRGB(180, 180, 180)
    },
    Dark = {
        Primary = Color3.fromRGB(100, 100, 120),
        Secondary = Color3.fromRGB(120, 120, 140),
        Tertiary = Color3.fromRGB(140, 140, 160),
        Background = Color3.fromRGB(10, 10, 15),
        SecondaryBackground = Color3.fromRGB(15, 15, 20),
        ElementBackground = Color3.fromRGB(20, 20, 25),
        DarkElement = Color3.fromRGB(60, 60, 80),
        Hover = Color3.fromRGB(80, 80, 100),
        TextPrimary = Color3.fromRGB(230, 230, 240),
        TextSecondary = Color3.fromRGB(170, 170, 180)
    },
    Light = {
        Primary = Color3.fromRGB(100, 120, 150),
        Secondary = Color3.fromRGB(120, 140, 170),
        Tertiary = Color3.fromRGB(140, 160, 190),
        Background = Color3.fromRGB(240, 240, 245),
        SecondaryBackground = Color3.fromRGB(230, 230, 235),
        ElementBackground = Color3.fromRGB(220, 220, 225),
        DarkElement = Color3.fromRGB(180, 180, 190),
        Hover = Color3.fromRGB(200, 200, 210),
        TextPrimary = Color3.fromRGB(20, 20, 30),
        TextSecondary = Color3.fromRGB(60, 60, 70)
    },
    Blue = {
        Primary = Color3.fromRGB(66, 135, 245),
        Secondary = Color3.fromRGB(86, 155, 255),
        Tertiary = Color3.fromRGB(106, 175, 255),
        Background = Color3.fromRGB(15, 20, 30),
        SecondaryBackground = Color3.fromRGB(20, 25, 35),
        ElementBackground = Color3.fromRGB(25, 30, 40),
        DarkElement = Color3.fromRGB(40, 80, 140),
        Hover = Color3.fromRGB(50, 100, 180),
        TextPrimary = Color3.fromRGB(230, 240, 255),
        TextSecondary = Color3.fromRGB(180, 200, 230)
    },
    Purple = {
        Primary = Color3.fromRGB(138, 80, 200),
        Secondary = Color3.fromRGB(158, 100, 220),
        Tertiary = Color3.fromRGB(178, 120, 240),
        Background = Color3.fromRGB(20, 15, 30),
        SecondaryBackground = Color3.fromRGB(25, 20, 35),
        ElementBackground = Color3.fromRGB(30, 25, 40),
        DarkElement = Color3.fromRGB(80, 50, 120),
        Hover = Color3.fromRGB(100, 60, 150),
        TextPrimary = Color3.fromRGB(240, 230, 255),
        TextSecondary = Color3.fromRGB(200, 180, 230)
    },
    Green = {
        Primary = Color3.fromRGB(76, 175, 80),
        Secondary = Color3.fromRGB(96, 195, 100),
        Tertiary = Color3.fromRGB(116, 215, 120),
        Background = Color3.fromRGB(15, 25, 18),
        SecondaryBackground = Color3.fromRGB(20, 30, 23),
        ElementBackground = Color3.fromRGB(25, 35, 28),
        DarkElement = Color3.fromRGB(50, 100, 60),
        Hover = Color3.fromRGB(60, 130, 70),
        TextPrimary = Color3.fromRGB(230, 255, 235),
        TextSecondary = Color3.fromRGB(180, 220, 190)
    },
    Red = {
        Primary = Color3.fromRGB(220, 80, 80),
        Secondary = Color3.fromRGB(240, 100, 100),
        Tertiary = Color3.fromRGB(255, 120, 120),
        Background = Color3.fromRGB(25, 15, 15),
        SecondaryBackground = Color3.fromRGB(30, 20, 20),
        ElementBackground = Color3.fromRGB(35, 25, 25),
        DarkElement = Color3.fromRGB(120, 50, 50),
        Hover = Color3.fromRGB(150, 60, 60),
        TextPrimary = Color3.fromRGB(255, 230, 230),
        TextSecondary = Color3.fromRGB(230, 180, 180)
    },
    Orange = {
        Primary = Color3.fromRGB(255, 140, 50),
        Secondary = Color3.fromRGB(255, 160, 70),
        Tertiary = Color3.fromRGB(255, 180, 90),
        Background = Color3.fromRGB(25, 20, 15),
        SecondaryBackground = Color3.fromRGB(30, 25, 20),
        ElementBackground = Color3.fromRGB(35, 30, 25),
        DarkElement = Color3.fromRGB(140, 80, 40),
        Hover = Color3.fromRGB(180, 100, 50),
        TextPrimary = Color3.fromRGB(255, 245, 230),
        TextSecondary = Color3.fromRGB(230, 210, 180)
    },
    Pink = {
        Primary = Color3.fromRGB(255, 100, 150),
        Secondary = Color3.fromRGB(255, 120, 170),
        Tertiary = Color3.fromRGB(255, 140, 190),
        Background = Color3.fromRGB(25, 15, 20),
        SecondaryBackground = Color3.fromRGB(30, 20, 25),
        ElementBackground = Color3.fromRGB(35, 25, 30),
        DarkElement = Color3.fromRGB(140, 60, 90),
        Hover = Color3.fromRGB(180, 80, 120),
        TextPrimary = Color3.fromRGB(255, 230, 245),
        TextSecondary = Color3.fromRGB(230, 180, 210)
    },
    Cyan = {
        Primary = Color3.fromRGB(50, 200, 220),
        Secondary = Color3.fromRGB(70, 220, 240),
        Tertiary = Color3.fromRGB(90, 240, 255),
        Background = Color3.fromRGB(15, 22, 25),
        SecondaryBackground = Color3.fromRGB(20, 27, 30),
        ElementBackground = Color3.fromRGB(25, 32, 35),
        DarkElement = Color3.fromRGB(40, 110, 130),
        Hover = Color3.fromRGB(50, 140, 160),
        TextPrimary = Color3.fromRGB(230, 250, 255),
        TextSecondary = Color3.fromRGB(180, 220, 235)
    },
    Yellow = {
        Primary = Color3.fromRGB(255, 220, 80),
        Secondary = Color3.fromRGB(255, 235, 100),
        Tertiary = Color3.fromRGB(255, 245, 120),
        Background = Color3.fromRGB(25, 25, 15),
        SecondaryBackground = Color3.fromRGB(30, 30, 20),
        ElementBackground = Color3.fromRGB(35, 35, 25),
        DarkElement = Color3.fromRGB(140, 130, 50),
        Hover = Color3.fromRGB(180, 170, 70),
        TextPrimary = Color3.fromRGB(255, 255, 230),
        TextSecondary = Color3.fromRGB(230, 230, 180)
    },
    Midnight = {
        Primary = Color3.fromRGB(80, 90, 130),
        Secondary = Color3.fromRGB(100, 110, 150),
        Tertiary = Color3.fromRGB(120, 130, 170),
        Background = Color3.fromRGB(8, 10, 18),
        SecondaryBackground = Color3.fromRGB(12, 15, 25),
        ElementBackground = Color3.fromRGB(16, 20, 32),
        DarkElement = Color3.fromRGB(40, 50, 80),
        Hover = Color3.fromRGB(60, 70, 110),
        TextPrimary = Color3.fromRGB(220, 230, 250),
        TextSecondary = Color3.fromRGB(160, 175, 210)
    }
}

local Config = {
    CurrentTheme = "Default",
    DragSmoothing = 0.15,
    GUIVisible = true,
    ToggleKeybind = Enum.KeyCode.RightShift,
    Transparency = 1.0
}

local LibraryData = nil

local function GetTheme()
    return Themes[Config.CurrentTheme] or Themes.Default
end

local function ApplyTheme(themeElements)
    local colors = GetTheme()
    for element, propertyData in pairs(themeElements) do
        if element and element.Parent then
            local colorKey = propertyData.Background or propertyData.Text or propertyData.ScrollBar or "Primary"
            if element:IsA("Frame") or element:IsA("TextButton") or element:IsA("ScrollingFrame") then
                if propertyData.Background and colors[propertyData.Background] then
                    element.BackgroundColor3 = colors[propertyData.Background]
                    if propertyData.Background then
                        element.BackgroundTransparency = Config.Transparency
                    end
                end
            end
            if element:IsA("TextLabel") or element:IsA("TextButton") or element:IsA("TextBox") then
                if propertyData.Text and colors[propertyData.Text] then
                    element.TextColor3 = colors[propertyData.Text]
                    if propertyData.Text then
                        element.TextTransparency = Config.Transparency
                    end
                end
            end
            if element:IsA("ScrollingFrame") and propertyData.ScrollBar and colors[propertyData.ScrollBar] then
                element.ScrollBarImageColor3 = colors[propertyData.ScrollBar]
                element.ScrollBarImageTransparency = Config.Transparency
            end
        end
    end
end

function Flint:CreateWindow(options)
    options = options or {}
    local title = options.Title or "Flint UI Library - v3.0"
    local size = options.Size or UDim2.new(0, 500, 0, 350)
    local position = options.Position or UDim2.new(0.5, -250, 0.5, -175)

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FlintUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    if syn then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:GetService("CoreGui")
    else
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    LibraryData = {
        ThemeElements = {},
        ScreenGui = ScreenGui,
        Notifications = {},
        Tabs = {},
        CurrentTab = nil
    }

    local DropdownContainer = Instance.new("Frame")
    DropdownContainer.Name = "DropdownContainer"
    DropdownContainer.Size = UDim2.new(1, 0, 1, 0)
    DropdownContainer.Position = UDim2.new(0, 0, 0, 0)
    DropdownContainer.BackgroundTransparency = 1
    DropdownContainer.ZIndex = 100
    DropdownContainer.Parent = ScreenGui

    local NotificationContainer = Instance.new("Frame")
    NotificationContainer.Name = "NotificationContainer"
    NotificationContainer.Size = UDim2.new(0, 200, 1, 0)
    NotificationContainer.Position = UDim2.new(1, -210, 0, 0)
    NotificationContainer.BackgroundTransparency = 1
    NotificationContainer.Parent = ScreenGui

    local NotificationLayout = Instance.new("UIListLayout")
    NotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotificationLayout.Padding = UDim.new(0, 10)
    NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotificationLayout.Parent = NotificationContainer

    local MinimizedIcon = Instance.new("Frame")
    MinimizedIcon.Name = "MinimizedIcon"
    MinimizedIcon.Size = UDim2.new(0, 50, 0, 50)
    MinimizedIcon.Position = UDim2.new(0, 20, 0, 20)
    MinimizedIcon.BackgroundColor3 = GetTheme().Background
    MinimizedIcon.BackgroundTransparency = Config.Transparency
    MinimizedIcon.BorderSizePixel = 0
    MinimizedIcon.Visible = false
    MinimizedIcon.Parent = ScreenGui

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 12)
    IconCorner.Parent = MinimizedIcon

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = "F"
    IconLabel.TextColor3 = GetTheme().Primary
    IconLabel.TextTransparency = Config.Transparency
    IconLabel.TextSize = 24
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.Parent = MinimizedIcon

    local IconButton = Instance.new("TextButton")
    IconButton.Size = UDim2.new(1, 0, 1, 0)
    IconButton.BackgroundTransparency = 1
    IconButton.Text = ""
    IconButton.Parent = MinimizedIcon

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = size
    MainFrame.Position = position
    MainFrame.BackgroundColor3 = GetTheme().Background
    MainFrame.BackgroundTransparency = Config.Transparency
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 35)
    TopBar.Position = UDim2.new(0, 0, 0, 0)
    TopBar.BackgroundColor3 = GetTheme().SecondaryBackground
    TopBar.BackgroundTransparency = Config.Transparency
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame

    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 12)
    TopBarCorner.Parent = TopBar

    local TopBarFill = Instance.new("Frame")
    TopBarFill.Size = UDim2.new(1, 0, 0, 12)
    TopBarFill.Position = UDim2.new(0, 0, 1, -12)
    TopBarFill.BackgroundColor3 = GetTheme().SecondaryBackground
    TopBarFill.BackgroundTransparency = Config.Transparency
    TopBarFill.BorderSizePixel = 0
    TopBarFill.Parent = TopBar

    local TopBarTitle = Instance.new("TextLabel")
    TopBarTitle.Size = UDim2.new(1, -100, 1, 0)
    TopBarTitle.Position = UDim2.new(0, 15, 0, 0)
    TopBarTitle.BackgroundTransparency = 1
    TopBarTitle.Text = title
    TopBarTitle.TextColor3 = GetTheme().Primary
    TopBarTitle.TextTransparency = Config.Transparency
    TopBarTitle.TextSize = 13
    TopBarTitle.Font = Enum.Font.GothamBold
    TopBarTitle.TextXAlignment = Enum.TextXAlignment.Left
    TopBarTitle.Parent = TopBar

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 30, 0, 25)
    MinimizeButton.Position = UDim2.new(1, -40, 0, 5)
    MinimizeButton.BackgroundColor3 = GetTheme().ElementBackground
    MinimizeButton.BackgroundTransparency = Config.Transparency
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Text = "–"
    MinimizeButton.TextColor3 = GetTheme().TextPrimary
    MinimizeButton.TextTransparency = Config.Transparency
    MinimizeButton.TextSize = 16
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = TopBar

    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 6)
    MinimizeCorner.Parent = MinimizeButton

    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 150, 1, -35)
    Sidebar.Position = UDim2.new(0, 0, 0, 35)
    Sidebar.BackgroundColor3 = GetTheme().SecondaryBackground
    Sidebar.BackgroundTransparency = Config.Transparency
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = MainFrame

    local SidebarTitle = Instance.new("TextLabel")
    SidebarTitle.Name = "Title"
    SidebarTitle.Size = UDim2.new(1, -20, 0, 45)
    SidebarTitle.Position = UDim2.new(0, 10, 0, 5)
    SidebarTitle.BackgroundTransparency = 1
    SidebarTitle.Text = "MENU"
    SidebarTitle.TextColor3 = GetTheme().Primary
    SidebarTitle.TextTransparency = Config.Transparency
    SidebarTitle.TextSize = 16
    SidebarTitle.Font = Enum.Font.GothamBold
    SidebarTitle.TextXAlignment = Enum.TextXAlignment.Left
    SidebarTitle.Parent = Sidebar

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.new(1, -165, 1, -50)
    ContentFrame.Position = UDim2.new(0, 158, 0, 43)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = MainFrame

    local SettingsButton = Instance.new("TextButton")
    SettingsButton.Size = UDim2.new(0, 50, 0, 50)
    SettingsButton.Position = UDim2.new(0, 10, 1, -60)
    SettingsButton.BackgroundColor3 = GetTheme().ElementBackground
    SettingsButton.BackgroundTransparency = Config.Transparency
    SettingsButton.BorderSizePixel = 0
    SettingsButton.Text = "⚙️"
    SettingsButton.TextColor3 = GetTheme().TextPrimary
    SettingsButton.TextTransparency = Config.Transparency
    SettingsButton.TextSize = 24
    SettingsButton.Font = Enum.Font.GothamBold
    SettingsButton.Parent = MainFrame

    local SettingsButtonCorner = Instance.new("UICorner")
    SettingsButtonCorner.CornerRadius = UDim.new(0, 12)
    SettingsButtonCorner.Parent = SettingsButton

    local SettingsFrame = Instance.new("ScrollingFrame")
    SettingsFrame.Name = "SettingsFrame"
    SettingsFrame.Size = UDim2.new(1, -165, 1, -50)
    SettingsFrame.Position = UDim2.new(0, 158, 0, 43)
    SettingsFrame.BackgroundTransparency = 1
    SettingsFrame.BorderSizePixel = 0
    SettingsFrame.ScrollBarThickness = 3
    SettingsFrame.ScrollBarImageColor3 = GetTheme().DarkElement
    SettingsFrame.ScrollBarImageTransparency = Config.Transparency
    SettingsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    SettingsFrame.Visible = false
    SettingsFrame.Parent = MainFrame

    local SettingsLayout = Instance.new("UIListLayout")
    SettingsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SettingsLayout.Padding = UDim.new(0, 8)
    SettingsLayout.Parent = SettingsFrame

    SettingsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        SettingsFrame.CanvasSize = UDim2.new(0, 0, 0, SettingsLayout.AbsoluteContentSize.Y + 15)
    end)

    LibraryData.MainFrame = MainFrame
    LibraryData.Sidebar = Sidebar
    LibraryData.ContentFrame = ContentFrame
    LibraryData.DropdownContainer = DropdownContainer
    LibraryData.MinimizedIcon = MinimizedIcon
    LibraryData.SettingsFrame = SettingsFrame
    LibraryData.SettingsButton = SettingsButton

    LibraryData.ThemeElements[MainFrame] = {Background = "Background"}
    LibraryData.ThemeElements[TopBar] = {Background = "SecondaryBackground"}
    LibraryData.ThemeElements[TopBarFill] = {Background = "SecondaryBackground"}
    LibraryData.ThemeElements[TopBarTitle] = {Text = "TextPrimary"}
    LibraryData.ThemeElements[MinimizeButton] = {Background = "ElementBackground", Text = "TextPrimary"}
    LibraryData.ThemeElements[Sidebar] = {Background = "SecondaryBackground"}
    LibraryData.ThemeElements[SidebarTitle] = {Text = "TextPrimary"}
    LibraryData.ThemeElements[MinimizedIcon] = {Background = "Background"}
    LibraryData.ThemeElements[IconLabel] = {Text = "TextPrimary"}
    LibraryData.ThemeElements[SettingsButton] = {Background = "ElementBackground", Text = "TextPrimary"}
    LibraryData.ThemeElements[SettingsFrame] = {ScrollBar = "DarkElement"}

    local function ToggleGUI()
        Config.GUIVisible = not Config.GUIVisible
        if Config.GUIVisible then
            MinimizedIcon.Visible = false
            MainFrame.Visible = true
            SettingsButton.Visible = true
            local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = size})
            openTween:Play()
        else
            local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, size.X.Offset, 0, 0)})
            closeTween:Play()
            closeTween.Completed:Connect(function()
                MainFrame.Visible = false
                SettingsButton.Visible = false
                MinimizedIcon.Visible = true
            end)
        end
    end

    MinimizeButton.MouseButton1Click:Connect(ToggleGUI)
    IconButton.MouseButton1Click:Connect(ToggleGUI)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Config.ToggleKeybind then
            ToggleGUI()
        end
    end)

    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        TweenService:Create(MainFrame, TweenInfo.new(Config.DragSmoothing, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    end

    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    local iconDragging, iconDragInput, iconDragStart, iconStartPos

    local function updateIcon(input)
        local delta = input.Position - iconDragStart
        local targetPos = UDim2.new(iconStartPos.X.Scale, iconStartPos.X.Offset + delta.X, iconStartPos.Y.Scale, iconStartPos.Y.Offset + delta.Y)
        TweenService:Create(MinimizedIcon, TweenInfo.new(Config.DragSmoothing, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    end

    MinimizedIcon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            iconDragging = true
            iconDragStart = input.Position
            iconStartPos = MinimizedIcon.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    iconDragging = false
                end
            end)
        end
    end)

    MinimizedIcon.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            iconDragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == iconDragInput and iconDragging then
            updateIcon(input)
        end
    end)

    local function SwitchToSettings()
        if LibraryData.CurrentTab == "Settings" then return end

        for _, tab in pairs(LibraryData.Tabs) do
            tab.Content.Visible = false
            tab.Button.BackgroundColor3 = GetTheme().ElementBackground
            tab.Label.TextColor3 = GetTheme().TextSecondary
            tab.Icon.TextColor3 = GetTheme().TextSecondary
        end
        SettingsFrame.Visible = true
        ContentFrame.Visible = false
        SettingsButton.BackgroundColor3 = GetTheme().Primary
        SettingsButton.TextColor3 = GetTheme().Background
        LibraryData.CurrentTab = "Settings"
    end

    local function SwitchToTab(tabData)
        if LibraryData.CurrentTab == tabData then return end

        for _, tab in pairs(LibraryData.Tabs) do
            tab.Content.Visible = false
            tab.Button.BackgroundColor3 = GetTheme().ElementBackground
            tab.Label.TextColor3 = GetTheme().TextSecondary
            tab.Icon.TextColor3 = GetTheme().TextSecondary
        end
        SettingsFrame.Visible = false
        ContentFrame.Visible = true
        tabData.Content.Visible = true
        tabData.Button.BackgroundColor3 = GetTheme().Primary
        tabData.Label.TextColor3 = GetTheme().Background
        tabData.Icon.TextColor3 = GetTheme().Background
        SettingsButton.BackgroundColor3 = GetTheme().ElementBackground
        SettingsButton.TextColor3 = GetTheme().TextPrimary
        LibraryData.CurrentTab = tabData
    end

    SettingsButton.MouseButton1Click:Connect(SwitchToSettings)

    Flint:CreateSection(SettingsFrame, "UI SETTINGS")
    Flint:CreateSlider(SettingsFrame, "Drag Smoothing", 1, 100, math.floor(Config.DragSmoothing * 100), function(value)
        Config.DragSmoothing = value / 100
    end)
    Flint:CreateSlider(SettingsFrame, "GUI Transparency", 30, 100, math.floor(Config.Transparency * 100), function(value)
        Config.Transparency = value / 100
        ApplyTheme(LibraryData.ThemeElements)
    end)
    Flint:CreateKeybind(SettingsFrame, "Toggle GUI Keybind", Config.ToggleKeybind, function(newKey)
        Config.ToggleKeybind = newKey
    end)
    Flint:CreateSection(SettingsFrame, "THEME SETTINGS")
    local themeNames = {}
    for themeName, _ in pairs(Themes) do
        table.insert(themeNames, themeName)
    end
    table.sort(themeNames)
    Flint:CreateDropdown(SettingsFrame, "Select Theme", themeNames, Config.CurrentTheme, function(selected)
        Config.CurrentTheme = selected
        ApplyTheme(LibraryData.ThemeElements)
    end)

    return LibraryData
end

function Flint:Init()
    return Flint:CreateWindow()
end

function Flint:Notify(message)
    if not LibraryData or not LibraryData.ScreenGui then return end
    local NotificationContainer = LibraryData.ScreenGui:FindFirstChild("NotificationContainer")
    if not NotificationContainer then return end

    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 190, 0, 50)
    notification.BackgroundColor3 = GetTheme().ElementBackground
    notification.BackgroundTransparency = Config.Transparency
    notification.BorderSizePixel = 0
    notification.Parent = NotificationContainer

    local notificationCorner = Instance.new("UICorner")
    notificationCorner.CornerRadius = UDim.new(0, 8)
    notificationCorner.Parent = notification

    local notificationLabel = Instance.new("TextLabel")
    notificationLabel.Size = UDim2.new(1, -10, 1, -10)
    notificationLabel.Position = UDim2.new(0, 5, 0, 5)
    notificationLabel.BackgroundTransparency = 1
    notificationLabel.Text = message
    notificationLabel.TextColor3 = GetTheme().TextPrimary
    notificationLabel.TextTransparency = Config.Transparency
    notificationLabel.TextSize = 10
    notificationLabel.Font = Enum.Font.Gotham
    notificationLabel.TextWrapped = true
    notificationLabel.TextXAlignment = Enum.TextXAlignment.Left
    notificationLabel.TextYAlignment = Enum.TextYAlignment.Top
    notificationLabel.Parent = notification

    LibraryData.ThemeElements[notification] = {Background = "ElementBackground"}
    LibraryData.ThemeElements[notificationLabel] = {Text = "TextPrimary"}

    local tweenIn = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)})
    tweenIn:Play()

    task.spawn(function()
        task.wait(3)
        local tweenOut = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0, 200, 0, 0)})
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            notification:Destroy()
        end)
    end)
end

function Flint:CreateTab(libData, name, icon, autoSelect)
    local tabCount = #libData.Tabs + 1
    local yOffset = 55 + (#libData.Tabs * 40)
    icon = icon or tostring(tabCount)

    local tabButton = Instance.new("TextButton")
    tabButton.Name = name .. "Button"
    tabButton.Size = UDim2.new(1, -20, 0, 35)
    tabButton.Position = UDim2.new(0, 10, 0, yOffset)
    tabButton.BackgroundColor3 = GetTheme().ElementBackground
    tabButton.BackgroundTransparency = Config.Transparency
    tabButton.BorderSizePixel = 0
    tabButton.Text = ""
    tabButton.AutoButtonColor = false
    tabButton.Parent = libData.Sidebar

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = tabButton

    local buttonLabel = Instance.new("TextLabel")
    buttonLabel.Size = UDim2.new(1, -35, 1, 0)
    buttonLabel.Position = UDim2.new(0, 30, 0, 0)
    buttonLabel.BackgroundTransparency = 1
    buttonLabel.Text = name
    buttonLabel.TextColor3 = GetTheme().TextSecondary
    buttonLabel.TextTransparency = Config.Transparency
    buttonLabel.TextSize = 12
    buttonLabel.Font = Enum.Font.Gotham
    buttonLabel.TextXAlignment = Enum.TextXAlignment.Left
    buttonLabel.Parent = tabButton

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 18, 0, 18)
    iconLabel.Position = UDim2.new(0, 8, 0.5, -9)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextColor3 = GetTheme().TextSecondary
    iconLabel.TextTransparency = Config.Transparency
    iconLabel.TextSize = 14
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = tabButton

    local tabContent = Instance.new("ScrollingFrame")
    tabContent.Name = name .. "Content"
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.Position = UDim2.new(0, 0, 0, 0)
    tabContent.BackgroundTransparency = 1
    tabContent.BorderSizePixel = 0
    tabContent.ScrollBarThickness = 3
    tabContent.ScrollBarImageColor3 = GetTheme().DarkElement
    tabContent.ScrollBarImageTransparency = Config.Transparency
    tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabContent.Visible = false
    tabContent.Parent = libData.ContentFrame

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.Parent = tabContent

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabContent.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 15)
    end)

    LibraryData.ThemeElements[tabButton] = {Background = "ElementBackground"}
    LibraryData.ThemeElements[buttonLabel] = {Text = "TextSecondary"}
    LibraryData.ThemeElements[iconLabel] = {Text = "TextSecondary"}
    LibraryData.ThemeElements[tabContent] = {ScrollBar = "DarkElement"}

    local tabData = {
        Name = name,
        Button = tabButton,
        Label = buttonLabel,
        Icon = iconLabel,
        Content = tabContent,
        Elements = {}
    }

    table.insert(libData.Tabs, tabData)

    local function SwitchTab()
        libData.CurrentTab = tabData
        for _, tab in pairs(libData.Tabs) do
            tab.Content.Visible = false
            tab.Button.BackgroundColor3 = GetTheme().ElementBackground
            tab.Label.TextColor3 = GetTheme().TextSecondary
            tab.Icon.TextColor3 = GetTheme().TextSecondary
        end
        libData.SettingsFrame.Visible = false
        libData.ContentFrame.Visible = true
        tabContent.Visible = true
        tabButton.BackgroundColor3 = GetTheme().Primary
        buttonLabel.TextColor3 = GetTheme().Background
        iconLabel.TextColor3 = GetTheme().Background
        libData.SettingsButton.BackgroundColor3 = GetTheme().ElementBackground
        libData.SettingsButton.TextColor3 = GetTheme().TextPrimary
    end

    tabButton.MouseButton1Click:Connect(SwitchTab)

    if autoSelect or #libData.Tabs == 1 then
        SwitchTab()
    end

    return tabContent
end

function Flint:CreateSection(parent, text)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, -15, 0, 25)
    section.BackgroundTransparency = 1
    section.Parent = parent

    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Size = UDim2.new(1, 0, 1, 0)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Text = text
    sectionLabel.TextColor3 = GetTheme().Primary
    sectionLabel.TextTransparency = Config.Transparency
    sectionLabel.TextSize = 13
    sectionLabel.Font = Enum.Font.GothamBold
    sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    sectionLabel.Parent = section

    LibraryData.ThemeElements[sectionLabel] = {Text = "TextPrimary"}

    return section
end

function Flint:CreateToggle(parent, text, defaultValue, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, -15, 0, 35)
    toggleFrame.BackgroundColor3 = GetTheme().ElementBackground
    toggleFrame.BackgroundTransparency = Config.Transparency
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = parent

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleFrame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = GetTheme().TextPrimary
    label.TextTransparency = Config.Transparency
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggleFrame

    local toggled = defaultValue or false

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 35, 0, 18)
    toggleButton.Position = UDim2.new(1, -42, 0.5, -9)
    toggleButton.BackgroundColor3 = toggled and GetTheme().Primary or GetTheme().DarkElement
    toggleButton.BackgroundTransparency = Config.Transparency
    toggleButton.Text = ""
    toggleButton.AutoButtonColor = false
    toggleButton.Parent = toggleFrame

    local toggleButtonCorner = Instance.new("UICorner")
    toggleButtonCorner.CornerRadius = UDim.new(1, 0)
    toggleButtonCorner.Parent = toggleButton

    local toggleCircle = Instance.new("Frame")
    toggleCircle.Size = UDim2.new(0, 14, 0, 14)
    toggleCircle.Position = toggled and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
    toggleCircle.BackgroundColor3 = GetTheme().Background
    toggleCircle.BackgroundTransparency = Config.Transparency
    toggleCircle.BorderSizePixel = 0
    toggleCircle.Parent = toggleButton

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = toggleCircle

    toggleButton.MouseButton1Click:Connect(function()
        toggled = not toggled
        local colorTween = TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = toggled and GetTheme().Primary or GetTheme().DarkElement})
        local posTween = TweenService:Create(toggleCircle, TweenInfo.new(0.2), {Position = toggled and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)})
        colorTween:Play()
        posTween:Play()
        if callback then
            callback(toggled)
        end
    end)

    LibraryData.ThemeElements[toggleFrame] = {Background = "ElementBackground"}
    LibraryData.ThemeElements[label] = {Text = "TextPrimary"}
    LibraryData.ThemeElements[toggleButton] = {Background = toggled and "Primary" or "DarkElement"}
    LibraryData.ThemeElements[toggleCircle] = {Background = "Background"}

    return toggleFrame
end

function Flint:CreateSlider(parent, text, min, max, defaultValue, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -15, 0, 50)
    sliderFrame.BackgroundColor3 = GetTheme().ElementBackground
    sliderFrame.BackgroundTransparency = Config.Transparency
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = parent

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 8)
    sliderCorner.Parent = sliderFrame

    local currentValue = defaultValue or min

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -25, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 4)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = GetTheme().TextPrimary
    label.TextTransparency = Config.Transparency
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = sliderFrame

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0, 45, 0, 18)
    valueLabel.Position = UDim2.new(1, -55, 0, 4)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(currentValue)
    valueLabel.TextColor3 = GetTheme().TextSecondary
    valueLabel.TextTransparency = Config.Transparency
    valueLabel.TextSize = 10
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = sliderFrame

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, -24, 0, 5)
    sliderBar.Position = UDim2.new(0, 12, 0, 30)
    sliderBar.BackgroundColor3 = GetTheme().DarkElement
    sliderBar.BackgroundTransparency = Config.Transparency
    sliderBar.BorderSizePixel = 0
    sliderBar.Parent = sliderFrame

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = sliderBar

    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((currentValue - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = GetTheme().Primary
    sliderFill.BackgroundTransparency = Config.Transparency
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBar

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill

    local sliderButton = Instance.new("TextButton")
    sliderButton.Size = UDim2.new(1, 0, 1, 20)
    sliderButton.Position = UDim2.new(0, 0, 0, -10)
    sliderButton.BackgroundTransparency = 1
    sliderButton.Text = ""
    sliderButton.Parent = sliderBar

    local draggingSlider = false

    local function updateSlider(input)
        local percent = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * percent)
        currentValue = value
        sliderFill.Size = UDim2.new(percent, 0, 1, 0)
        valueLabel.Text = tostring(value)
        if callback then
            callback(value)
        end
    end

    sliderButton.MouseButton1Down:Connect(function()
        draggingSlider = true
    end)

    sliderButton.TouchTap:Connect(function(touchPositions)
        updateSlider({Position = touchPositions[1]})
    end)

    UserInputService.InputChanged:Connect(function(input)
        if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = false
        end
    end)

    LibraryData.ThemeElements[sliderFrame] = {Background = "ElementBackground"}
    LibraryData.ThemeElements[label] = {Text = "TextPrimary"}
    LibraryData.ThemeElements[valueLabel] = {Text = "TextSecondary"}
    LibraryData.ThemeElements[sliderBar] = {Background = "DarkElement"}
    LibraryData.ThemeElements[sliderFill] = {Background = "Primary"}

    return sliderFrame
end

function Flint:CreateKeybind(parent, text, defaultKey, callback)
    local keybindFrame = Instance.new("Frame")
    keybindFrame.Size = UDim2.new(1, -15, 0, 35)
    keybindFrame.BackgroundColor3 = GetTheme().ElementBackground
    keybindFrame.BackgroundTransparency = Config.Transparency
    keybindFrame.BorderSizePixel = 0
    keybindFrame.Parent = parent

    local keybindCorner = Instance.new("UICorner")
    keybindCorner.CornerRadius = UDim.new(0, 8)
    keybindCorner.Parent = keybindFrame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -100, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = GetTheme().TextPrimary
    label.TextTransparency = Config.Transparency
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = keybindFrame

    local currentKey = defaultKey or Enum.KeyCode.Unknown

    local keybindButton = Instance.new("TextButton")
    keybindButton.Size = UDim2.new(0, 80, 0, 25)
    keybindButton.Position = UDim2.new(1, -88, 0.5, -12.5)
    keybindButton.BackgroundColor3 = GetTheme().DarkElement
    keybindButton.BackgroundTransparency = Config.Transparency
    keybindButton.BorderSizePixel = 0
    keybindButton.Text = currentKey.Name
    keybindButton.TextColor3 = GetTheme().TextPrimary
    keybindButton.TextTransparency = Config.Transparency
    keybindButton.TextSize = 10
    keybindButton.Font = Enum.Font.Gotham
    keybindButton.Parent = keybindFrame

    local keybindButtonCorner = Instance.new("UICorner")
    keybindButtonCorner.CornerRadius = UDim.new(0, 6)
    keybindButtonCorner.Parent = keybindButton

    local listening = false

    keybindButton.MouseButton1Click:Connect(function()
        if not listening then
            listening = true
            keybindButton.Text = "..."
            keybindButton.BackgroundColor3 = GetTheme().Primary
            keybindButton.TextColor3 = GetTheme().Background
        end
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if listening and input.UserInputType == Enum.UserInputType.Keyboard then
            listening = false
            currentKey = input.KeyCode
            keybindButton.Text = input.KeyCode.Name
            keybindButton.BackgroundColor3 = GetTheme().DarkElement
            keybindButton.TextColor3 = GetTheme().TextPrimary
            if callback then
                callback(input.KeyCode)
            end
        end
    end)

    LibraryData.ThemeElements[keybindFrame] = {Background = "ElementBackground"}
    LibraryData.ThemeElements[label] = {Text = "TextPrimary"}
    LibraryData.ThemeElements[keybindButton] = {Background = "DarkElement", Text = "TextPrimary"}

    return keybindFrame
end

function Flint:CreateDropdown(parent, text, options, defaultValue, callback)
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Size = UDim2.new(1, -15, 0, 35)
    dropdownFrame.BackgroundColor3 = GetTheme().ElementBackground
    dropdownFrame.BackgroundTransparency = Config.Transparency
    dropdownFrame.BorderSizePixel = 0
    dropdownFrame.Parent = parent

    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 8)
    dropdownCorner.Parent = dropdownFrame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -120, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = GetTheme().TextPrimary
    label.TextTransparency = Config.Transparency
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = dropdownFrame

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Size = UDim2.new(0, 100, 0, 25)
    dropdownButton.Position = UDim2.new(1, -108, 0.5, -12.5)
    dropdownButton.BackgroundColor3 = GetTheme().DarkElement
    dropdownButton.BackgroundTransparency = Config.Transparency
    dropdownButton.BorderSizePixel = 0
    dropdownButton.Text = defaultValue or "Select"
    dropdownButton.TextColor3 = GetTheme().TextPrimary
    dropdownButton.TextTransparency = Config.Transparency
    dropdownButton.TextSize = 10
    dropdownButton.Font = Enum.Font.Gotham
    dropdownButton.TextTruncate = Enum.TextTruncate.AtEnd
    dropdownButton.Parent = dropdownFrame

    local dropdownButtonCorner = Instance.new("UICorner")
    dropdownButtonCorner.CornerRadius = UDim.new(0, 6)
    dropdownButtonCorner.Parent = dropdownButton

    local dropdownContainer = LibraryData.DropdownContainer

    local dropdownList = Instance.new("ScrollingFrame")
    dropdownList.Size = UDim2.new(0, 100, 0, 0)
    dropdownList.BackgroundColor3 = GetTheme().ElementBackground
    dropdownList.BackgroundTransparency = Config.Transparency
    dropdownList.BorderSizePixel = 0
    dropdownList.ScrollBarThickness = 3
    dropdownList.ScrollBarImageColor3 = GetTheme().DarkElement
    dropdownList.ScrollBarImageTransparency = Config.Transparency
    dropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)
    dropdownList.Visible = false
    dropdownList.ClipsDescendants = true
    dropdownList.ZIndex = 1000
    dropdownList.Parent = dropdownContainer

    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 6)
    listCorner.Parent = dropdownList

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.Name
    listLayout.Padding = UDim.new(0, 2)
    listLayout.Parent = dropdownList

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        dropdownList.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 4)
    end)

    local isOpen = false
    local selectedValue = defaultValue

    local function updateOptions()
        for _, child in pairs(dropdownList:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end

        for _, option in pairs(options) do
            local optionButton = Instance.new("TextButton")
            optionButton.Size = UDim2.new(1, -4, 0, 25)
            optionButton.BackgroundColor3 = GetTheme().DarkElement
            optionButton.BackgroundTransparency = Config.Transparency
            optionButton.BorderSizePixel = 0
            optionButton.Text = option
            optionButton.TextColor3 = GetTheme().TextPrimary
            optionButton.TextTransparency = Config.Transparency
            optionButton.TextSize = 9
            optionButton.Font = Enum.Font.Gotham
            optionButton.TextTruncate = Enum.TextTruncate.AtEnd
            optionButton.ZIndex = 1001
            optionButton.Parent = dropdownList

            local optionCorner = Instance.new("UICorner")
            optionCorner.CornerRadius = UDim.new(0, 4)
            optionCorner.Parent = optionButton

            optionButton.MouseButton1Click:Connect(function()
                selectedValue = option
                dropdownButton.Text = option
                isOpen = false
                TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 100, 0, 0)}):Play()
                task.wait(0.2)
                dropdownList.Visible = false
                if callback then
                    callback(option)
                end
            end)

            optionButton.MouseEnter:Connect(function()
                optionButton.BackgroundColor3 = GetTheme().Hover
            end)

            optionButton.MouseLeave:Connect(function()
                optionButton.BackgroundColor3 = GetTheme().DarkElement
            end)

            LibraryData.ThemeElements[optionButton] = {Background = "DarkElement", Text = "TextPrimary"}
        end
    end

    dropdownButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if isOpen then
            updateOptions()
            local buttonPos = dropdownButton.AbsolutePosition
            local buttonSize = dropdownButton.AbsoluteSize
            dropdownList.Position = UDim2.new(0, buttonPos.X, 0, buttonPos.Y + buttonSize.Y + 5)
            dropdownList.Visible = true
            local targetHeight = math.min(listLayout.AbsoluteContentSize.Y + 4, 150)
            TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 100, 0, targetHeight)}):Play()
        else
            TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 100, 0, 0)}):Play()
            task.wait(0.2)
            dropdownList.Visible = false
        end
    end)

    LibraryData.ThemeElements[dropdownFrame] = {Background = "ElementBackground"}
    LibraryData.ThemeElements[label] = {Text = "TextPrimary"}
    LibraryData.ThemeElements[dropdownButton] = {Background = "DarkElement", Text = "TextPrimary"}
    LibraryData.ThemeElements[dropdownList] = {Background = "ElementBackground", ScrollBar = "DarkElement"}

    return dropdownFrame
end

function Flint:CreateTextBox(parent, text, defaultValue, callback)
    local textboxFrame = Instance.new("Frame")
    textboxFrame.Size = UDim2.new(1, -15, 0, 50)
    textboxFrame.BackgroundColor3 = GetTheme().ElementBackground
    textboxFrame.BackgroundTransparency = Config.Transparency
    textboxFrame.BorderSizePixel = 0
    textboxFrame.Parent = parent

    local textboxCorner = Instance.new("UICorner")
    textboxCorner.CornerRadius = UDim.new(0, 8)
    textboxCorner.Parent = textboxFrame

    local currentValue = defaultValue or ""

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -25, 0, 18)
    label.Position = UDim2.new(0, 12, 0, 4)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = GetTheme().TextPrimary
    label.TextTransparency = Config.Transparency
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = textboxFrame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, -24, 0, 22)
    textBox.Position = UDim2.new(0, 12, 0, 24)
    textBox.BackgroundColor3 = GetTheme().DarkElement
    textBox.BackgroundTransparency = Config.Transparency
    textBox.BorderSizePixel = 0
    textBox.Text = tostring(currentValue)
    textBox.TextColor3 = GetTheme().TextPrimary
    textBox.TextTransparency = Config.Transparency
    textBox.TextSize = 11
    textBox.Font = Enum.Font.Gotham
    textBox.ClearTextOnFocus = false
    textBox.Parent = textboxFrame

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 6)
    boxCorner.Parent = textBox

    textBox.FocusLost:Connect(function()
        currentValue = textBox.Text
        if callback then
            callback(textBox.Text)
        end
    end)

    LibraryData.ThemeElements[textboxFrame] = {Background = "ElementBackground"}
    LibraryData.ThemeElements[label] = {Text = "TextPrimary"}
    LibraryData.ThemeElements[textBox] = {Background = "DarkElement", Text = "TextPrimary"}

    return textboxFrame
end

function Flint:CreateButton(parent, text, callback)
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, -15, 0, 35)
    buttonFrame.BackgroundColor3 = GetTheme().ElementBackground
    buttonFrame.BackgroundTransparency = Config.Transparency
    buttonFrame.BorderSizePixel = 0
    buttonFrame.Parent = parent

    local buttonFrameCorner = Instance.new("UICorner")
    buttonFrameCorner.CornerRadius = UDim.new(0, 8)
    buttonFrameCorner.Parent = buttonFrame

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -24, 0, 25)
    button.Position = UDim2.new(0, 12, 0.5, -12.5)
    button.BackgroundColor3 = GetTheme().Primary
    button.BackgroundTransparency = Config.Transparency
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = GetTheme().TextPrimary
    button.TextTransparency = Config.Transparency
    button.TextSize = 11
    button.Font = Enum.Font.GothamBold
    button.Parent = buttonFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button

    button.MouseButton1Click:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = GetTheme().DarkElement}):Play()
        task.wait(0.1)
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = GetTheme().Primary}):Play()
        if callback then
            callback()
        end
    end)

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = GetTheme().Secondary}):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = GetTheme().Primary}):Play()
    end)

    LibraryData.ThemeElements[buttonFrame] = {Background = "ElementBackground"}
    LibraryData.ThemeElements[button] = {Background = "Primary", Text = "TextPrimary"}

    return buttonFrame
end

return Flint