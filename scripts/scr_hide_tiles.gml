var tile_depth = argument0;
var tile_alpha = argument1;
var cur_tile = 0;
var total_tiles = tile_get_ids_at_depth(tile_depth);

for (cur_tile = 0; cur_tile < array_length_1d(total_tiles); cur_tile++)
    tile_set_alpha(total_tiles[cur_tile], tile_alpha);
