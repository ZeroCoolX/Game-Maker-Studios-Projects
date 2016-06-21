///scr_attack_state
image_speed = 0.5;

//determine which attack animation to use
movement = ATTACK;

if(scr_animation_hit_frame(2)){
    var attack_animation = instance_create(x, y, weapon);
    attack_animation.dir = face*90;//get direction player if facing (will come in handy soon)
    attack_animation.image_angle = (face*90) + 45
}
//frame 4 (index 3) is where the attack actually "hits" 
if(scr_animation_hit_frame(3)){//only create damage object once per attack

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
    audio_play_sound(snd_sword_attack, 8, false);//play sound
    var damage = instance_create(xx,yy, obj_damage);//the id of the newly created object is returned
    damage.creator = id;//set THAT ^^ object's id to this id
    damage.damage = obj_player_stats.attack;//damage the enemy by the attack of the player
    attacked = true;
}
