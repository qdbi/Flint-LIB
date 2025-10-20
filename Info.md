
# Flint-LIB UI Library

## Overview

Flint-LIB is a lightweight and customizable UI library for Roblox, designed to create graphical user interfaces with ease. It supports a variety of UI elements, including windows, tabs, sections, toggles, sliders, keybinds, dropdowns, text boxes, and buttons. The library is compatible with Roblox executors and handles GUI parenting in `PlayerGui`. It offers real-time theme switching, drag functionality, minimize/restore features, and notifications, making it suitable for creating intuitive and visually appealing interfaces.

## Features

- **Window Creation**: Create customizable windows with configurable title, size, and position.
- **Tabs**: Organize content into tabs with automatic numbering or custom icons (Settings tab uses a gear icon).
- **UI Elements**:
  - **Sections**: Group elements with labeled headers.
  - **Toggles**: Enable/disable features with callbacks.
  - **Sliders**: Adjust numerical values within a specified range.
  - **Keybinds**: Assign keyboard shortcuts for actions.
  - **Dropdowns**: Select from a list of options.
  - **Text Boxes**: Input text with validation.
  - **Buttons**: Trigger actions with a click.
- **Themes**: Switch between predefined themes (e.g., Default, Dark, Light, Blue, Purple) with real-time updates to colors for backgrounds, text, and elements.
- **Notifications**: Display temporary messages in the bottom-right corner for user feedback.
- **Drag and Minimize**: Drag the window via the top bar or minimize it to an icon for quick access.
- **Toggle Keybind**: Show/hide the GUI with a customizable key (default: RightShift).

## Installation

1. **Host the Library**: Host the `UILibrary.lua` file on a public server (e.g., GitHub raw URL) for use with `loadstring`.
   - Example URL: `https://raw.githubusercontent.com/qdbi/Flint-LIB/refs/heads/main/UILibrary.lua`
2. **Load the Library**: In your Roblox script, use `loadstring` to fetch and execute the library:
   ```lua
   local Flint = loadstring(game:HttpGet("https://raw.githubusercontent.com/qdbi/Flint-LIB/refs/heads/main/UILibrary.lua"))()
   ```
3. **Initialize the GUI**: Create a window using `Flint:Init()` or `Flint:CreateWindow(options)` to start building your interface.
4. **Test the GUI**: Execute the script in a Roblox executor and press the toggle key (default: RightShift) to verify the GUI appears.

## Usage

### Creating a Window
Initialize a window with optional parameters for title, size, and position:
```lua
local libData = Flint:CreateWindow({
    Title = "My Custom GUI",
    Size = UDim2.new(0, 500, 0, 350),
    Position = UDim2.new(0.5, -250, 0.5, -175)
})
```
- `Title`: Window title (default: "Flint UI Library - v3.0").
- `Size`: Window size as `UDim2` (default: 500x350 pixels).
- `Position`: Window position as `UDim2` (default: centered).

### Creating Tabs
Add tabs to organize content. The first tab is selected by default unless specified:
```lua
local tab = Flint:CreateTab(libData, "Main", "1", true)
local settingsTab = Flint:CreateTab(libData, "Settings", nil, false)
```
- `name`: Tab name (e.g., "Main", "Settings").
- `icon`: Custom icon or number (Settings uses "⚙️").
- `autoSelect`: Set to `true` to select the tab on creation.

### Adding UI Elements
Add elements to tabs for user interaction:

#### Section
Group elements with a header:
```lua
Flint:CreateSection(tab, "General Settings")
```

#### Toggle
Create a toggle with a default state and callback:
```lua
Flint:CreateToggle(tab, "Enable Feature", false, function(state)
    print("Feature is", state and "enabled" or "disabled")
end)
```

#### Slider
Create a slider for numerical input:
```lua
Flint:CreateSlider(tab, "Speed", 0, 100, 50, function(value)
    print("Speed set to", value)
end)
```

#### Keybind
Set a keybind with a default key and callback:
```lua
Flint:CreateKeybind(tab, "Action Key", Enum.KeyCode.E, function(key)
    print("New key:", key.Name)
end)
```

#### Dropdown
Create a dropdown for selecting options:
```lua
Flint:CreateDropdown(tab, "Choose Option", {"Option1", "Option2"}, "Option1", function(selected)
    print("Selected:", selected)
end)
```

#### Text Box
Create a text box for user input:
```lua
Flint:CreateTextBox(tab, "Enter Text", "Default", function(text)
    print("Text entered:", text)
end)
```

