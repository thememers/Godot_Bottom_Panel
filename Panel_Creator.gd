tool
extends EditorPlugin

#Manages presenting the idea creator plugin

var UI_Instance
var PanelButton
var Visible = false setget SwapVisibility

func _input(event):
	if Input.is_key_pressed(KEY_CONTROL) && Input.is_key_pressed(KEY_I):
		self.SwapVisibility(Visible)

func SwapVisibility(NewVisible):
	if !NewVisible:
		UI_Instance = load("res://addons/Bottom Panel Writer/UI.tscn").instance() #Instance the ui scene
		UI_Instance.connect("Finalize_Values", self, "CreateIdea")
		PanelButton = add_control_to_bottom_panel(UI_Instance, "Idea Panel")
		Visible = true
	else:
		remove_control_from_bottom_panel(UI_Instance)
		UI_Instance.queue_free() #Kill the window
		Visible = false

func CreateIdea(Values): #Do whatever you need too the values here
#or do it in the writer
#I'm not your parent I don't care
	print(Values)