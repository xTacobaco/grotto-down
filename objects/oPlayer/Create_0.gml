pick = instance_create_layer(x,y,"game",oPick);
hand = {
	xx: x,
	yy: y,
}

xspd = 0;
yspd = 0;
dir = 0;
hp = 5;
invis = false;

//scoring system
starting_y = y;
top_y = y;
distance = 0;

start_game = 0;
generated = -1;
generateSection(0);

ini_open("score");
	highscore = ini_read_real("save","highscore",0);
ini_close();