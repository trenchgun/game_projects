/// scr_draw_slices(sprite_index, direction)
// draw a sliced sprite

spr     = argument[0];
dir     = argument[1];
height  = argument[2];
if (argument_count > 3) { 
    color = argument[3]; 
} else {
    color = c_white;
}
if (argument_count > 4) {
    alpha = argument[4];
} else {
    alpha = 1;
}

// find appropriate offset
xOffset = lengthdir_x(height, dir - global.UPRIGHT);
yOffset = lengthdir_y(height, dir - global.UPRIGHT);

// iterate through each frame of the sprite
for (var i = 0; i < sprite_get_number(spr); i++) {
    // find x
    draw_x = x + lengthdir_x((i * 1)-height, global.UPRIGHT+90);
    draw_y = y + lengthdir_y((i * 1)-height, global.UPRIGHT+90);
    //draw_x = x + lengthdir_x((i * 1), (view_angle[0] * -1) + 90);
    //draw_y = y + lengthdir_y((i * 1), (view_angle[0] * -1) + 90);
    //draw_sprite_ext(spr, i, draw_x, draw_y, image_xscale, image_yscale, dir, c_white, image_alpha);
    draw_sprite_ext(spr, i, draw_x, draw_y, image_xscale, image_yscale, dir, color, alpha);
}

