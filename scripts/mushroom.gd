extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 50
var direction = -1.0
signal player_died


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.x += direction*SPEED*delta
	
func _on_timer_timeout() -> void:
	direction = direction * -1.0
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h



func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Player": emit_signal("player_died", body)
