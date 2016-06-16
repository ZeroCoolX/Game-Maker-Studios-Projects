///scr_move_state

movement = MOVE;

if(obj_input.dash_key){//can only dash if key pressed AND had enough stamina to dash
    //8 is the distance needed to be for the sign to activate
    var xdir = lengthdir_x(8, face*90);
    var ydir = lengthdir_y(8, face*90);
    var speaker = instance_place(x+xdir, y+ydir, obj_speaker)//return id ofspeaker object to access it later IF its within range
    
    if(speaker != noone){
        //Talk to it
        ///Activate the dialog
        with(speaker){
            if(!instance_exists(dialog)){
                dialog = instance_create(x+xoffset, y+yoffset, obj_dialog);
                dialog.text = text;
            }else{
                dialog.text_page++;
                dialog.text_count = 0;
                if(dialog.text_page > array_length_1d(dialog.text)-1){
                    with(dialog){
                        instance_destroy();
                    }
                }
            }
        }
    }else if(obj_player_stats.stamina >= DASH_COST){
        state = scr_dash_state;
        alarm[0] = room_speed / 6; //frames per second - 30 for now. 8 is arbitrary
        obj_player_stats.stamina -= DASH_COST;
        obj_player_stats.alarm[0] = room_speed;
    }
}

if(obj_input.attack_key){
    image_index = 0;//reset frame index so we can begin attack animation
    state = scr_attack_state;
}

if(obj_input.spell_key){
    var proj = instance_create(x,y,obj_projectile);
    var xforce = lengthdir_x(20, face*90);//get speed and diection we're facing
    var yforce = lengthdir_y(20, face*90);
    proj.creator = id;
    
    with(proj){
        physics_apply_impulse(x, y, xforce, yforce);
    }
}

//Get direction
/*
    90
180     0
    270
*/
dir = point_direction(0,0, obj_input.xaxis, obj_input.yaxis);

//Get length
if(obj_input.xaxis == 0 && obj_input.yaxis == 0){
    len = 0;
}else{
    len = spd;
    scr_get_face();
}

//Get the speeds of the player
//function to convert a length and direction into a speed
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

//Move 
phy_position_x += hspd;
phy_position_y += vspd;

//Control the sprite
image_speed = 0.2;//sign returns 1 or -1 based

if(len == 0){
    image_index = 0;//standing sprite image within current animation
}



