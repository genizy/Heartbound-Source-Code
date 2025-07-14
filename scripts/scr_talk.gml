if (global.conv_talking == 0)
{
    if (global.accept_key && global.player_frozen == 0)
    {
        if (distance_to_object(obj_player_parent) <= talk_distance)
        {
            var pwall_1 = obj_player_parent.collide_left_x;
            var pwall_2 = obj_player_parent.collide_top_y;
            var pwall_3 = obj_player_parent.collide_right_x;
            var pwall_4 = obj_player_parent.collide_bottom_y;
            var right_check = 0;
            var down_check = 0;
            var left_check = 0;
            var up_check = 0;
            var talker_parent = object_get_parent(object_index);
            
            if (talker_parent == 0)
                mask_index = collision_mask;
            
            switch (global.player_direction)
            {
                case 1:
                    var twall_1 = bbox_left - talk_distance;
                    var twall_2 = bbox_top;
                    var twall_3 = bbox_left;
                    var twall_4 = bbox_bottom;
                    right_check = rectangle_in_rectangle(pwall_1, pwall_2, pwall_3, pwall_4, twall_1, twall_2, twall_3, twall_4);
                    break;
                
                case 2:
                    var twall_1 = bbox_left;
                    var twall_2 = bbox_top - talk_distance;
                    var twall_3 = bbox_right;
                    var twall_4 = bbox_bottom;
                    down_check = rectangle_in_rectangle(pwall_1, pwall_2, pwall_3, pwall_4, twall_1, twall_2, twall_3, twall_4);
                    break;
                
                case 3:
                    var twall_1 = bbox_right;
                    var twall_2 = bbox_top;
                    var twall_3 = bbox_right + talk_distance;
                    var twall_4 = bbox_bottom;
                    left_check = rectangle_in_rectangle(pwall_1, pwall_2, pwall_3, pwall_4, twall_1, twall_2, twall_3, twall_4);
                    break;
                
                case 4:
                    var twall_1 = bbox_left;
                    var twall_2 = bbox_top;
                    var twall_3 = bbox_right;
                    var twall_4 = bbox_bottom + talk_distance;
                    up_check = rectangle_in_rectangle(pwall_1, pwall_2, pwall_3, pwall_4, twall_1, twall_2, twall_3, twall_4);
                    break;
            }
            
            if (talker_parent == 0)
                mask_index = sprite_index;
            
            if (right_check || down_check || left_check || up_check)
            {
                global.current_talker = object_index;
                
                if (global.current_talker == object_index)
                {
                    if (talker_parent == 0 || talker_parent == 1 || talker_parent == 2)
                        activate_dialog();
                    
                    if (talker_parent == 4)
                    {
                        if (activated == 0)
                            activated = 1;
                        else
                            activated = 0;
                        
                        global.current_talker = 0;
                    }
                }
            }
        }
    }
}
