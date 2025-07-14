if (global.player_frozen == 0 && global.combat_active == 0)
{
    xaxis = global.right_key - global.left_key;
    yaxis = global.down_key - global.up_key;
    xpush = global.right_key - global.left_key;
    ypush = global.down_key - global.up_key;
    mask_index = spr_lore_mask;
    collide_left_x = round(bbox_left);
    collide_top_y = round(bbox_top);
    collide_right_x = round(bbox_right);
    collide_bottom_y = round(bbox_bottom);
    
    if (instance_exists(obj_character_parent))
    {
        with (obj_character_parent)
            mask_index = collision_mask;
    }
    
    if (xaxis > 0)
        global.player_direction = 1;
    else if (xaxis < 0)
        global.player_direction = 3;
    
    if (yaxis > 0)
        global.player_direction = 2;
    else if (yaxis < 0)
        global.player_direction = 4;
    
    if (xaxis != 0 && yaxis != 0)
    {
        xmove = x + (xaxis * global.player_speed_cur * 0.7);
        
        if (!place_meeting(xmove, y, obj_blocker_parent))
            x = xmove;
        else
            xaxis = 0;
        
        ymove = y + (yaxis * global.player_speed_cur * 0.7);
        
        if (!place_meeting(x, ymove, obj_blocker_parent))
            y = ymove;
        else
            yaxis = 0;
    }
    else
    {
        if (xaxis != 0)
        {
            xmove = x + (xaxis * global.player_speed_cur);
            
            if (!place_meeting(xmove, y, obj_blocker_parent))
                x = xmove;
            else
                xaxis = 0;
        }
        
        if (yaxis != 0)
        {
            ymove = y + (yaxis * global.player_speed_cur);
            
            if (!place_meeting(x, ymove, obj_blocker_parent))
                y = ymove;
            else
                yaxis = 0;
        }
    }
    
    if (instance_exists(obj_pushblock_parent))
    {
        with (obj_pushblock_parent)
        {
            vspeed = 0;
            hspeed = 0;
            push_vertical = 0;
            push_horizontal = 0;
            
            if (push_vertical_flag != 0)
            {
                with (obj_player_parent)
                {
                    if (place_meeting(x, ymove, other.id))
                    {
                        other.push_vertical = ypush;
                        yaxis = ypush;
                    }
                }
            }
            
            if (push_horizontal_flag != 0)
            {
                with (obj_player_parent)
                {
                    if (place_meeting(xmove, y, other.id))
                    {
                        other.push_horizontal = xpush;
                        xaxis = xpush;
                    }
                }
            }
            
            if (push_vertical != 0)
                vspeed = push_vertical * push_speed;
            
            if (push_horizontal != 0)
                hspeed = push_horizontal * push_speed;
            
            if (vspeed != 0)
            {
                if (place_meeting(x, y + vspeed, obj_blockstopper) || place_meeting(x, y + vspeed, obj_pushblock_parent))
                {
                    y -= vspeed;
                    
                    if (push_sound != 0)
                        audio_stop_sound(push_sound);
                    
                    obj_player_parent.yaxis = 0;
                }
                else
                {
                    if (vspeed > 0)
                        image_index -= 1;
                    else
                        image_index += 1;
                    
                    if (push_sound != 0)
                    {
                        if (!audio_is_playing(push_sound))
                            scr_sound_play(push_sound, 0.2, random_range(0.95, 1.05), 1);
                        
                        alarm[11] = room_speed * 0.25;
                    }
                }
            }
            
            if (hspeed != 0)
            {
                if (place_meeting(x + hspeed, y, obj_blockstopper) || place_meeting(x + hspeed, y, obj_pushblock_parent))
                {
                    x -= hspeed;
                    
                    if (push_sound != 0)
                        audio_stop_sound(push_sound);
                    
                    obj_player_parent.xaxis = 0;
                }
                else
                {
                    if (hspeed > 0)
                        image_index += 1;
                    else
                        image_index -= 1;
                    
                    if (push_sound != 0)
                    {
                        if (!audio_is_playing(push_sound))
                            scr_sound_play(push_sound, 0.2, random_range(0.95, 1.05), 1);
                        else
                            audio_sound_gain(push_sound, 0.2, 0);
                        
                        audio_sound_gain(push_sound, 0, 200);
                        alarm[11] = room_speed * 0.25;
                    }
                }
            }
        }
    }
    
    if (xaxis == 0 && yaxis == 0)
    {
        global.player_moving = 0;
        image_speed = 0.1;
        
        switch (global.player_direction)
        {
            case 1:
                sprite_index = global.clothing_array[4];
                break;
            
            case 2:
                sprite_index = global.clothing_array[5];
                break;
            
            case 3:
                sprite_index = global.clothing_array[6];
                break;
            
            case 4:
                sprite_index = global.clothing_array[7];
                break;
        }
    }
    else
    {
        global.player_moving = 1;
        image_speed = global.player_speed_cur * 0.1;
        
        switch (global.player_direction)
        {
            case 1:
                sprite_index = global.clothing_array[0];
                break;
            
            case 2:
                sprite_index = global.clothing_array[1];
                break;
            
            case 3:
                sprite_index = global.clothing_array[2];
                break;
            
            case 4:
                sprite_index = global.clothing_array[3];
                break;
        }
    }
    
    mask_index = sprite_index;
    
    if (instance_exists(obj_character_parent))
    {
        with (obj_character_parent)
            mask_index = sprite_index;
    }
}
else
{
    image_speed = 0.1;
    
    if (global.player_direction == 1)
        sprite_index = global.clothing_array[4];
    
    if (global.player_direction == 2)
        sprite_index = global.clothing_array[5];
    
    if (global.player_direction == 3)
        sprite_index = global.clothing_array[6];
    
    if (global.player_direction == 4)
        sprite_index = global.clothing_array[7];
    
    global.player_moving = 0;
    mask_index = sprite_index;
    
    if (instance_exists(obj_character_parent))
    {
        with (obj_character_parent)
            mask_index = sprite_index;
    }
}
