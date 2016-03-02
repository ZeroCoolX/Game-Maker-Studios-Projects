///boss_lift_state()

image_index = 1;//awakre the rock boss

//leftoff
if(vspd >= -16){
    vspd -= 0.5;
}
move(Solid);

if(place_meeting(x, y-32, Solid)){//ceiling is 32 px above boss
    vspd = 0;
    state = boss_chase_state;
}
