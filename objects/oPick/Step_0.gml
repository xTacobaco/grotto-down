switch (state) {
	case mode.thrown:
		image_index = 1;
		image_xscale = 1;
		
		xspd = lerp(x, sx, 0.18)-x;
		yspd = lerp(y, sy, 0.18)-y;
		
		var collided = noone;
		if (xspd != 0) {
			if (! place_meeting(x+xspd,y,oWall)) {
				x += xspd;	
			} else {
				collided = instance_place(x+xspd,y,oWall);
				if (xspd > 0) {
					x = (collided.bbox_left-1)-2;
				}
				if (xspd < 0) {
					x = (collided.bbox_right+1)+2;
				}
				xspd = 0;
			}
		}
		if (yspd != 0) {
			if (! place_meeting(x,y+yspd,oWall)) {
				y += yspd;	
			} else {
				collided = instance_place(x,y+yspd,oWall);
				if (yspd > 0) {
			        y = (collided.bbox_top-1) - 2;
			    } else if (yspd < 0) {
			        y = (collided.bbox_bottom+1) + 2;
			    }
				yspd = 0;	
			}
		}
		
		var ghost = instance_place(x,y,oGhost);
		if (ghost) {
			part_particles_create_color(ps,x+xspd,y+yspd,oParticles.splat,make_color_rgb(252, 246, 96),20);
			state = mode.idle;
			oPlayer.hp = min(oPlayer.hp+1,5)
			audio_play_sound(slime_death,10,false);
			instance_destroy(ghost);
		}
		
		var slime = instance_place(x,y,oSlime);
		if (slime) {
			part_particles_create_color(ps,slime.x+4,slime.y+8,oParticles.splat,make_color_rgb(252, 246, 96),5);
			state = mode.idle;
			oPlayer.hp = min(oPlayer.hp+1,5);
			audio_play_sound(slime_death,10,false);
			instance_destroy(slime);
		}
		
		if (collided || point_distance(x,y,sx,sy) <= 3) {
			with(collided) { alarm_set(0,collided.delay); }
			part_particles_create(ps,x+xspd,y+yspd,oParticles.dots,5);
			xspd = 0;
			yspd = 0;
			state = mode.pulling;
			audio_play_sound(pickhit,10,false);
			oPlayer.yspd = -2;
		}
		
		break;
	case mode.pulling:
		if (distance_to_object(oPlayer) < 3) {
			state = mode.idle;
		}
		// handle: cannot reach pick! cancel after timer? or xspd yspd too slow.
		break;
	case mode.dead:
		yspd += 0.1;
		x += xspd;
		y += yspd;
		dir -= 10;
		break;
}
