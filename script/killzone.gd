extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	#碰到killzone之后就会触发打印，然后timer倒计时开始
	print("you died!")
	timer.start()


func _on_timer_timeout() -> void:
	#timer倒计时结束之后，自动触发这个函数，重启场景，也就是重新开始游戏
	get_tree().reload_current_scene()
