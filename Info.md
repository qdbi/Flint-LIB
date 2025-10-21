# Flint-LIB UI Library

## Overview

Flint-LIB is a lightweight and customizable UI library for Roblox, designed to create graphical user interfaces with ease. It supports a variety of UI elements, including windows, tabs, sections, toggles, sliders, keybinds, dropdowns, text boxes, and buttons. The library is compatible with Roblox executors and handles GUI parenting in `PlayerGui` (or `CoreGui` with `syn` protection). It offers real-time theme switching, drag functionality, minimize/restore features, configuration saving/loading, and notifications, making it suitable for creating intuitive and visually appealing interfaces.

## Features

- **Window Creation**: Create customizable windows with configurable title, size, and position.
- **Tabs**: Organize content into tabs with automatic numbering or custom icons. Tabs are dynamically numbered unless a custom icon is provided.
- **UI Elements**:
  - **Sections**: Group elements with labeled headers.
  - **Toggles**: Enable/disable features with callbacks and smooth animations.
  - **Sliders**: Adjust numerical values within a specified range with real-time feedback.
  - **Keybinds**: Assign keyboard shortcuts for actions with interactive key binding.
  - **Dropdowns**: Select from a list of options with a scrollable dropdown menu.
  - **Text Boxes**: Input text with validation and focus loss callbacks.
  - **Buttons**: Trigger actions with a click and hover effects.
