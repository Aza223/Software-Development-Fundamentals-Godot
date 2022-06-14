extends Control

export(int) var countdownMax
var currentTimer

func _ready():
	currentTimer=countdownMax
	$HUD/Countdown.text = str(currentTimer)

	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("Game Over")

	for button in $"Layout/Main/Buttons/GameScenes".get_children():
		button.connect("pressed", self, "_on_Button_Pressed", [button.scene_to_load])

func _on_Button_Pressed(scene_to_load):
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)
