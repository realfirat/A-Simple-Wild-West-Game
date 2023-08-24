extends Node2D

func _process(delta):
	$player_hp.value = global_variables.hp
	$score.text = str(global_variables.score)
	$dollar.text = str(global_variables.dollar)
	$justice.text = str(global_variables.justice)
	$fun.text = str(global_variables.fun)
	$independence.text = str(global_variables.independence)
	$faith.text = str(global_variables.faith)
	
	# dollar -> bina yapmaya, kurşun harcamaya yarar
	# justice -> düşmanlardan daha çok para kazanmaya yarar
	# fun -> turist gelmesini sağlar
	# independence -> bol para düşüren düşmanlar gelir
	# faith -> belli bir zamanda can yenilenir
