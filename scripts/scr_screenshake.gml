shake_intensity = argument0;
shake_duration = room_speed * argument1;
shake_direction = argument2;
shake_x = argument3;
shake_y = argument4;

with (instance_create(obj_view.x, obj_view.y, obj_screenshake))
{
    shake_intensity = other.shake_intensity;
    shake_duration = other.shake_duration;
    shake_direction = other.shake_direction;
    start_x = other.shake_x;
    start_y = other.shake_y;
    
    if (global.gamepad_connected == 1)
        gamepad_set_vibration(0, shake_intensity / 10, shake_intensity / 10);
    
    start_obj = view_object[0];
    view_object[0] = -4;
    alarm[0] = shake_duration;
    alarm[1] = 1;
}
