# Spine Importer

<!-- ![Icon](https://raw.githubusercontent.com/dweremeichik/godot_spine_import_plugin/main/asset_lib/asset_lib_icon.png) -->

Spine Importer is a plugin for the [Godot Engine](https://godotengine.org). 
It is designed to make 2D rigging significantly faster and more accurate by placing your rigging textures for you.
**It does not currently support full Spine2D capabilities**, and is mainly useful for importing from applications like Affinity Designer, Photoshop, [Etc](https://github.com/EsotericSoftware/spine-scripts). 

## How to install

Official installation instructions may be found [here](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html#installing-a-plugin).
You may either install through the Godot Asset Library, or you can download a zip file directly from GitHub.

## How to use

To use this plugin simply enable it, you can find the official instructions [here](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html#enabling-a-plugin).
Add your images/textures to your project along with your Spine.json file. Your Spine.json file should now behave like a Scene inside of the godot editor. If everything worked well, you should see your sprites laid out appropriately.

> ⚠ Note: You may need to re-import your Spine.json file from the import dock if your Spine.json file was imported before your images/textures were.

The current recommended workflow is to open the generated spine scene by clicking "Open Anyway", copying the nodes that you need and then pasting them into a new scene. If you instead clicked "New Inherited" you will need to save the inherited scene at least once, then right click the root node in the scene dock and click "Clear Inheritance". If you do not clear the inheritance, you will have to deal with oddities if the spine.json gets re-imported.


## License

This plugin is MIT licensed. The license file is located at [addons\spine_importer\LICENSE](https://github.com/dweremeichik/godot_spine_import_plugin/blob/main/addons/spine_importer/LICENSE).
