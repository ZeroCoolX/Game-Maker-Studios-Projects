///horizontal_move_bounce(collision_object)

var collision_object = argument[0];

//Horizontal collisions
if(place_meeting(x+hspd, y, collision_object)){
    while(!place_meeting(x+sign(hspd), y, collision_object)){
        x+= sign(hspd);
    }
    hspd = -(hspd/2);//reverse the horizontal speed (bounce off the opposite direction with half speed_
}
x += hspd;

//Vertical Collisions
if(place_meeting(x, y+vspd, collision_object)){
    while(!place_meeting(x, y+sign(vspd), collision_object)){
        y += sign(vspd);
    }
    vspd = 0;
}

y += vspd;
