///scr_enemy_wander_state()

scr_check_for_player();

if(point_distance(x,y,targetx, targety) > spd){
    
    //direction pointing to the target
    var dir = point_direction(x,y,targetx, targety);
    
    //get horizontal and vertical speed
    var hspd = lengthdir_x(spd, dir);
    var vspd = lengthdir_y(spd, dir);
    
    //make sure the image alwasy get drawn since its possible to have a 0 hspd
    if(hspd != 0){
        image_xscale = sign(hspd);
    }
    phy_position_x += hspd; //-1 or 1 based on the sign of the value. -10 = -1, 5 = 1..etc
    phy_position_y += vspd;
}
