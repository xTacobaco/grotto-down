globalvar ps;
ps = part_system_create();

dots = part_type_create();
part_type_shape(dots, pt_shape_pixel);
part_type_color1(dots, c_white);
part_type_direction(dots,0,365,0,0);
part_type_life(dots,14,16);
part_type_speed(dots,1.64,1.64,-0.2,0);

globalvar psg;
psg = part_system_create();
part_system_depth(psg, 99);

trail = part_type_create();
//part_type_alpha3(trail,1,1,0);
part_type_shape(trail, pt_shape_pixel);
part_type_size(trail,1,1,0,0);
part_type_life(trail,60,120);
part_type_direction(trail,0,360,0,0);
part_type_speed(trail,0,3,-1,0);
part_type_color1(trail, make_color_rgb(252, 246, 96));

splat = part_type_create();
//part_type_alpha3(trail,1,1,0);
part_type_shape(splat, pt_shape_pixel);
part_type_size(splat,1,2,0,0);
part_type_life(splat,20,40);
part_type_direction(splat,50,130,0,0);
part_type_speed(splat,1,1.5,0,0);
part_type_gravity(splat, 0.1, 270)
part_type_color1(splat, make_color_rgb(252, 246, 96));