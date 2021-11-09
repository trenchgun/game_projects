/// state_e_zombie_aggro();
if (state_new) {
    spr_body = spr_e_zombie_body_aggro;
}

// MOVE TOWARDS PLAYER
// get path
scr_get_path_to_point(obj_player.x, obj_player.y);

// get the next point along the path
var tx = path_get_point_x(path, 1);
var ty = path_get_point_y(path, 1);

// "push" yourself towards that next point
legs_dir = point_direction(x, y, tx, ty);
hspd = lengthdir_x(spd, legs_dir);
vspd = lengthdir_y(spd, legs_dir);
//phy_rotation = -new_dir + 90;
body_dir = legs_dir;
head_dir = legs_dir;

//phy_position_x += hspd;
//phy_position_y += vspd;

physics_apply_force(x, y, hspd*2, vspd*2);

// check if dead
if (hp <= 0) {
    state_switch("Dead");
}

// check if we are close enough to player to attack
if !firing {
if (point_distance(x,y,obj_player.x,obj_player.y) < 16) {
    firing = true;
    alarm[0] = gun_reload_time/6;   // set animation change timer
    spr_body = spr_e_zombie_body_idle;
    alarm[1] = gun_reload_time;     // set attack recharge timer
    obj_player.hp -= 25;
    obj_player.taking_damage = true;
}
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

