A simple bottom panel for the godot editor
1. Current value returns:
   - "LineEdit", "TextEdit":
     - The text in them
   - "CheckBox", "CheckButton":
     - Boolean status
   - "OptionButton":
     - Returns an array with the current index then the id tied to the selected item
   - "SpinBox":
     - The number entered
   - "ColorPickerButton":
     - The color value selected
   - "MenuButton":
     - Not happy with this at all just returns a link to the popup that appears when clicked