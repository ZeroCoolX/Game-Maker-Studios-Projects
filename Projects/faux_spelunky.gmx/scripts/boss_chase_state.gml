///boss_chase_state()

var hor_dis = point_distance(x, y, Player.x, y);
if(hor_dis < sprite_width/2-16 || place_meeting(x-1, y, Solid) || place_meeting(x+1, y, Solid)){
    state = boss_smash_state;
    audio_play_sound(snd_jump, 4, false);
    hspd = 0;
}else{
    hspd = (Player.x - x) * 0.05;//move the boss 5% to the target
}
    move(Solid);
