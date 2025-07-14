if (global.gamepad_connected == 1)
{
    gamepad_set_axis_deadzone(0, 0.5);
    global.up_key = gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < 0;
    global.left_key = gamepad_button_check(0, gp_padl) || gamepad_axis_value(0, gp_axislh) < 0;
    global.down_key = gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0;
    global.right_key = gamepad_button_check(0, gp_padr) || gamepad_axis_value(0, gp_axislh) > 0;
    
    if (alarm[0] <= 0)
    {
        global.up_key_pressed = gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < 0;
        global.left_key_pressed = gamepad_button_check(0, gp_padl) || gamepad_axis_value(0, gp_axislh) < 0;
        global.down_key_pressed = gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0;
        global.right_key_pressed = gamepad_button_check(0, gp_padr) || gamepad_axis_value(0, gp_axislh) > 0;
        var check_controls = global.up_key_pressed + global.left_key_pressed + global.down_key_pressed + global.right_key_pressed;
        
        if (check_controls != 0)
            alarm[0] = 10;
    }
    else
    {
        global.up_key_pressed = gamepad_button_check_pressed(0, gp_padu);
        global.left_key_pressed = gamepad_button_check_pressed(0, gp_padl);
        global.down_key_pressed = gamepad_button_check_pressed(0, gp_padd);
        global.right_key_pressed = gamepad_button_check_pressed(0, gp_padr);
    }
    
    global.a_key = gamepad_button_check_pressed(0, gp_face1);
    global.b_key = gamepad_button_check_pressed(0, gp_face2);
    global.x_key = gamepad_button_check_pressed(0, gp_face3);
    global.y_key = gamepad_button_check_pressed(0, gp_face4);
    global.accept_key = gamepad_button_check_pressed(0, gp_face1);
    global.cancel_key = gamepad_button_check_pressed(0, gp_face2);
}
else
{
    global.up_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
    global.left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
    global.down_key = keyboard_check(vk_down) || keyboard_check(ord("S"));
    global.right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));
    global.up_key_pressed = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
    global.left_key_pressed = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
    global.down_key_pressed = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
    global.right_key_pressed = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
    global.accept_key = keyboard_check_pressed(ord("Z")) || mouse_check_button_pressed(mb_left);
    global.cancel_key = keyboard_check_pressed(ord("X")) || mouse_check_button_pressed(mb_right);
}

global.event_key = keyboard_check_pressed(vk_decimal);
