if (room == start){
	draw_set_font(Font50)
	draw_set_color(c_white)
	draw_text(500,250,"Catch Me!!")
	draw_set_font(Font20)
	draw_text(575,500,"PRESS ENTER")
}




if (room == Room1){
	draw_set_font(Font12)
	
	draw_text(20,20,"SCORE: "+string(SCORE))
	draw_text(20,40,"POWER: "+string(POWER))
	if (obj_player.overheating){
		draw_set_color(c_red)
		draw_text(20,60,"OVERHEATING")
	}
	else if (!obj_player.overheating){
		draw_set_color(c_white)	
	}
	
	
}

if (room == over){
	draw_set_font(Font50)
	if (WIN == true){
		draw_text(500,250,"YOU WIN!")
	}else{
		draw_text(500,250,"GAME OVER")
	}
	draw_set_font(Font20)
	draw_text(575,500,"PRESS ENTER")
	
}