- **Themes**: Switch between 12 predefined themes (Default, Dark, Light, Blue, Purple, Green, Red, Orange, Pink, Cyan, Yellow, Midnight) with real-time updates to colors for backgrounds, text, and elements.
- **Configuration**: Save and load UI settings (theme, keybind, drag smoothing, transparency, scale, tab layout) to/from a JSON file (`FlintUI_Config.json`).
- **Notifications**: Display temporary messages in the bottom-right corner for user feedback with smooth animations.
- **Drag and Minimize**: Drag the window via the top bar or minimize it to an icon for quick access.
- **Toggle Keybind**: Show/hide the GUI with a customizable key (default: RightShift).
- **Settings Panel**: Built-in settings panel with UI customization options (drag smoothing, transparency, scale, keybind, theme, tab layout).
- **Tab Layout**: Choose between horizontal (default) or vertical tab layouts with smooth transitions.
- **UI Scale**: Adjust the overall scale of the UI (50%-150%) for different screen sizes.
- **UI Transparency**: Adjust the transparency of UI elements (0%-50%) for better visibility or aesthetics.

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
    Size = UDim2.new(0, 600, 0, 350),
    Position = UDim2.new(0.5, -300, 0.5, -175)
})
```
- `Title`: Window title (default: "Flint UI Library - v3.0").
- `Size`: Window size as `UDim2` (default: 600x350 pixels).
- `Position`: Window position as `UDim2` (default: centered).

**Note**: The `Flint:Init()` function is a shorthand for creating a window with default settings.

### Creating Tabs
Add tabs to organize content. Tabs are automatically numbered unless a custom icon is provided. The first tab is selected by default unless `autoSelect` is specified:
```lua
local tab = Flint:CreateTab(libData, "Main", nil, true)
local settingsTab = Flint:CreateTab(libData, "Settings", "⚙️", false)
```
- `name`: Tab name (e.g., "Main", "Settings").
- `icon`: Custom icon (optional). If `nil`, the tab is automatically numbered starting from 1.
- `autoSelect`: Set to `true` to select the tab on creation. If not specified, the first tab is auto-selected.

**Tab Count**: The library maintains an internal tab counter (`LibraryData.TabCount`) to automatically number tabs when no custom icon is provided.

### Adding UI Elements
Add elements to tabs for user interaction. All elements support the current theme and transparency settings.

#### Section
Group elements with a header:
```lua
Flint:CreateSection(tab, "General Settings")
```

#### Toggle
Create a toggle with a default state and callback. Features smooth animations for the toggle switch:
```lua
Flint:CreateToggle(tab, "Enable Feature", false, function(state)
    print("Feature is", state and "enabled" or "disabled")
end)
```

#### Slider
Create a slider for numerical input with real-time value display:
```lua
Flint:CreateSlider(tab, "Speed", 0, 100, 50, function(value)
    print("Speed set to", value)
end)
```
- **Touch Support**: The slider supports both mouse and touch input for mobile compatibility.

#### Keybind
Set a keybind with a default key and callback. Click the button to enter listening mode and press any key to bind:
```lua
Flint:CreateKeybind(tab, "Action Key", Enum.KeyCode.E, function(key)
    print("New key:", key.Name)
end)
```

#### Dropdown
Create a dropdown for selecting options. The dropdown appears as an overlay with smooth animations:
```lua
Flint:CreateDropdown(tab, "Choose Option", {"Option1", "Option2", "Option3"}, "Option1", function(selected)
    print("Selected:", selected)
end)
```
- **Scrollable**: Dropdowns are scrollable if the content exceeds 150 pixels in height.
- **Z-Index**: Dropdowns render at high z-index (1000+) to appear above other UI elements.

#### Text Box
Create a text box for user input with focus loss callback:
```lua
Flint:CreateTextBox(tab, "Enter Text", "Default", function(text)
    print("Text entered:", text)
end)
```

#### Button
Create a button to trigger an action with hover and click effects:
```lua
Flint:CreateButton(tab, "Click Me", function()
    print("Button clicked")
end)
```

### Notifications
Display a temporary message in the bottom-right corner. Notifications automatically fade out after 3 seconds:
```lua
Flint:Notify("Action completed successfully")
```

### Settings Panel
The Settings Panel is a built-in feature accessible via the gear icon (⚙) in the top bar. It includes the following options:

#### UI Settings
- **Drag Smoothing**: Slider (1-100) to adjust GUI drag smoothness. Higher values = smoother dragging.
- **UI Transparency**: Slider (0-50%) to adjust the transparency of UI elements.
- **UI Scale**: Slider (50-150%) to adjust the overall scale of the UI.
- **Toggle GUI Keybind**: Keybind to change the GUI toggle key (default: RightShift).
- **Tab Layout**: Dropdown to switch between "Horizontal" and "Vertical" tab layouts with smooth transitions.

#### Theme Settings
- **Select Theme**: Dropdown to switch between 12 predefined themes. Theme changes apply instantly to all UI elements.

#### Configuration
- **Save Configuration**: Button to save current settings to `FlintUI_Config.json` (requires `writefile` support).
- **Load Configuration**: Button to load settings from `FlintUI_Config.json` (requires `readfile` and `isfile` support).

**Accessing the Settings Panel**:
```lua
-- Click the gear icon (⚙) in the top bar to toggle the settings panel
```

### Tab Layout
Switch between horizontal and vertical tab layouts:
```lua
Config.TabLayout = "Vertical" -- or "Horizontal"
```
- **Horizontal Layout**: Tabs appear in a row at the top of the window (default).
- **Vertical Layout**: Tabs appear in a column on the left side of the window. The window automatically resizes to 750x350 pixels.
- **Smooth Transitions**: Layout changes are animated with `TweenService` for a polished user experience.

### Themes
Switch themes via the Settings Panel or programmatically:
```lua
Config.CurrentTheme = "Dark"
ApplyTheme(LibraryData.ThemeElements)
```

Available themes:
- **Default**: Neutral gray tones
- **Dark**: Cool dark blues with muted accents
- **Light**: Bright blue accents on light backgrounds
- **Blue**: Vibrant blue theme
- **Purple**: Rich purple theme
- **Green**: Fresh green theme
- **Red**: Bold red theme
- **Orange**: Warm orange theme
- **Pink**: Playful pink theme
- **Cyan**: Cool cyan theme
- **Yellow**: Bright yellow theme
- **Midnight**: Deep blue-black theme

Each theme defines colors for:
- `Primary`, `Secondary`, `Tertiary`: Accent colors for highlights and interactive elements.
- `Background`, `SecondaryBackground`, `ElementBackground`: Background colors for main frame, top bar, and UI elements.
- `DarkElement`, `Hover`: Element-specific colors for sliders, dropdowns, and hover states.
- `TextPrimary`, `TextSecondary`: Text colors for labels and values.

### Configuration Saving/Loading
Save and load UI settings to persist across sessions:

#### Saving Configuration
```lua
Flint:SaveConfig()
```
- Saves the current configuration to `FlintUI_Config.json` in the executor's workspace folder.
- Requires `writefile` support (available in most modern executors).
- Saved settings include: `CurrentTheme`, `DragSmoothing`, `ToggleKeybind`, `UITransparency`, `TabLayout`, `UIScale`.

#### Loading Configuration
```lua
Flint:LoadConfig()
```
- Loads the configuration from `FlintUI_Config.json` if it exists.
- Requires `readfile` and `isfile` support.
- Automatically applies loaded settings to the UI.

**Example**:
```lua
-- Save configuration when closing the GUI
Flint:SaveConfig()

