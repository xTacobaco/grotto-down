vw = 240/2;
vh = 256/2;

scale = 4;
sx = vw/2;
stop = 0;

window_set_size(vw*scale, vh*scale);
alarm[0] = 1;

surface_resize(application_surface, vw, vh);

font = font_add_sprite_ext(sFont,"0123456789m",true,0);