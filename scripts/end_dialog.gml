if (global.combat_active == 0)
    global.player_frozen = 0;

with (obj_controller_dialog)
    alarm[0] = 1;

talking_state = 0;
next_step = 1;

if (text_fade == 1)
{
    with (obj_letter)
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
}
else
{
    with (obj_letter)
        instance_destroy();
}
