extends Navigation

onready var player = get_node("Player")
onready var goals = get_tree().get_nodes_in_group("Goals")
var path = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	if path.size() <= 0:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var goalNumber = rng.randf_range(0, goals.size() - 1)
		path = get_simple_path(player.translation,goals[goalNumber].translation,true)
	
	var direction = Vector3()
	var step_amount = delta * 2
	
	if path.size() > 0:
		var destination = path[0]
		direction = destination - player.translation
		
		if step_amount > direction.length():
			step_amount = direction.length()
			
			path.remove(0)
		
		player.translation += direction.normalized() * step_amount

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
