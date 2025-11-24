extends HBoxContainer

# Called when the node enters the scene tree for the first time.
#note: this si some shit chatgpt gave me based on "Using GD script, 
# how would I pull random resources from a folder in the file system into a script?"
# still figuring it out. just got so stressed that i can think anymore.

func get_random_item(path: String):
		var dir := DirAccess.open(path)
		if dir == null:
			push_error("cannot open directory: " + path)
			return null
		
		var files := []
		dir.list_dir_begin()
		
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				# filter by type if needee
				files.append(path + "/" + file_name)
			file_name = dir.get_next()#
			
		dir.list_dir_end()
		
		if files.is_empty():
			return null
		
		return load(files.pick_random())
			
			
#var res = get_random_item("res://assets/resource"):
	#print(res)

	#$TextureRect/Item1.text = res
	#$TextureRect/Item2.text = res
	#$TextureRect/Item3.text = res
	#$TextureRect/Item4.text = res
	#$TextureRect/Item5.text = res
	#$TextureRect/Item6.text = res
