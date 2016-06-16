///scr_attack_state
image_speed = 0.5;

//determine which attack animation to use
movement = ATTACK;

//frame 4 (index 3) is where the attack actually "hits" 
if(image_index >= 3 && !attacked){//only create damage object once per attack

    //determine where to position the damage object 
    var xx = 0;
    var yy = 0;
    
    switch(face){
        case DOWN:
            xx = x;
            yy = y+14;
            break;
        case RIGHT:
            xx = x+10;
            yy = y;
            break;
        case LEFT:
            xx = x - 10;
            yy = y;
            break;
        case UP:
            xx = x;
            yy = y-10;
            break;
    }
    
    var damage = instance_create(xx,yy, obj_damage);//the id of the newly created object is returned
    damage.creator = id;//set THAT ^^ object's id to this id
    damage.damage = obj_player_stats.attack;//damage the enemy by the attack of the player
    attacked = true;
}
