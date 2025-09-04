extends Node2D

var size_ini = Vector2i(600, 600)
var node_name = "img"

func _ready() -> void:
	var window = get_window()
	window.size = size_ini
	window.content_scale_size = size_ini

func change(number: int) -> void:
	node_name = get_node("Btn" + str(number)).text
	var aux = load("res://Scenes/" + node_name + ".tscn").instantiate()
	for btn in get_children():
		btn.visible = false
	add_child(aux)
	var window = get_window()
	window.size = aux.size
	window.content_scale_size = aux.size

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		for aux in get_children():
			if aux.visible:
				aux.queue_free()
				var window = get_window()
				window.size = size_ini
				window.content_scale_size = size_ini
				node_name = "img"
			else:
				aux.visible = true
	elif Input.is_action_just_pressed("ui_accept"):
		var img: Image = get_viewport().get_texture().get_image()
		var err = img.save_png("Screenshoots/" + node_name + ".png")
		if err == OK:
			print("Guardado " + node_name)
		else:
			print("error guardando")

func _on_btn_1_pressed() -> void:
	change(1)

func _on_btn_2_pressed() -> void:
	change(2)

func _on_btn_3_pressed() -> void:
	change(3)

func _on_btn_4_pressed() -> void:
	change(4)

func _on_btn_5_pressed() -> void:
	change(5)

func _on_btn_6_pressed() -> void:
	change(6)

func _on_btn_7_pressed() -> void:
	change(7)

func _on_btn_8_pressed() -> void:
	change(8)

func _on_btn_9_pressed() -> void:
	change(9)

func _on_btn_10_pressed() -> void:
	change(10)
