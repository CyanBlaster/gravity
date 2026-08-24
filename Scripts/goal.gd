extends StaticBody3D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if(body.name.begins_with("player")):
		global.level += 1
		global.change = true
