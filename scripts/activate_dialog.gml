global.current_talker = object_index;
global.conv_talking = 1;

if (instance_exists(obj_letter))
{
    with (obj_letter)
    {
        if (text_fade == 1)
        {
            fade_out = 1;
            
            switch (text_fly)
            {
                case 1:
                    direction = irandom_range(85, 95);
                    speed = random_range(0.5, 1);
                    alarm[3] = 0;
                    break;
                
                case 2:
                    direction = irandom_range(175, 185);
                    speed = random_range(0.5, 1);
                    alarm[3] = 0;
                    break;
                
                case 3:
                    direction = irandom_range(265, 275);
                    speed = random_range(0.5, 1);
                    alarm[3] = 0;
                    break;
                
                case 4:
                    direction = irandom_range(355, 5);
                    speed = random_range(0.5, 1);
                    alarm[3] = 0;
                    break;
            }
        }
        else
        {
            instance_destroy();
        }
    }
}

if (instance_exists(obj_talky))
{
    with (obj_talky)
        instance_destroy();
}

if (instance_exists(obj_con_arrow))
{
    with (obj_con_arrow)
        instance_destroy();
}

if (instance_exists(obj_button_dialog_parent))
{
    with (obj_button_dialog_parent)
        instance_destroy();
}

if (instance_exists(obj_textbox_border))
{
    with (obj_textbox_border)
        instance_destroy();
}

switch (text_location)
{
    case 0:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2));
            y = floor((view_yview + view_hview) - (sprite_get_height(textbox_sprite) / 2) - (sprite_get_height(textbox_sprite) / 6));
        }
        
        break;
    
    case 1:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2));
            y = floor(view_yview + (sprite_get_height(spr_blank_talky) / 2) + (sprite_get_height(spr_blank_talky) / 4));
        }
        
        break;
    
    case 2:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2));
            y = floor(view_yview + (sprite_get_height(spr_blank_talky) / 4) + (sprite_get_height(spr_blank_talky) / 8));
        }
        
        break;
    
    case 3:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2)) - 65;
            y = floor((view_yview + view_hview) - (sprite_get_height(textbox_sprite) / 2) - (sprite_get_height(textbox_sprite) / 6));
        }
        
        break;
    
    case 4:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2)) + 65;
            y = floor((view_yview + view_hview) - (sprite_get_height(textbox_sprite) / 2) - (sprite_get_height(textbox_sprite) / 6));
        }
        
        break;
    
    case 5:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2));
            y = floor(view_yview + (view_hview / 2));
        }
        
        break;
    
    case 6:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2)) - 65;
            y = floor(view_yview + (sprite_get_height(spr_blank_talky) / 4) + (sprite_get_height(spr_blank_talky) / 8));
        }
        
        break;
    
    case 7:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2)) + 65;
            y = floor(view_yview + (sprite_get_height(spr_blank_talky) / 4) + (sprite_get_height(spr_blank_talky) / 8));
        }
        
        break;
    
    case 8:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2)) - 65;
            y = floor(view_yview + (view_hview / 2));
        }
        
        break;
    
    case 9:
        with (obj_textbox)
        {
            x = floor(view_xview + (view_wview / 2)) + 65;
            y = floor(view_yview + (view_hview / 2));
        }
}

with (obj_textbox)
{
    text_flipped = other.text_flipped;
    text_border = other.text_border;
    text_skip = other.text_skip;
    text_fade = other.text_fade;
    text_fly = other.text_fly;
    text_timer = other.text_timer;
    text_location = other.text_location;
}

var count = 1;
var char_count = 1;
var active_language = 1;
var active_spinning = 0;
var active_speed = 1;
var active_voice = 0;
var active_talky = 0;
var active_color = 16777215;
var alt_char = "_";
global.base_message = global.dialog_array[cur_message, 1];
var character_index = global.dialog_array[cur_message, 2];
active_talky = global.talky_list[character_index, 1];
active_voice = global.voice_list[character_index, 1];
talking_state = 1;

