num_npc = 5
for(var i =0; i< num_npc;i++){
	instance_create_depth(random_range(0,room_width), random_range(0,room_height),0,obj_enemy)
}