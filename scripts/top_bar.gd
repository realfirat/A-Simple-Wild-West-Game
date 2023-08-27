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
	# justice -> banditleri öldürünce kazanılır, banditler daha güçlü olur, banditlerden daha çok para kazanılır
	# fun -> turist gelmesini sağlar
	# independence -> fedleri öldürünce kazanılır, fedler daha güçlü olur, fedlerden daha çok para kazanılır
	# faith -> nativeleri öldürünce kazanılır, nativeler daha güçlü olur, nativelerden daha çok para kazanılır
