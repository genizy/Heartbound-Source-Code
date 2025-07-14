if (instance_exists(obj_roomdark_parent))
{
    if (light_activate == 1)
    {
        draw_set_blend_mode_ext(9, bm_one);
        
        if (light_direction == 0)
        {
            var lighted_x = floor(x - sprite_get_xoffset(sprite_index));
            var lighted_y = floor(y - sprite_get_yoffset(sprite_index));
            
            if (last_image != image_index || last_sprite != sprite_index)
            {
                last_image = image_index;
                last_sprite = sprite_index;
                var light_distance = floor(x - light_caster.x);
                
                if (light_distance < 1)
                    light_distance = 1;
                
                if (last_blend != light_caster.image_blend)
                {
                    light_hue = color_get_hue(light_caster.image_blend);
                    light_saturation = color_get_saturation(light_caster.image_blend);
                    last_blend = light_caster.image_blend;
                }
                
                var light_value = light_luminosity * ((light_caster.sprite_width - light_distance) / light_caster.sprite_width);
                light_value = clamp(light_value, 0, 255);
                
                for (yy = 0; yy <= (sprite_height - 1); yy++)
                {
                    for (xx = 0; xx <= (sprite_width - 1); xx++)
                    {
                        if (position_meeting(lighted_x + xx, lighted_y + yy, object_index))
                        {
                            pixels_found = 1;
                            
                            repeat (light_diffuse)
                            {
                                if (position_meeting(lighted_x + xx, lighted_y + yy, object_index))
                                {
                                    var draw_x = floor(lighted_x + xx);
                                    var draw_y = floor(lighted_y + yy);
                                    var new_value = light_value - (pixels_found * light_falloff);
                                    
                                    if (new_value < 0)
                                        new_value = 0;
                                    
                                    var draw_color = make_color_hsv(light_hue, light_saturation, new_value);
                                    draw_sprite_ext(spr_pixel, 0, draw_x, draw_y, image_xscale, image_yscale, image_angle, draw_color, image_alpha);
                                    pixels_found++;
                                    xx++;
                                }
                            }
                            
                            break;
                        }
                    }
                }
            }
        }
        else if (light_direction == 1)
        {
        }
        else if (light_direction == 2)
        {
            var lighted_x = floor(x - sprite_get_xoffset(sprite_index));
            var lighted_y = floor(y - sprite_get_yoffset(sprite_index));
            
            if (last_image != image_index || last_sprite != sprite_index)
            {
                last_image = image_index;
                last_sprite = sprite_index;
                var light_distance = floor(light_caster.x - x);
                
                if (light_distance < 1)
                    light_distance = 1;
                
                if (last_blend != light_caster.image_blend)
                {
                    light_hue = color_get_hue(light_caster.image_blend);
                    light_saturation = color_get_saturation(light_caster.image_blend);
                    last_blend = light_caster.image_blend;
                }
                
                var light_value = light_luminosity * ((light_caster.sprite_width - light_distance) / light_caster.sprite_width);
                light_value = clamp(light_value, 0, 255);
                
                for (yy = 0; yy <= (sprite_height - 1); yy++)
                {
                    xx = sprite_width - 1;
                    
                    while (xx >= 0)
                    {
                        if (position_meeting(lighted_x + xx, lighted_y + yy, object_index))
                        {
                            pixels_found = 1;
                            
                            repeat (light_diffuse)
                            {
                                if (position_meeting(lighted_x + xx, lighted_y + yy, object_index))
                                {
                                    var draw_x = floor(lighted_x + xx);
                                    var draw_y = floor(lighted_y + yy);
                                    var new_value = light_value - (pixels_found * light_falloff);
                                    
                                    if (new_value < 0)
                                        new_value = 0;
                                    
                                    var draw_color = make_color_hsv(light_hue, light_saturation, new_value);
                                    draw_sprite_ext(spr_pixel, 0, draw_x, draw_y, image_xscale, image_yscale, image_angle, draw_color, image_alpha);
                                    pixels_found++;
                                    xx--;
                                }
                            }
                            
                            break;
                        }
                        
                        xx--;
                    }
                }
            }
        }
        else if (light_direction == 3)
        {
            var draw_hue = color_get_hue(light_caster.image_blend);
            var draw_saturation = color_get_saturation(light_caster.image_blend);
            var draw_value = color_get_value(light_caster.image_blend);
            var light_distance = floor(light_caster.y - y);
            
            if (light_distance < 1)
                light_distance = 1;
            
            var new_value = light_luminosity * ((light_caster.sprite_width - light_distance) / light_caster.sprite_width);
            
            if (new_value > 255)
                new_value = 255;
            
            if (new_value < 0)
                new_value = 0;
            
            var draw_color = make_color_hsv(draw_hue, draw_saturation, new_value);
            draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, draw_color, image_alpha);
        }
        
        draw_set_blend_mode(bm_normal);
    }
}
