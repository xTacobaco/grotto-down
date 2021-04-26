if (state != mode.idle && state != mode.starting && state != mode.dead) {
	var num = ceil(distance_to_point(oPlayer.hand.xx, oPlayer.hand.yy));
	var angle = point_direction(x, y, oPlayer.hand.xx, oPlayer.hand.yy);

	draw_set_color(c_white);
	for (var i=0; i<num; i++) {
		var offset = 1+(current_time-throw_time) / 1000;
		offset = power(offset, 12);
		var curve1 = 5*sin(i)/offset;
		var curve2 = 5*sin(i+1)/offset;
		var x1_o = lengthdir_x(curve1, angle-90);
		var y1_o = lengthdir_y(curve1, angle-90);
		var x2_o = lengthdir_x(curve2, angle-90);
		var y2_o = lengthdir_y(curve2, angle-90);
	
		var x1 = (oPlayer.hand.xx-x)/num*i + x1_o;
		var y1 = (oPlayer.hand.yy-y)/num*i + y1_o;
		var x2 = (oPlayer.hand.xx-x)/num*(i+1) + x2_o;
		var y2 = (oPlayer.hand.yy-y)/num*(i+1) + y2_o;

		var thiccness = 2-(current_time-throw_time)/1000;
		thiccness = max(thiccness,1);
		if (os_browser == browser_not_a_browser) {
			draw_line_width(x+x1-1,y+y1-1,x+x2-1,y+y2-1,thiccness);
		} else {
			draw_line_width(x+x1,y+y1,x+x2,y+y2,thiccness);	
		}
	}
}

draw_sprite_ext(sprite_index, image_index, x,y,image_xscale, image_yscale, dir, image_blend, image_alpha);