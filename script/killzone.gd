extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	#碰到killzone之后就会触发打印，然后timer倒计时开始
	print("you died!")
	
	#如下设置目的是为了让时间以一半的速度流逝 达成关键时刻动画慢放的效果，结束之后再恢复时间流逝
	Engine.time_scale = 0.5
	
	#由于能够进入死亡区域的只有我们的player，所以这个入参body只会是玩家
	#死亡时候直接移除玩家的碰撞箱，让它掉下去，和马里奥一样
	body.get_node("CollisionShape2D").queue_free()
	
	timer.start()


func _on_timer_timeout() -> void:
	#timer倒计时结束之后，自动触发这个函数，重启场景，也就是重新开始游戏
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
