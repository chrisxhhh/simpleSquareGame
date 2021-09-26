if (x < sprite_width/2){x_spd = -x_spd}
if (x > room_width-sprite_width/2){x_spd = -x_spd}
if (y < sprite_height/2){y_spd = -y_spd}
if (y > room_height-sprite_height/2){y_spd = -y_spd}

if (collision_point(x+sprite_xoffset,y,obj_wall,true,false) or collision_point(x-sprite_xoffset,y,obj_wall,true,false)){
	x_spd = -x_spd
}
if (collision_point(x,y+sprite_yoffset,obj_wall,true,false) or collision_point(x,y-sprite_yoffset,obj_wall,true,false)){
	y_spd = -y_spd
}
show_debug_message(sprite_get_bbox_top(sprite_xoffset))
x+=x_spd
y+=y_spd



