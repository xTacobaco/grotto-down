draw_set_color(c_white);
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_font(font)

if (instance_exists(oPlayer) && oPlayer.start_game >= 2) {
	draw_text(vw/2,stop+vh/6,string(oPlayer.distance)+"m");
	
	for (var i=0; i<5; i++) {
		draw_sprite(sHeart,(5-oPlayer.hp)>i,8,stop+vh-40+8*i);	
	}
} 

if (instance_exists(oPlayer) && oPlayer.start_game < 2) {
	draw_set_valign(fa_top);
	draw_set_halign(fa_right);
	if (oPlayer.highscore != 0) {
		draw_text(vw-8,stop+10,string(oPlayer.highscore)+"m");
	}
}