extends ColorRect

var text
var title

func _ready():
	text = %info_text
	title = %info_title

func _on_dollar_area_mouse_entered():
	title.text = "MONEY"
	text.text = "Every bullet has a price..."
	self.visible = true
	global_position = Vector2(934, 76)

func _on_dollar_area_mouse_exited():
	self.visible = false


func _on_justice_area_mouse_entered():
	title.text = "JUSTICE"
	text.text = "Enemies will be more stronger but drop more money"
	self.visible = true
	global_position = Vector2(1139, 75)


func _on_justice_area_mouse_exited():
	self.visible = false


func _on_fun_area_mouse_entered():
	title.text = "FUN"
	text.text = "Your town attracts tourists"
	self.visible = true
	global_position = Vector2(1348, 75)


func _on_fun_area_mouse_exited():
	self.visible = false


func _on_independence_area_mouse_entered():
	title.text = "FREEDOM"
	text.text = "You make more money but federal Soldiers will hunt you"
	self.visible = true
	global_position = Vector2(1538, 76)


func _on_independence_area_mouse_exited():
	self.visible = false


func _on_faith_area_mouse_entered():
	title.text = "FAITH"
	text.text = "You regain some hp but natives will hunt you"
	self.visible = true
	global_position = Vector2(1657, 76)


func _on_faith_area_mouse_exited():
	self.visible = false
