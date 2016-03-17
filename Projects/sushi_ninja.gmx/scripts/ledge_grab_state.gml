///ledge_grab_state()

//can use up_control, down_control
  var  up_control = (keyboard_check(vk_up) || keyboard_check(ord("W")));
  var  down_control = (keyboard_check(vk_down) || keyboard_check(ord("S")));

if(down_control){
    state = move_state;
}

if(up_control){
    state = move_state;
    vspd = -jspd;
}
