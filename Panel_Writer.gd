tool
extends Control

signal Finalize_Values
var Values = []
var Fields
var Error
var AddErrorToArray = false #change this to true if the index needs to match its count

#this just reads values from the specified place in uui

func _ready():
	Fields = null #Link to a container here
	Error = $"Error"
	ResetValueArray()

func _on_Finalize_pressed(): #Refresh values then send out a signal
	ResetValueArray() #fill the value array
	emit_signal("Finalize_Values", Values)

func ResetValueArray():#store values in an array
	var Count = Fields.get_child_count()
	for i in Count:
		var Data
		var Check = Fields.get_child(i)
		match Check.get_class():
			"LineEdit", "TextEdit":
				Data = Check.text
			"CheckBox", "CheckButton":
				Data = Check.pressed
			"OptionButton": #returns index then said indexes id
				Data = [Check.selected, Check.get_selected_id()]
			"SpinBox":
				Data = int(Check.get_line_edit().text)
			"ColorPickerButton":
				Data = Check.color
			"MenuButton": #not super happy with what this returns but not sure what to replace it with
				Data = Check.get_popup()
			_: #error
				Error.get_label().text = "%s is not currently usable" %Check.get_class()
				Error.popup()
				if AddErrorToArray:
					Data = null
		Values.append(Data)