#### Button
Create a button to trigger an action:
```lua
Flint:CreateButton(tab, "Click Me", function()
    print("Button clicked")
end)
```

### Notifications
Display a temporary message:
```lua
Flint:Notify("Action completed successfully")
```

### Settings Tab
The Settings tab is automatically created when a tab named "Settings" is added. It includes:
- **Drag Smoothing**: Slider to adjust GUI drag smoothness (1-100).
- **Toggle GUI Keybind**: Keybind to change the GUI toggle key.
- **Select Theme**: Dropdown to switch themes (e.g., Default, Dark, Light).

### Themes
Switch themes via the Settings tab or programmatically:
```lua
Config.CurrentTheme = "Dark"
ApplyTheme(libData.ThemeElements)
```
Predefined themes include Default, Dark, Light, Blue, Purple, Green, Red, Orange, Pink, Cyan, Yellow, and Midnight. Each theme defines colors for:
- `Primary`, `Secondary`, `Tertiary`: Accent colors.
- `Background`, `SecondaryBackground`, `ElementBackground`: Backgrounds.
- `DarkElement`, `Hover`: Element-specific colors.
- `TextPrimary`, `TextSecondary`: Text colors.

## Customization

### Adding New Themes
Add custom themes to the `Themes` table in `UILibrary.lua`:
```lua
Themes.CustomTheme = {
    Primary = Color3.fromRGB(100, 100, 100),
    Secondary = Color3.fromRGB(120, 120, 120),
    Tertiary = Color3.fromRGB(140, 140, 140),
    Background = Color3.fromRGB(20, 20, 20),
    SecondaryBackground = Color3.fromRGB(30, 30, 30),
    ElementBackground = Color3.fromRGB(40, 40, 40),
    DarkElement = Color3.fromRGB(80, 80, 80),
    Hover = Color3.fromRGB(100, 100, 100),
    TextPrimary = Color3.fromRGB(200, 200, 200),
    TextSecondary = Color3.fromRGB(160, 160, 160)
}
```
Update the `Select Theme` dropdown in `CreateTab` to include the new theme:
```lua
table.insert(themeNames, "CustomTheme")
```

### Modifying Window Properties
Adjust window properties in `Flint:CreateWindow`:
```lua
Flint:CreateWindow({
    Title = "Custom UI",
    Size = UDim2.new(0, 600, 0, 400),
    Position = UDim2.new(0.5, -300, 0.5, -200)
})
```

### Extending Functionality
- **Custom Elements**: Extend the library by adding new element types (e.g., color pickers, image buttons) in `UILibrary.lua`.
- **Dynamic Updates**: Modify `ApplyTheme` to support additional properties (e.g., `BorderColor3`, `ImageColor3`).
- **Event Handling**: Add custom input handling in `CreateWindow` for advanced interactions (e.g., mouse wheel, multi-touch).

## Troubleshooting

- **GUI Not Loading**:
  - Verify the `loadstring` URL is accessible and points to the correct `UILibrary.lua`.
  - Ensure the executor supports `loadstring` and GUI parenting.
  - Check `ScreenGui` parent:
    ```lua
    print(libData.ScreenGui.Parent.Name)
    ```
- **Theme Issues**:
  - If text is unreadable, confirm `TextPrimary` and `TextSecondary` contrast with background colors in the `Themes` table.
  - Debug theme application:
    ```lua
    print("Applying theme to", element.Name, "Background:", propertyData.Background, "Text:", propertyData.Text)
    ```
- **Element Malfunction**:
  - Ensure elements are parented to a valid tab’s `ContentFrame`.
  - Check for executor-specific rendering issues with `TextButton` or `TextBox`.
- **Performance**:
  - Reduce the number of elements or simplify themes for low-end devices.
  - Limit notification frequency to avoid overlapping.

## Notes
- **Version**: 3.0
- **Executor Support**: Requires an executor that supports `loadstring`, `game:HttpGet`, `TweenService`, `UserInputService`, and Roblox GUI objects (`ScreenGui`, `Frame`, `TextButton`, `TextBox`, `TextLabel`, `ScrollingFrame`).
- **Ethical Use**: Use in private testing environments to comply with Roblox’s Terms of Service.
- **Maintenance**: Check the hosted library URL regularly for updates or host your own version to ensure reliability.

For issues or feature requests, refer to the library’s source repository or contact the developer.

 - @ly.arv on discord.