if (! audio_is_playing(background)) {
	audio_play_sound(background,10,true);
}

var grounded = place_meeting(x,y+1,oWall);
var mousedown = mouse_check_button(mb_left);

if (start_game == 0) {
	if (y > 64) {
		start_game = 1;	
	}
}
if (start_game == 1) {
	pick.state = mode.starting;
}

switch (pick.state) {
	case mode.idle:
		if (mousedown) {
			image_xscale = sign(sign(mouse_x-x)+0.1);
		}
		
		pick.image_index = 0;
		pick.image_xscale = image_xscale;
		pick.dir = image_xscale * 90 * mousedown;
		
		if (mouse_check_button_released(mb_left)) {
			pick.dir = point_direction(x,y,mouse_x,mouse_y);
			pick.throw_time = current_time;
			pick.sx = mouse_x;
			pick.sy = mouse_y;
			pick.state = mode.thrown; // lets gooo
			audio_play_sound(sndhook,10,false);
		}
	break;
	case mode.pulling:
		xspd = lerp(xspd, lerp(x, pick.x, 0.18)-x, 0.2);
		yspd = lerp(yspd, lerp(y, pick.y, 0.18)-y, 0.2);
	break;
	case mode.starting:
		mousedown = false;
		xspd = lerp(xspd, lerp(x, room_width/2, 0.18)-x, 0.2);	
	break;
}

if (! grounded) {
	sprite_index = sPlayer_ball;
	if (xspd != 0) {
		image_xscale = sign(xspd);
		dir += 10 * sign(xspd);
	}
	xspd = lerp(xspd,0,0.01);
	yspd += 0.1;
} else {
	sprite_index = sPlayer_idle;
	dir = 0;
	xspd *= 0.1;
}

//wall gliding code.
var r = place_meeting(x+4,y,oWall);
var l = place_meeting(x-4,y,oWall);

if (!grounded && (r || l) && xspd == 0 && yspd > 0) {
	if (r) {
		image_xscale = -1;
	} 
	if (l) {
		image_xscale = 1;	
	}
	dir = 0;
	sprite_index = sPlayer_wall;
	yspd = min(yspd, 0.5);
}

xspd = clamp(xspd, -2, 2);
yspd = clamp(yspd, -2, 2);

// handle collision
if (xspd != 0) {
	if (! place_meeting(x+xspd,y,oWall)) {
		x += xspd;	
	} else {
		var wall = instance_place(x+xspd,y,oWall);
		if (xspd > 0) {
			x = (wall.bbox_left-1)-3;
		}
		if (xspd < 0) {
			x = (wall.bbox_right+1)+4;
		}
		
		/*if (yspd < 0 && ! place_meeting(x,y+yspd,oWall)) {
			xspd *= -0.2; //bounce coefficient
		} else {*/
			xspd = 0;		
		//}
	}
}
if (yspd != 0) {
	if (! place_meeting(x,y+yspd,oWall)) {
		y += yspd;	
	} else {
		var wall = instance_place(x,y+yspd,oWall);
		if (yspd > 0) {
	        y = (wall.bbox_top-1) - 3;
	    } else if (yspd < 0) {
	        y = (wall.bbox_bottom+1) + 4;
			pick.state = mode.idle;
	    }
		if (pick.state == mode.starting) {
			pick.state = mode.idle	
			start_game = 2;
			starting_y = y;
		}
		yspd = 0;	
	}
}

grounded = place_meeting(x,y+1,oWall);
if (pick.state == mode.pulling && grounded) {
	pick.state = mode.idle;
}

hand = {
	xx: x + image_xscale*2 + sign(image_xscale-1),
	yy: y,
}

if (pick.state == mode.idle || pick.state == mode.starting) {
	pick.x = hand.xx - mousedown*image_xscale + image_xscale + sign(image_xscale+1);
	pick.y = hand.yy - 2 - mousedown;
}

if (pick.state == mode.pulling && abs(xspd) + abs(yspd) < 0.1) {
	pick.state = mode.idle;	
}

var calc = floor((oPlayer.y-oPlayer.starting_y)/8);
distance = max(distance, calc);

if (start_game < 2) {
	distance = 0;	
}

var sec = max(0, floor((y-top_y) / 64));
generateSection(sec);
