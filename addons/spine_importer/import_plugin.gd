tool
extends EditorImportPlugin

enum Presets { DEFAULT}


func get_importer_name() -> String:
	return "geekforged.spine.json"


func get_visible_name() -> String:
	return "Scene"


func get_recognized_extensions() -> Array:
	return ["json"]


# tscn is easier for source code to manage/diff
func get_save_extension() -> String:
	return "tscn"


func get_resource_type() -> String:
	return "PackedScene"


func get_preset_count() -> int:
	return Presets.size()


func get_preset_name(preset: int) -> String:
	 return Presets.keys()[preset].capitalize()


func get_import_options(_preset: int) -> Array:
	return []


func get_option_visibility(_option: String, _options: Dictionary) -> bool:
	return true


func import(source_file: String, save_path: String, options: Dictionary, platform_variants: Array, gen_files: Array) -> int:
	# Open the spine.json file
	var file = File.new()
	var file_err = file.open(source_file, File.READ)
	if file_err != OK:
		return file_err
	
	var file_content = file.get_as_text()
	
	file.close()
	
	# Parse into JSON
	var json_parse = JSON.parse(file_content)
	if json_parse.error != OK:
		return json_parse.error
	
	# Create the root of a new scene
	var root_node = Node2D.new()
	root_node.name = "root"
	
	# Iterate over JSON and convert appropriate data into sprites
	var skins = json_parse.result.skins
	var image_path = source_file.rsplit("/", false, 1)[0]
	for skin in skins:
		for slot in skins[skin]:
			print("Linking spine texture %s/%s.png" % [image_path, slot])
			var texture = load("%s/%s.png" % [image_path, slot])
			if texture:
				var sprite = Sprite.new()
				sprite.texture = texture
				sprite.name = slot
				sprite.centered = false
				sprite.offset.x = skins[skin][slot][slot].width / -2
				sprite.offset.y = skins[skin][slot][slot].height / -2
				sprite.position.x = skins[skin][slot][slot].x
				sprite.position.y = skins[skin][slot][slot].y * -1
				root_node.add_child(sprite)
				sprite.owner = root_node
				
	# Pack scene into a scene file
	var scene = PackedScene.new()
	var packing_err = scene.pack(root_node)
	if packing_err != OK:
		return packing_err
	
	return ResourceSaver.save("%s.%s" % [save_path, get_save_extension()], scene)
