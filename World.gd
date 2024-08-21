extends Node3D

const Cell = preload("res://Cell.tscn")

@export var Map : Node2D

var cells = []

func _ready():
	var environment = $WorldEnvironment.get_environment()
	#print(get_tree().root.world_3d.fallback_environment)
	environment.background_mode = Environment.BG_COLOR
	#environment.background_color = Color.BLACK
	environment.ambient_light_color = Color("432d6d")
	#environment.volumetric_fog_enabled = true
	#environment.dof_blur_near_enabled = true
	generate_map()

func generate_map():
	#if not Map is PackedScene: return
	var tileMap = Map.get_tilemap()
	var used_tiles = tileMap.get_used_cells(0)
	Map.free() # We don't need it now that we have the tile data
	for tile in used_tiles:
		var cell = Cell.instantiate()
		add_child(cell)
		cell.position = Vector3(tile.x*Globals.GRID_SIZE, 0, tile.y*Globals.GRID_SIZE)
		cells.append(cell)
	for cell in cells:
		cell.update_faces(used_tiles)
