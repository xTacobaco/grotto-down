var r = instance_place(x+1,y,oLeaves);
var l = instance_place(x-1,y,oLeaves);
var t = instance_place(x,y-1,oLeaves);
var b = instance_place(x,y+1,oLeaves);
with (r) { alarm_set(0,delay); }
with (l) { alarm_set(0,delay); }
with (t) { alarm_set(0,delay); }
with (b) { alarm_set(0,delay); }

var col = make_color_rgb(22, 110, 122);
part_particles_create_color(ps, x+2,y+2, oParticles.dots, col, 1);
part_particles_create_color(ps, x+2,y+6, oParticles.dots, col, 1);
part_particles_create_color(ps, x+6,y+2, oParticles.dots, col, 1);
part_particles_create_color(ps, x+6,y+6, oParticles.dots, col, 1);

var col = make_color_rgb(252, 246, 96);
part_particles_create_color(ps, x+4,y+4, oParticles.dots, col, 2);
instance_destroy();