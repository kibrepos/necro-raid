extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("slime_jump")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("slime_idle")
	move_and_slide()



func _on_area_2d__detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_area_2d__detection_area_body_exited(body):
	player = null
	player_chase = false
