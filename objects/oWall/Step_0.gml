if (y < oCamera.stop-16) {
	instance_destroy();	
}

var l = instance_position(x-8,y,oWall);
l = l && l.object_index == oWall || x == 16;

var r = instance_position(x+8,y,oWall);
r = r && r.object_index == oWall || x == 96;

var t = instance_position(x,y-8,oWall);
t = t && t.object_index == oWall;

var b = instance_position(x,y+8,oWall);
b = b && b.object_index == oWall;

if (!l && !r && t && b) {
	if (x > room_width/2) {
		image_index = 5;
	} else {
		image_index = 4;
	}
}

if (l && r && !t) {
	image_index = 2;
}

if (!t && b) {
	if (l && ! r) {
		image_index = 7;
	}
	if (r && ! l) {
		image_index = 6;
	}
}
if (!b && t) {
	if (l && ! r) {
		image_index = 9;
	}
	if (r && ! l) {
		image_index = 8;
	}
}

if (r && l && !b && t) {
	image_index = 3;
}

if (t && b && r && !l) {
	image_index = 5;
}

if (t && b && !r && l) {
	image_index = 4;
}

if (l && t && b && r) {
	image_index = 1;
	
	var temp = instance_position(x-8,y-8,oWall);
	temp = temp && temp.object_index == oWall || x == 16;
	if (! temp) {
		image_index = 13;
	}
	temp = instance_position(x+8,y-8,oWall);
	temp = temp && temp.object_index == oWall || x == 96;
	if (! temp) {
		image_index = 12;
	}
	temp = instance_position(x-8,y+8,oWall);
	temp = temp && temp.object_index == oWall || x == 16;
	if (! temp) {
		image_index = 11;
	}
	temp = instance_position(x+8,y+8,oWall);
	temp = temp && temp.object_index == oWall || x == 96;
	if (! temp) {
		image_index = 10;
	}
}