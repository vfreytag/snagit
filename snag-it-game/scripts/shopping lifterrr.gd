extends HBoxContainer


func _ready() -> void:
	#randomize array from objects
	#set text items by array item 1 2 3
	
	var dir := DirAccess.open("res://assets/grocery_items/")
	if dir == null: print("Could not open folder"); return
	
	var files: Array[String] = []
	
	dir.list_dir_begin()
	for file: String in dir.get_files():
		files.append(file)
		
	files.shuffle()
	
	for file in files: 
		#var res := load(dir.get_current_dir() + "/" + file)
		print(file.get_basename())

		
	
	#dir.list_dir_begin()
	#for file: String in dir.get_files():
		#var res := load(dir.get_current_dir() + "/" + file)
		#print(res.Name)
		
		
		
	#var groccery = Array[Resource] = []
	#for 
		
		
		#$TextureRect/Item1.text = res.Name
		#$TextureRect/Item2.text = res.Name
		#$TextureRect/Item3.text = res.Name
		#$TextureRect/Item4.text = res.Name
		#$TextureRect/Item5.text = res.Name
		#$TextureRect/Item6.text = res.Name


#on interaction key hit
#check if item is strolen - strike thourhg
