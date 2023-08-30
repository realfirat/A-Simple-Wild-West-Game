extends ColorRect

var text
var title

func _ready():
	text = %info_text
	title = %info_title

func _on_dollar_area_mouse_entered():
	title.text = "MONEY"
	text.text = "You spend 1 dollar for every bullet"
	self.visible = true
	global_position = Vector2(934, 76)

func _on_dollar_area_mouse_exited():
	self.visible = false


func _on_justice_area_mouse_entered():
	title.text = "JUSTICE"
	text.text = "Stronger bandits, more money"
	self.visible = true
	global_position = Vector2(1139, 75)


func _on_justice_area_mouse_exited():
	self.visible = false


func _on_fun_area_mouse_entered():
	title.text = "FUN"
	text.text = "Your town attracts tourists (which means money)"
	self.visible = true
	global_position = Vector2(1348, 75)


func _on_fun_area_mouse_exited():
	self.visible = false


func _on_independence_area_mouse_entered():
	title.text = "FREEDOM"
	text.text = "Federals attack you harder than before"
	self.visible = true
	global_position = Vector2(1538, 76)


func _on_independence_area_mouse_exited():
	self.visible = false


func _on_faith_area_mouse_entered():
	title.text = "NATIVES"
	text.text = "Natives become more powerful"
	self.visible = true
	global_position = Vector2(1657, 76)


func _on_faith_area_mouse_exited():
	self.visible = false
