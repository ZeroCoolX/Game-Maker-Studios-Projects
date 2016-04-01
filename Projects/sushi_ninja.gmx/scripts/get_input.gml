///get_input()

    //get input - the novice way
    right_control = (keyboard_check(vk_right) || keyboard_check(ord("D")));
    left_control = (keyboard_check(vk_left) || keyboard_check(ord("A"))); 
    up_control = (keyboard_check(vk_up) || keyboard_check(ord("W")));
    down_control = (keyboard_check(vk_down) || keyboard_check(ord("S")));
    up_release = (keyboard_check_released(vk_up) || keyboard_check_released(ord("W")));
    attack_control = mouse_check_button_pressed(mb_left);
    stab_control = mouse_check_button_pressed(mb_right);
    
//Override the gamepad input
var gp_id = 0;
var thresh = 0.5;

//Only check if there is even a gamepad connected 
if(gamepad_is_connected(gp_id)){
    right_control = (gamepad_axis_value(gp_id, gp_axislh) > thresh);
    left_control = (gamepad_axis_value(gp_id, gp_axislh) < -thresh);
    down_control = (gamepad_axis_value(gp_id, gp_axislv) > thresh);
    
    up_control = gamepad_button_check(gp_id, gp_face1);// A button on the xbox-360 controlller
    up_release = gamepad_button_check_released(gp_id, gp_face1);// ^^^
    attack_control = gamepad_button_check_pressed(gp_id, gp_face3);// X button on the xbox-360 controller
    stab_control = gamepad_button_check_pressed(gp_id, gp_face2);// B button on the xbox-360 controller
}



