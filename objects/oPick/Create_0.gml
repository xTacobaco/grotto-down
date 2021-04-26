image_speed = 0;
state = mode.idle;
dir = 0;
sx = x;
sy = y;
length = 32;
xspd = 0;
yspd = 0;
transitions = ds_list_create();
throw_time = 0;

enum mode {
	idle,		//do nothing :D
	thrown,		//when player throws the pick
	falling,	//pickage missed, fall to closest ground :(
	pulling,	//pickage stuck, pulling in player
	hanging,	//player hangs/glides
	wait,		//transitioning between states :
	starting,	//jam bs-code for "cutscene" :D
	dead,		//ebiii
}