///scr_attack_state
image_speed = 0.5;

//determine which attack animation to use
switch(sprite_index){
    case spr_player_down:
        sprite_index = spr_player_attack_down;
        break;
    case spr_player_right:
        sprite_index = spr_player_attack_right;
        break;
    case spr_player_left:
        sprite_index = spr_player_attack_left;
        break;
    case spr_player_up:
        sprite_index = spr_player_attack_up;
        break;
}

//frame 4 (index 3) is where the attack actually "hits" 
if(image_index >= 3 && !attacked){//only create damage object once per attack

    //determine where to position the damage object 
    var xx = 0;
    var yy = 0;
    
    switch(sprite_index){
        case spr_player_attack_down:
            xx = x;
            yy = y+14;
            break;
        case spr_player_attack_right:
            xx = x+10;
            yy = y;
            break;
        case spr_player_attack_left:
            xx = x - 10;
            yy = y;
            break;
        case spr_player_attack_up:
            xx = x;
            yy = y-10;
            break;
    }
    
    var damage = instance_create(xx,yy, obj_damage);//the id of the newly created object is returned
    damage.creator = id;//set THAT ^^ object's id to this id
    damage.damage = obj_player_stats.attack;//damage the enemy by the attack of the player
    attacked = true;
}
