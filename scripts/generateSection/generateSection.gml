function generateSection(section) {
	if (generated >= section) {
		return;
	}
	
	if (section > 2 && section % 2 == 0 && irandom(instance_number(oGhost)+4) == 0) {
		spawn_monster(irandom(room_width),oCamera.stop-8,true);
	}
	
	generated = section;
	var yy = room_height + section*64;
	var xx = 16;
	
	//sides
	for (var sy = yy; sy<yy+8*8; sy+=8) {
		instance_create_layer(xx,sy,"collision",oWall);
		instance_create_layer(xx+8*10,sy,"collision",oWall);
	}
	
	var data = [];
	//ebic content
	switch (irandom(4)) {
		case 0:
			data = [
				"000000000",
				"000000000",
				"000000000",
				"111100000",
				"111100000",
				"110000022",
				"000000021",
				"000000001",
			];
			break;
		case 1:
			data = [
				"000000000",
				"000000000",
				"000000000",
				"000111220",
				"000111222",
				"002110000",
				"002200000",
				"000000000",
			];
			break;
		case 2:
			data = [
				"000000000",
				"000000000",
				"000000000",
				"000002220",
				"000022222",
				"000111111",
				"000111111",
				"000000221",
			];
			break;
		case 3:
			data = [
				"000000000",
				"000000000",
				"000000000",
				"001111100",
				"001111100",
				"000112200",
				"000022000",
				"000000000",
			];
			break;
		case 4:
			data = [
				"000000000",
				"000000000",
				"220000000",
				"222111000",
				"111111000",
				"111110000",
				"111100000",
				"110000000",
			];
			break;
		default:
			data = [
				"000000000",
				"000000000",
				"000000000",
				"000000000",
				"000000000",
				"000000000",
				"000000000",
				"000000000",
			];
			break;
	}
	
	for (var dy=0; dy<8; dy++) {
		for (var dx=0; dx<=9; dx++) {
			switch (string_char_at(data[dy],dx)) {
				case "0":
					break;
				case "1":
					instance_create_layer(xx+(dx)*8,yy+dy*8,"collision",oWall);
					break;
				case "2":
					instance_create_layer(xx+(dx)*8,yy+dy*8,"game",oLeaves);
					break;
				case "3":
					instance_create_layer(xx+(dx)*8,yy+dy*8,"collision",oSpike);
					break;
			}
		}
	}
}