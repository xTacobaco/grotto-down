function spawn_monster(x,y,ghost){
	if (! ghost) {
		if (irandom(max(0,4-floor(oPlayer.generated/2))) == 0) {
			var mob = choose(oSlime, oSpike, oSpike);
			instance_create_layer(x,y-8,"game",mob);
		}
	} else {
		instance_create_depth(x,y,98,oGhost);
	}
}