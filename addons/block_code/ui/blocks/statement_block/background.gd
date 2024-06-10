@tool
extends Control

const KNOB_X = 30.0
const KNOB_W = 10.0
const KNOB_H = 10.0
const KNOB_Z = 5.0

@export var color: Color:
	set = _set_color


func _set_color(new_color):
	color = new_color
	queue_redraw()


## Called when the node enters the scene tree for the first time.
#func _ready():
#print(color)
#queue_redraw()
#


func float_array_to_Vector2Array(coords: Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array: PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array


func _draw():
	# draw_line(Vector2(size.x, 0), size, Color.GREEN, 5.0)
	var polygon = [
		[0.0, 0.0],
		[KNOB_X, 0.0],
		[KNOB_X - KNOB_Z, -KNOB_H],
		[KNOB_X + KNOB_W, -KNOB_H],
		[KNOB_X + KNOB_W - KNOB_Z, 0.0],
		[size.x, 0.0],
		[size.x, size.y],
		[KNOB_X + KNOB_W - KNOB_Z, size.y],
		[KNOB_X + KNOB_W, size.y - KNOB_H],
		[KNOB_X - KNOB_Z, size.y - KNOB_H],
		[KNOB_X, size.y],
		[0.0, size.y],
		[0.0, 0.0],
	]
	var packed_polygon = float_array_to_Vector2Array(polygon)
	draw_colored_polygon(packed_polygon, color)