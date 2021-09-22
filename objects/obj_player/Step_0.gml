//movement
if (keyboard_check(vk_right)){
	if (x_spd < x_spd_max){
		x_spd += acc
	}
}
if (keyboard_check(vk_left)){
	if (x_spd > -x_spd_max){
		x_spd -= acc
	}
}

if (keyboard_check(vk_up)){
	if (y_spd > -y_spd_max){
		y_spd -= acc
	}
}
if (keyboard_check(vk_down)){
	if (y_spd < y_spd_max){
		y_spd += acc
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


//keep player inside map
if(x > room_width-sprite_width/2){x=room_width-sprite_width/2;x_spd = 0	}
if (x<sprite_width/2) {x =sprite_width/2; x_spd=0}
if(y>room_height-sprite_height/2){y = room_height-sprite_height/2; y_spd=0}
if(y<sprite_height/2){y=sprite_height/2; y_spd=0}

