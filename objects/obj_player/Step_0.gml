//movement
if (keyboard_check(vk_right)){
	if (x_spd < x_spd_max){
		x_spd += acc
		//image_angle = 270
	}
}
if (keyboard_check(vk_left)){
	if (x_spd > -x_spd_max){
		x_spd -= acc
		//image_angle = 90
	}
}

if (keyboard_check(vk_up)){
	if (y_spd > -y_spd_max){
		y_spd -= acc
		//image_angle = 0
	}
}
if (keyboard_check(vk_down)){
	if (y_spd < y_spd_max){
		y_spd += acc
		//image_angle = 180
	}
}

if (!keyboard_check(vk_right) and !keyboard_check(vk_left)){
	x_spd = lerp(x_spd,0,0.05)
}
if (!keyboard_check(vk_up) and !keyboard_check(vk_down)){
	y_spd = lerp(y_spd,0,0.05)
}




//normalize the vector if exceed speed
if (sqrt(sqr(x_spd)+sqr(y_spd))> 5){
	
	var degree = point_direction(x,y,x+x_spd,y+y_spd)
	x += lengthdir_x(5,degree)
	y += lengthdir_y(5,degree)
}
else{
	y += y_spd
	x += x_spd
}

//check collision with walls
if (place_meeting(x+x_spd,y,obj_wall)){
	var hit_wall = instance_place(x+x_spd,y,obj_wall)
	if (x_spd>0){
		x = hit_wall.x-hit_wall.sprite_height/2-sprite_width/2
		x_spd = 0
	}
	else{
		x = hit_wall.x+hit_wall.sprite_width/2+sprite_width/2
		x_spd=0
	}
}
if (place_meeting(x,y+y_spd,obj_wall)){
	var hit_wall = instance_place(x,y+y_spd,obj_wall)
	if (y_spd>0){
		y = hit_wall.y-hit_wall.sprite_height/2-sprite_height/2
		show_debug_message(sprite_get_bbox_top(spr_player_idle))
		
		y_spd = 0
	}
	else{
		y = hit_wall.y+hit_wall.sprite_height/2+sprite_height/2
		y_spd=0
	}
}



	
//attack
if (keyboard_check(vk_space)and POWER > 0){
	sprite_index = spr_player_attack_simple
	attack_mod = true
}
else {
	sprite_index = spr_player_simple
	attack_mod = false
}

if attack_mod and POWER > 0{
	POWER -= 1	
}
else if !attack_mod and POWER < 100 and overheating_timer == overheating_timer_max{
	POWER += 1	
}
if (POWER <= 0){
	overheating_timer -=1
	overheating = true
	acc = 0.03
	if overheating_timer ==0{
		overheating_timer = overheating_timer_max
		overheating = false
		POWER = 10
		acc = 0.15
	}
}

//collide with enemy
if place_meeting(x,y,obj_enemy){
	var hit_enemy = instance_place(x,y,obj_enemy)
	if (attack_mod){
		instance_destroy(hit_enemy)
		SCORE +=1
		if (SCORE == num_npc){
			WIN = true
			room_goto(over)
		}
	}
	else{
		room_goto(over)
	}
}

//keep player inside map
if(x > room_width-sprite_width/2){x=room_width-sprite_width/2;x_spd = 0	}
if (x<sprite_width/2) {x =sprite_width/2; x_spd=0}
if(y>room_height-sprite_height/2){y = room_height-sprite_height/2; y_spd=0}
if(y<sprite_height/2){y=sprite_height/2; y_spd=0}

