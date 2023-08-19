extends Control

<<<<<<< HEAD
@onready var building_bank = preload("res://scenes/building_gosterge/b_bank.tscn")
=======
>>>>>>> parent of ebb66ce (bina yerleştirmeler tamamlandı)

func _on_area_2d_mouse_entered():
	self.modulate = Color.TOMATO


func _on_area_2d_mouse_exited():
	self.modulate = Color.WHITE
