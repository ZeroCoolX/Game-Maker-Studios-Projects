///get_input()

//default keyboard input
    right_control = (keyboard_check(vk_right) || keyboard_check(ord("D")));
    left_control = (keyboard_check(vk_left) || keyboard_check(ord("A"))); 
    up_control = (keyboard_check(vk_up) || keyboard_check(ord("W")));
    down_control = (keyboard_check(vk_down) || keyboard_check(ord("S")));
    attack = keyboard_check(ord("T"));
    
//Override the gamepad input
var gp_id = 0;
var thresh = 0.5;

//Only check if there is even a gamepad connected 
if(gamepad_is_connected(gp_id)){
    up_control = gamepad_button_check_pressed(gp_id, gp_face1);
    up_release = gamepad_button_check_pressed(gp_id, gp_face1);
    right_control = (gamepad_axis_value(gp_id, gp_axislh) > thresh);
    left_control = (gamepad_axis_value(gp_id, gp_axislh) < -thresh);
    down_control = (gamepad_axis_value(gp_id, gp_axislv) > thresh);
}
