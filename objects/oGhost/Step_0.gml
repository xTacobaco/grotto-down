part_particles_create(psg,x,y,oParticles.trail,1);

var xx = dir*room_width*2;
var yy = oCamera.stop-16;
var gen = 0;

if (instance_exists(oPlayer)) {
	xx = oPlayer.x;
	yy = oPlayer.y;
	gen = max(0,oPlayer.generated-4);
}

var pd = point_direction(x, y, xx, yy);
var dd = angle_difference(image_angle, pd);
image_angle -= min(abs(dd), 10) * sign(dd);
direction = image_angle;
speed = 0.4 + (0.6)*min(1,gen/15);

if (y < oCamera.stop-16) {
	y = oCamera.stop-16;
}