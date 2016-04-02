///move_state()


    
//This means we're in the air!    
if(!place_meeting(x, y+1, Solid)){
    vspd += grav;//appply gravity
    //Ninjas in the air and attacking
    if(attack_control){
        state = jump_attack_state;
        alarm[0] = room_speed/2.5;
        y += 1;
    }else{//Just in the air
        //image_index = 0;
        sprite_index = spr_ninja_jump;
        image_speed = 0;//lets just see about this
        image_index = (vspd > 0);//1 -> going down, 0 -> going up    very clever ben...
    }
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
    
    //Attacking
    if(attack_control){
        image_index = 0;
        state = attack_combo_one_state;
        //alarm[0] = 10;//room_speed/2;//<- 10
    }else{
        //Cannot attack and stab at the same time: two diff animations....
        if(stab_control){
            image_index = 0;
            state = stab_attack_state;
            alarm[0] = room_speed/2;
        }else{
            //ninja is grounded
            if(hspd == 0){
                //image_index = 0;
                sprite_index = spr_ninja_idle;
                image_speed = 0.2;//idle speed 20%
            }else{
                //image_index = 0;
                sprite_index = spr_ninja_run;
                image_speed = 0.4;//running speed 40%
            }
        }
        
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
            sprite_index = spr_ledge_grab;
            
            state = ledge_grab_state;
        }
















