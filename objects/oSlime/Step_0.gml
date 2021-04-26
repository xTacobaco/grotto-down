if (y < oCamera.stop-16) {
	instance_destroy();	
}

var wall = instance_place(x+dir,y,oWall)
if (wall && wall.object_index == oWall) {
	dir *= -1;	
}
wall = instance_place(x+dir*6,y+1,oWall);
if (!wall || wall.object_index != oWall) {
	dir *= -1;	
}

x += dir/5;