camera_set_view_size(view_camera[0], vw, vh);

if (instance_exists(oPlayer)) {
	var xx = sx-vw/2;
	var yy = oPlayer.y-vh/2;
	yy = max(stop, yy);
	stop = yy;
	camera_set_view_pos(view_camera[0], xx, yy);
	instance_activate_region(xx,yy,vw,vh+8,true);
}