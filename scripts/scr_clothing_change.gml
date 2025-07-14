var clothing_selected = argument0;

switch (clothing_selected)
{
    case 0:
        global.player_clothing = "pajama";
        break;
    
    case 1:
        global.player_hp_cur = 20;
        global.player_hp_max = 20;
        global.player_clothing = "sweater";
        break;
    
    case 2:
        global.player_clothing = "pajamabook";
        break;
    
    case 3:
        global.player_hp_cur = 20;
        global.player_hp_max = 20;
        global.player_clothing = "sweaterbook";
        break;
}

global.storyline_array[1] = clothing_selected;
global.clothing_array = 0;
global.clothing_array[0] = asset_get_index("spr_lore_" + global.player_clothing + "_right_walk");
global.clothing_array[1] = asset_get_index("spr_lore_" + global.player_clothing + "_down_walk");
global.clothing_array[2] = asset_get_index("spr_lore_" + global.player_clothing + "_left_walk");
global.clothing_array[3] = asset_get_index("spr_lore_" + global.player_clothing + "_up_walk");
global.clothing_array[4] = asset_get_index("spr_lore_" + global.player_clothing + "_right_stand");
global.clothing_array[5] = asset_get_index("spr_lore_" + global.player_clothing + "_down_stand");
global.clothing_array[6] = asset_get_index("spr_lore_" + global.player_clothing + "_left_stand");
global.clothing_array[7] = asset_get_index("spr_lore_" + global.player_clothing + "_up_stand");
dialog_talky_init();
