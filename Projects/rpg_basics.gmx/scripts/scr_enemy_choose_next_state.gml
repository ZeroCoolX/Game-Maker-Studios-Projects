///scr_enemy_choose_next_state()

if(alarm[0] <= 0){
    //chooses randomly between the two states
    state = choose(scr_enemy_wander_state, scr_enemy_idle_state);
    
    //reset alarm
    alarm[0] = room_speed*irandom_range(2,4);//random integer between the range values
    
    //give enemy random point in the room to try and move to
    targetx = random(room_width);
    targety = random(room_height);
}
