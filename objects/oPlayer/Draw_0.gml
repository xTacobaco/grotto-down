
var spr = sprite_index;
if (invis && current_time % 2 == 0) {
	spr = sPlayer_damage;
}
draw_sprite_ext(spr, image_index, x,y,image_xscale, image_yscale, dir, image_blend, image_alpha);