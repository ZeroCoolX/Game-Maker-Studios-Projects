{
    //initialize our global blood particle
    global.pt_blood = part_type_create();
    var pt = global.pt_blood;
    
    //Set the settings for the blood particle
    part_type_shape(pt, pt_shape_disk);//particle_system, shape (pt_shape_...etc)
    part_type_size(pt, 0.1, 0.2, 0, 0);
    part_type_color2(pt, c_red, c_maroon);//start red and slowly change to maroon
    part_type_speed(pt, 2, 5, -0.1, 0);
    part_type_direction(pt, 0, 360, 0, 0);
    part_type_gravity(pt, 0.2, 270);//270 = down
    part_type_life(pt, 25, 50);//live for 25-50 life units
    
}
