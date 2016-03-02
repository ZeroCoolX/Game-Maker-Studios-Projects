///scr_get_input()

/*
Keyboard Ghosting
https://www.microsoft.com/appliedsciences/antighostingexplained.mspx
*/

//keyboard input
right_key = (keyboard_check(vk_right) || keyboard_check(ord('D')));
left_key = (keyboard_check(vk_left) || keyboard_check(ord('A')));
up_key = (keyboard_check(vk_up) || keyboard_check(ord('W')));
down_key = (keyboard_check(vk_down) || keyboard_check(ord('S')));
attack_key = keyboard_check_pressed(ord('X'));
//had to switch the dash key from C to space due to a ghosting issue when S+D+C was pressedw
dash_key = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_shift));
pause_key = keyboard_check_pressed(vk_escape);


//Set axis instance variables
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

//Check for gamepad input first so both can be implemented - exact input values

if(gamepad_is_connected(0)){
    gamepad_set_axis_deadzone(0, 0.35);//don't move the player if the joystick isn't ACTUALLY being pushed
    right_key = gamepad_button_check_pressed(0, gp_padr);
    left_key = gamepad_button_check_pressed(0, gp_padl);
    up_key = gamepad_button_check_pressed(0, gp_padu);
    down_key = gamepad_button_check_pressed(0, gp_padd);
    xaxis = gamepad_axis_value(0, gp_axislh);//(device, axis-index)
    yaxis = gamepad_axis_value(0, gp_axislv);
    dash_key = gamepad_button_check_pressed(0, gp_face1);// A button on the xbox-360 controller
    attack_key = gamepad_button_check_pressed(0, gp_face3);// X button on the xbox-360 controller
    pause_key = gamepad_button_check_pressed(0, gp_start);//Start button on the xbox-360 controller
}
