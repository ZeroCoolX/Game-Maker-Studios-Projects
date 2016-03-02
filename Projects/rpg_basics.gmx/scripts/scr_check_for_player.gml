///scr_check_for_player()
if(instance_exists(obj_player)){
    //if the player exists move towards it
    var dis = point_distance(x, y, obj_player.x, obj_player.y); 
    if(dis < sight){//player is within chase range
        state = scr_enemy_chase_state;
        targetx = obj_player.x;
        targety = obj_player.y;
    }else{
        scr_enemy_choose_next_state();
    }
}else{
        scr_enemy_choose_next_state();
}
