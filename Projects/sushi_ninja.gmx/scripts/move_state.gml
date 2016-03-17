///move_state()

//get input - the novice way
    right_control = (keyboard_check(vk_right) || keyboard_check(ord("D")));
    left_control = (keyboard_check(vk_left) || keyboard_check(ord("A"))); 
    up_control = (keyboard_check(vk_up) || keyboard_check(ord("W")));
    down_control = (keyboard_check(vk_down) || keyboard_check(ord("S")));
    up_release = (keyboard_check_released(vk_up) || keyboard_check_released(ord("W")));
    
//This means we're in the air!    
if(!place_meeting(x, y+1, Solid)){
    vspd += grav;//appply gravity
    
    //Control the jump height
    if(up_release && vspd < -6){
        vspd = -6;
    }
    
}else{
    vspd = 0;

    //Jump code
    if(up_control){
        vspd = -jspd;
    }
}


if(right_control){
    hspd = spd;
}
if(left_control){
    hspd = -spd;
}

if(hspd != 0){//moving in some horizontal direction
    image_xscale = sign(hspd);
}

//pseudo friction
if(!right_control && !left_control){
    hspd = 0;
}

move(Solid);


//Check for ledgegrab state
var falling = y - yprevious > 0;//half the pixel width +1
var wasnt_wall = !position_meeting(x+25*image_xscale, yprevious, Solid);//not a wall at our previous y position to the right of us
var is_wall = position_meeting(x+25*image_xscale, y, Solid);

//either jump up on the ledge of drop down you ninja
if(falling && wasnt_wall && is_wall){
    hspd = 0;
    vspd = 0;
    
    //move against the ledge horizontally
    while(!place_meeting(x+image_xscale, y, Solid)){
        x += image_xscale;
    }
    
    //make sure we're the right height
    while(position_meeting(x+25*image_xscale, y-1, Solid)){
        y -=1;
    }
    
    state = ledge_grab_state;
}
