-- Load configuration when initializing the GUI
Flint:LoadConfig()
ApplyTheme(LibraryData.ThemeElements)
```

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
The new theme will automatically appear in the "Select Theme" dropdown in the Settings Panel.

### Modifying Window Properties
Adjust window properties in `Flint:CreateWindow`:
```lua
Flint:CreateWindow({
    Title = "Custom UI",
    Size = UDim2.new(0, 700, 0, 400),
    Position = UDim2.new(0.5, -350, 0.5, -200)
})
```

### Extending Functionality
- **Custom Elements**: Extend the library by adding new element types (e.g., color pickers, image buttons, multi-select dropdowns) by creating new `Flint:CreateX` functions.
- **Dynamic Updates**: Modify `ApplyTheme` to support additional properties (e.g., `BorderColor3`, `ImageColor3`) for more advanced theming.
- **Event Handling**: Add custom input handling in `CreateWindow` for advanced interactions (e.g., mouse wheel, multi-touch gestures).
- **Persistent Data**: Extend `SaveConfig` and `LoadConfig` to save element-specific data (e.g., toggle states, slider values).

## API Reference

### Core Functions

#### `Flint:CreateWindow(options)`
Creates the main GUI window.
- **Parameters**:
  - `options` (table, optional): Configuration options.
    - `Title` (string): Window title (default: "Flint UI Library - v3.0").
    - `Size` (UDim2): Window size (default: 600x350).
    - `Position` (UDim2): Window position (default: centered).
- **Returns**: `libData` table containing GUI references and theme elements.

#### `Flint:Init()`
Shorthand for `Flint:CreateWindow()` with default settings.
- **Returns**: `libData` table.

#### `Flint:CreateTab(libData, name, icon, autoSelect)`
Creates a new tab.
- **Parameters**:
  - `libData` (table): Library data from `CreateWindow`.
  - `name` (string): Tab name.
  - `icon` (string, optional): Custom icon. If `nil`, the tab is auto-numbered.
  - `autoSelect` (boolean, optional): If `true`, selects the tab on creation.
- **Returns**: `tabContent` (ScrollingFrame) for adding elements.

#### `Flint:CreateSection(parent, text)`
Creates a section header.
- **Parameters**:
  - `parent` (Instance): Parent container (tab or settings panel).
  - `text` (string): Section title.
- **Returns**: `section` (Frame).

#### `Flint:CreateToggle(parent, text, defaultValue, callback)`
Creates a toggle switch.
- **Parameters**:
  - `parent` (Instance): Parent container.
  - `text` (string): Toggle label.
  - `defaultValue` (boolean): Initial state.
  - `callback` (function): Called with the new state when toggled.
- **Returns**: `toggleFrame` (Frame).

#### `Flint:CreateSlider(parent, text, min, max, defaultValue, callback)`
Creates a slider.
- **Parameters**:
  - `parent` (Instance): Parent container.
  - `text` (string): Slider label.
  - `min` (number): Minimum value.
  - `max` (number): Maximum value.
  - `defaultValue` (number): Initial value.
  - `callback` (function): Called with the new value when changed.
- **Returns**: `sliderFrame` (Frame).

#### `Flint:CreateKeybind(parent, text, defaultKey, callback)`
Creates a keybind setter.
- **Parameters**:
  - `parent` (Instance): Parent container.
  - `text` (string): Keybind label.
  - `defaultKey` (Enum.KeyCode): Initial key.
  - `callback` (function): Called with the new key when changed.
- **Returns**: `keybindFrame` (Frame).

#### `Flint:CreateDropdown(parent, text, options, defaultValue, callback)`
Creates a dropdown menu.
- **Parameters**:
  - `parent` (Instance): Parent container.
  - `text` (string): Dropdown label.
  - `options` (table): Array of option strings.
  - `defaultValue` (string): Initial selection.
  - `callback` (function): Called with the selected option when changed.
- **Returns**: `dropdownFrame` (Frame).

#### `Flint:CreateTextBox(parent, text, defaultValue, callback)`
Creates a text input box.
- **Parameters**:
  - `parent` (Instance): Parent container.
  - `text` (string): Text box label.
  - `defaultValue` (string): Initial text.
  - `callback` (function): Called with the text when focus is lost.
- **Returns**: `textboxFrame` (Frame).

#### `Flint:CreateButton(parent, text, callback)`
Creates a clickable button.
- **Parameters**:
  - `parent` (Instance): Parent container.
  - `text` (string): Button label.
  - `callback` (function): Called when clicked.
- **Returns**: `buttonFrame` (Frame).

#### `Flint:Notify(message)`
Displays a notification.
- **Parameters**:
  - `message` (string): Notification text.

#### `Flint:SaveConfig()`
Saves the current configuration to `FlintUI_Config.json`.
- **Returns**: `true` if successful, `false` otherwise.

#### `Flint:LoadConfig()`
Loads the configuration from `FlintUI_Config.json`.
- **Returns**: `true` if successful, `false` otherwise.

## Troubleshooting

- **GUI Not Loading**:
  - Verify the `loadstring` URL is accessible and points to the correct `UILibrary.lua`.
  - Ensure the executor supports `loadstring`, `game:HttpGet`, and GUI parenting.
  - Check `ScreenGui` parent:
    ```lua
    print(libData.ScreenGui.Parent.Name) -- Should be "PlayerGui" or "CoreGui"
    ```
- **Theme Issues**:
  - If text is unreadable, confirm `TextPrimary` and `TextSecondary` contrast with background colors in the `Themes` table.
  - Debug theme application:
    ```lua
    for element, colorKey in pairs(LibraryData.ThemeElements) do
        print("Element:", element.Name, "Color:", colorKey, "Value:", GetTheme()[colorKey])
    end
    ```
- **Element Malfunction**:
  - Ensure elements are parented to a valid tab's `ContentFrame` (returned by `CreateTab`).
  - Check for executor-specific rendering issues with `TextButton` or `TextBox`.
  - Verify callbacks are defined correctly (should be functions, not nil).
- **Configuration Not Saving/Loading**:
  - Ensure the executor supports `writefile`, `readfile`, and `isfile`.
  - Check the executor's workspace folder for `FlintUI_Config.json`.
  - Test with a simple save/load:
    ```lua
    Flint:SaveConfig()
    print("Config saved:", isfile("FlintUI_Config.json"))
    Flint:LoadConfig()
    ```
- **Dropdown Not Appearing**:
  - Dropdowns use a separate container (`DropdownContainer`) with high z-index. Ensure it's not being clipped by other UI elements.
  - Check `DropdownContainer` visibility and position.
- **Performance**:
  - Reduce the number of elements or simplify themes for low-end devices.
  - Limit notification frequency to avoid overlapping.
  - Lower `UIScale` or increase `DragSmoothing` for better performance on slower devices.

## Notes
- **Version**: 3.0
- **Executor Support**: Requires an executor that supports `loadstring`, `game:HttpGet`, `TweenService`, `UserInputService`, and Roblox GUI objects (`ScreenGui`, `Frame`, `TextButton`, `TextBox`, `TextLabel`, `ScrollingFrame`, `UICorner`, `UIListLayout`, `UIScale`, `UIStroke`).
- **Optional Features**: Configuration saving/loading requires `writefile`, `readfile`, and `isfile` support. CoreGui parenting requires `syn.protect_gui` support.
- **Ethical Use**: Use in private testing environments to comply with Roblox's Terms of Service. This library is intended for educational purposes and personal use only.
- **Maintenance**: Check the hosted library URL regularly for updates or host your own version to ensure reliability.
- **Mobile Compatibility**: The library supports touch input for sliders and buttons. Drag functionality works on both desktop and mobile.

## Contact
For issues, feature requests, or contributions, contact the developer:
- **Discord**: @ly.arv

---

**Changelog (v3.0)**:
- Added UI Scale slider (50-150%)
- Added UI Transparency slider (0-50%)
- Added Tab Layout switcher (Horizontal/Vertical)
- Added Configuration saving/loading
- Added 12 predefined themes
- Added Settings Panel with built-in configuration options
- Added automatic tab numbering
- Improved theme system with real-time updates
- Improved dropdown rendering with z-index layering
- Improved drag functionality with configurable smoothing
- Improved notifications with smooth animations
- Improved mobile compatibility with touch support
- Fixed dropdown clipping issues
- Fixed theme application on dynamic elements
- Fixed settings panel toggle state
- Code refactoring for better maintainability