///scr_get_depth();
var newy = 0-(lengthdir_y(x + (sprite_width / 2), view_angle) + lengthdir_y(y + (sprite_height / 2), view_angle - 90));
if (phy_rotation = 0) {
    // origin in top left
    // object facing down
    var newy = 0-(lengthdir_y(x + (sprite_width / 2), view_angle) + lengthdir_y(y + (sprite_height / 2), view_angle - 90));
}

if (phy_rotation = -90) {
    // origin in bottom left
    // object facing right
    var newy = 0-(lengthdir_y(x + (sprite_height / 2), view_angle) + lengthdir_y(y - (sprite_width / 2), view_angle - 90));
}

if (phy_rotation = -180) {
    // origin in bottom right
    // object facing up
    var newy = 0-(lengthdir_y(x - (sprite_width / 2), view_angle) + lengthdir_y(y - (sprite_height / 2), view_angle - 90));
}

if (phy_rotation = -270) {
    // origin in top right
    // object facing left
    var newy = 0-(lengthdir_y(x - (sprite_height / 2), view_angle) + lengthdir_y(y + (sprite_width / 2), view_angle - 90));
}

depth = newy;
