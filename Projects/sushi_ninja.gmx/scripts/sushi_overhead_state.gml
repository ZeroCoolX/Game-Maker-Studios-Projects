///sushi_overhead_state(sush)


//Apply Gravity

if(!place_meeting(x, y+1, Solid)){
    vspd += grav*factor;
    factor += 0.2
}else{
    vspd = 0;
   
     //use friction
    apply_friction(accel);
    
    //check for idle state
    if(vspd == 0 && hspd == 0){
            ///Create sushi Bits
        create_bits(6, 9, 4, 4, 4, 4, SushiBits, false);
    
        if(state != sushi_hurt_state){
            image_blend = make_colour_rgb(220, 150, 150);//change this later obv
            hspd = sign(x-Player.x)*2;
            vspd = -12;
            state = sushi_hurt_state;
            
            move(Solid);
            hp -= 2;
        }
    }
}

//face the player/*
if(hspd != 0){
    image_xscale = sign(hspd);
}

//move the sushi
horizontal_move_bounce(Solid);



