function damage_player(){
	if (oPlayer.invis) return;
	
	oPlayer.xspd = choose(-2,2);
	oPlayer.yspd = -1.7;
	
	oPlayer.hp--;
	oPlayer.invis = true;
	with (oPlayer) { alarm_set(0,120) }
	
	oPick.state = mode.idle;
	if (oPlayer.hp <= 0) {
		oPlayer.highscore = max(oPlayer.distance, oPlayer.highscore);
		ini_open("score");
			ini_write_real("save","highscore",oPlayer.highscore);
		ini_close();
		
		var ded = instance_create_depth(oPlayer.x,oPlayer.y,-90,oDead);
		ded.xspd = random(2)-1;
		ded.yspd = -2;
		oPick.state = mode.dead;
		oPick.xspd = ded.xspd*-1;
		oPick.yspd = -1.5;
		instance_destroy(oPlayer);
		audio_play_sound(sndded,10,false);
	} else {
		audio_play_sound(sndoof,10,false);
	}
}