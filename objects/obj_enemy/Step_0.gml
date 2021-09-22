if (x < sprite_width/2){x_spd = -x_spd}
if (x > room_width-sprite_width/2){x_spd = -x_spd}
if (y < sprite_height/2){y_spd = -y_spd}
if (y > room_height-sprite_height/2){y_spd = -y_spd}

x+=x_spd
y+=y_spd


