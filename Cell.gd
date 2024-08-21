extends Node3D
class_name Cell

@onready var topFace = $TopFace
@onready var northFace = $NorthFace
@onready var eastFace = $EastFace
@onready var southFace = $SouthFace
@onready var westFace = $WestFace
@onready var bottomFace = $BottomFace

func update_faces(cell_list) -> void:
	var my_grid_position = Vector2i(position.x/Globals.GRID_SIZE, position.z/Globals.GRID_SIZE)
	if cell_list.has(my_grid_position + Vector2i.RIGHT):
		eastFace.find_child("CollisionShape3D").disabled = true
		eastFace.queue_free()
	if cell_list.has(my_grid_position + Vector2i.LEFT):
		westFace.find_child("CollisionShape3D").disabled = true
		westFace.queue_free()
	if cell_list.has(my_grid_position + Vector2i.DOWN):
		southFace.find_child("CollisionShape3D").disabled = true
		southFace.queue_free()
	if cell_list.has(my_grid_position + Vector2i.UP):
		northFace.find_child("CollisionShape3D").disabled = true
		northFace.queue_free()
