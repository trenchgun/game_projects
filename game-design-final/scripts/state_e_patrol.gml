/// state_e_patrol();
if (state_new) {
    anim_frame = 0;
    // choose random direction to walk
    patrol_dir = irandom(7) * 45; 
}




/* MOVE TOWARDS PLAYER
// get path
scr_get_path_to_point(obj_player.x, obj_player.y);

// get the next point along the path
var tx = path_get_point_x(path, 1);
var ty = path_get_point_y(path, 1);

// "push" yourself towards that next point
var new_spd = spd; // make it faster then path speed for jellyfish results
var new_dir = point_direction(x, y, tx, ty);
var hspd = lengthdir_x(new_spd, new_dir);
var vspd = lengthdir_y(new_spd, new_dir);
//phy_rotation = -new_dir + 90;
legs_dir = new_dir;
body_dir = new_dir;
head_dir = new_dir;

phy_position_x += hspd;
phy_position_y += vspd;

//physics_apply_force(x, y, new_force_x, new_force_y);
*/

// check if dead
if (hp <= 0) {
    state_switch("Dead");
}

// animate
spr_legs = anim_legs_walk[anim_frame];
if (state_timer % 2 == 0) {
    anim_frame++;
}
if (anim_frame == 8) {
    anim_frame = 0;
}

scr_get_depth_phy();

