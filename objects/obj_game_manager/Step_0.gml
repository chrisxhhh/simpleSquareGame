//room switch
if keyboard_check_pressed(vk_enter){
	if (room == start){
		room_goto(Room1)	
	}
	else if (room == over){
		room_goto(start)
		SCORE = 0
		POWER = 100
		WIN = false
	}
}