if (x % 16 == 0 && ! instance_position(x,y-8,oWall) && y > room_height) {
	spawn_monster(x,y,false);
}