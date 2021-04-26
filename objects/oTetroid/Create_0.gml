randomize();

image_speed = 0;
image_index = irandom(2);
switch (image_index) {
	case 0:
		instance_create_layer(x,y+4,"game",oLeaves);
		instance_create_layer(x-8,y+4,"game",oLeaves);
		instance_create_layer(x,y-4,"game",oLeaves);
		instance_create_layer(x+8,y+4,"game",oLeaves);
		break;
	case 1:
		instance_create_layer(x,y-4,"game",oLeaves);
		instance_create_layer(x,y+4,"game",oLeaves);
		instance_create_layer(x-8,y-4,"game",oLeaves);
		instance_create_layer(x+8,y+4,"game",oLeaves);
		break;
	case 2:
		instance_create_layer(x,y+4,"game",oLeaves);
		instance_create_layer(x-8,y+4,"game",oLeaves);
		instance_create_layer(x+8,y+4,"game",oLeaves);
		instance_create_layer(x+8,y-4,"game",oLeaves);
		break;
}