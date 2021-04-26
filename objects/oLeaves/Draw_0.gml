/*draw_set_color(make_color_rgb(22,110,122));
draw_set_color(make_color_rgb(37,36,60));
draw_set_color(make_color_rgb(252,246,96));
*/
draw_set_color(make_color_rgb(32, 21, 51));
draw_self();

//draw_rectangle(x+1,y+1,x+6,y+6,true);

/*

if (y > room_height) {
	draw_self();
} else {

	var xx = x;
	var yy = y;

	if (os_browser == browser_not_a_browser) {
		xx = x-1;
		yy = y-1;
	}

	draw_set_color(c_white)
	if (!place_meeting(x,y-1,oWall)) //top
		draw_line(xx,y,xx+8,y);
	
	if (!place_meeting(x-1,y,oWall)) //left
		draw_line(x,yy,x,yy+8);

	if (!place_meeting(x,y+1,oWall)) //bottom
		draw_line(xx,y+7,xx+8,y+7);

	if (!place_meeting(x+1,y,oWall)) //right
		draw_line(x+7,yy,x+7,yy+8);

	draw_self();
}
*/