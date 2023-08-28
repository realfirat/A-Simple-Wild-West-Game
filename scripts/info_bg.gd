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
	text.text = "Bandits are more stronger but give more money"
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
	text.text = "Stronger federals... More money when you kill them..."
	self.visible = true
	global_position = Vector2(1538, 76)


func _on_independence_area_mouse_exited():
	self.visible = false


func _on_faith_area_mouse_entered():
	title.text = "NATIVES"
	text.text = "If you hunt them, they will attack you more frequently"
	self.visible = true
	global_position = Vector2(1657, 76)


func _on_faith_area_mouse_exited():
	self.visible = false
