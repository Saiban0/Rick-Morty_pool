extends Node

func	_init() -> void:
	pass

func	input_json():
	var input_file = FileAccess.get_file_as_string("res://../testinput.json")
	var parsed_input = JSON.parse_string(input_file)
	var avatar_dict: Dictionary = {
		"morty.png" : Globals.avatar_morty,
		"rick.png" : Globals.avatar_rick,
		"rockRick.png" : Globals.avatar_rockrick,
		"spaceBess.png" : Globals.avatar_spacebess,
		"spaceMorty.png" : Globals.avatar_spacemorty,
		"summer.png" : Globals.avatar_summer
	}
	if parsed_input:
		TranslationServer.set_locale(parsed_input["language"])
		Globals.players[0]["avatar"] = avatar_dict[parsed_input["players_Blue"][0]["avatar"]]
		Globals.players[0]["name"] = parsed_input["players_Blue"][0]["name"]
		Globals.players[1]["avatar"] = avatar_dict[parsed_input["players_Blue"][1]["avatar"]]
		Globals.players[1]["name"] = parsed_input["players_Blue"][1]["name"]
		Globals.players[2]["avatar"] = avatar_dict[parsed_input["players_Red"][0]["avatar"]]
		Globals.players[2]["name"] = parsed_input["players_Red"][0]["name"]
		Globals.players[3]["avatar"] = avatar_dict[parsed_input["players_Red"][1]["avatar"]]
		Globals.players[3]["name"] = parsed_input["players_Red"][1]["name"]
		
		Globals.turn_order[0]["name"] = parsed_input["players_Blue"][0]["name"]
		Globals.turn_order[0]["team"] = "Blue"
		Globals.turn_order[1]["name"] = parsed_input["players_Red"][0]["name"]
		Globals.turn_order[1]["team"] = "Red"
		Globals.turn_order[2]["name"] = parsed_input["players_Blue"][1]["name"]
		Globals.turn_order[2]["team"] = "Blue"
		Globals.turn_order[3]["name"] = parsed_input["players_Red"][1]["name"]
		Globals.turn_order[3]["team"] = "Red"
	else:
		print("Failed to open JSON")
		JavaScriptBridge.eval("""console.error("⚠️ Godot failed to open JSON");""")

func	output_json(winning_team: String):
	var output_dict : Dictionary = {
		"winning_team" : winning_team,
		"score_Blue" : Globals.team_a_score,
		"score_Red" : Globals.team_b_score,
		"players_Blue" : [
			{"name" : Globals.players[0]["name"], "score" : Globals.players[0]["score"]},
			{"name" : Globals.players[1]["name"], "score" : Globals.players[1]["score"]}
			],
		"players_Red" : [
			{"name" : Globals.players[2]["name"], "score" : Globals.players[2]["score"]},
			{"name" : Globals.players[3]["name"], "score" : Globals.players[3]["score"]}
		]
	}
	var file = FileAccess.open("res://../testoutput.json",FileAccess.WRITE)
	file.store_string(JSON.stringify(output_dict, "\t"))
	file.close()
	JavaScriptBridge.eval("""
	window.onGodotGameOver && window.onGodotGameOver(%s); 
	""" % JSON.stringify(output_dict))
	