while (count <= string_length(global.base_message))
{
    cur_char = string_char_at(global.base_message, count);
    
    if (cur_char == "*")
    {
        count++;
        cur_language = "";
        
        while (string_pos(cur_char, "_") == 0)
        {
            cur_char = string_char_at(global.base_message, count);
            cur_language += cur_char;
            count++;
            cur_char = string_char_at(global.base_message, count);
        }
        
        active_language = real(cur_language);
        cur_char = string_char_at(global.base_message, count);
    }
    
    if (cur_char == "&")
    {
        count++;
        cur_spinning = "";
        
        while (string_pos(cur_char, "_") == 0)
        {
            cur_char = string_char_at(global.base_message, count);
            cur_spinning += cur_char;
            count++;
            cur_char = string_char_at(global.base_message, count);
        }
        
        active_spinning = real(cur_spinning);
        cur_char = string_char_at(global.base_message, count);
    }
    
    if (cur_char == "$")
    {
        count++;
        cur_speed = "";
        
        while (string_pos(cur_char, "_") == 0)
        {
            cur_char = string_char_at(global.base_message, count);
            cur_speed += cur_char;
            count++;
            cur_char = string_char_at(global.base_message, count);
        }
        
        active_speed = real(cur_speed);
        cur_char = string_char_at(global.base_message, count);
    }
    
    if (cur_char == "^")
    {
        count++;
        cur_color = "";
        
        while (string_pos(cur_char, "_") == 0)
        {
            cur_char = string_char_at(global.base_message, count);
            cur_color += cur_char;
            count++;
            cur_char = string_char_at(global.base_message, count);
        }
        
        active_color = real(cur_color);
        cur_char = string_char_at(global.base_message, count);
    }
    
    if (cur_char == "%")
    {
        count++;
        cur_emotion = "";
        
        while (string_pos(cur_char, "_") == 0)
        {
            cur_char = string_char_at(global.base_message, count);
            cur_emotion += cur_char;
            count++;
            cur_char = string_char_at(global.base_message, count);
        }
        
        selected_emotion = real(cur_emotion);
        talky_link = global.talky_list[character_index, selected_emotion];
        active_talky = talky_link;
        voice_link = global.voice_list[character_index, selected_emotion];
        active_voice = voice_link;
        cur_char = string_char_at(global.base_message, count);
    }
    
    if (cur_char == "@")
    {
        count++;
        cur_char = string_char_at(global.base_message, count);
        
        while (string_pos(cur_char, "@") == 0)
        {
            cur_char = string_char_at(global.base_message, count);
            global.message_language_list[char_count] = active_language;
            global.message_spinning_list[char_count] = active_spinning;
            global.message_speed_list[char_count] = active_speed;
            global.message_color_list[char_count] = active_color;
            global.message_emotion_list[char_count] = active_talky;
            
            if (cur_char == " ")
                global.message_voice_list[char_count] = " ";
            
            if (cur_char != " ")
                global.message_voice_list[char_count] = active_voice;
            
            global.message_text += cur_char;
            count++;
            char_count++;
            cur_char = string_char_at(global.base_message, count);
        }
        
        if (cur_char == "@")
        {
            count++;
            cur_char = string_char_at(global.base_message, count);
            
            while (string_pos(cur_char, "@") == 0)
            {
                cur_char = string_char_at(global.base_message, count);
                global.altmessage_text += cur_char;
                count++;
                cur_char = string_char_at(global.base_message, count);
            }
        }
    }
    
    if (string_pos(cur_char, "$@%^_*&") == 0)
    {
        global.message_language_list[char_count] = active_language;
        global.message_spinning_list[char_count] = active_spinning;
        global.message_speed_list[char_count] = active_speed;
        global.message_color_list[char_count] = active_color;
        global.message_emotion_list[char_count] = active_talky;
        
        if (cur_char == " ")
            global.message_voice_list[char_count] = " ";
        
        if (cur_char != " ")
            global.message_voice_list[char_count] = active_voice;
        
        global.message_text += cur_char;
        global.altmessage_text += alt_char;
        char_count++;
    }
    
    count++;
}

if (text_move == 0)
    global.player_frozen = 1;
