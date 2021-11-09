/// state_e_seek_cover();
var last_known_x, last_known_y;
var px = obj_player.x;
var py = obj_player.y;

if (state_new) {
    // find an appropriate place to seek cover
    // criteria:
    // - space near a solid
    // - does not have LOS to player
    
    // grab nearest cover waypoint
    cover = instance_nearest(x,y,wp_cover);
    
    // try to find a better cover position
    with (wp_cover) {
        t_peek = instance_nearest(x,y,wp_peek);
        // make sure the cover point is within range of enemy
        // also make sure it is close enough to a peek location
        if ((point_distance(x,y,other.x,other.y) < 128) && (point_distance(x,y,t_peek.x,t_peek.y) < 128)) {
            // make sure enemy is not moving towards player
            //if (angle_difference(point_direction(other.x,other.y,px,py), point_direction(other.x,other.y,x,y)) < 45) { 
                // make sure enemy cant be seen by player at cover location
                if (collision_line(x,y,px,py,obj_wall, false, true)) {
                    other.cover = self;
                    //break;
                }
            //}
        }
    }
}


// get path
scr_get_path_to_point(cover.x, cover.y);

// get the next point along the path
var tx = path_get_point_x(path, 1);
var ty = path_get_point_y(path, 1);

// "push" yourself towards that next point
//var new_spd = spd; // make it faster then path speed for jellyfish results
legs_dir = point_direction(x, y, tx, ty);
hspd = lengthdir_x(spd, legs_dir);
vspd = lengthdir_y(spd, legs_dir);
var los_player = (!collision_line(x,y,px,py,obj_wall,false,true));

// set direction
if (los_player) {
    body_dir = point_direction(x,y,px,py);
    head_dir = body_dir;
} else {
    body_dir = legs_dir;
    head_dir = legs_dir;
}

if (point_distance(x,y,cover.x,cover.y) < 8) {
    //path_clear_points(path);
    state_switch("InCover");
}

phy_position_x += hspd;
phy_position_y += vspd;

//physics_apply_force(x, y, hspd*2, vspd*2);

// animate

spr_legs = anim_legs_walk[anim_frame];
if (state_timer % 2 == 0) {
    anim_frame++;
}
if (anim_frame == 8) {
    anim_frame = 0;
}

/*

var los_player = (!collision_line(x,y,px,py,obj_wall,false,true));
if (distance_to_object(cover) < 4) {
    legs_dir = point_direction(x,y,cx,cy);
    hspd = lengthdir_x(spd, legs_dir);
    vspd = lengthdir_y(spd, legs_dir);
    if (los_player) {
        body_dir = point_direction(x,y,px,py);
        head_dir = body_dir;
    } else {
        body_dir = legs_dir;
        head_dir = legs_dir;
    }
    phy_position_x += hspd;
    phy_position_y += vspd;
    
    // animate
    spr_legs = anim_legs_walk[anim_frame];
    if (state_timer % 2 == 0) {
        anim_frame++;
    }
    if (anim_frame == 8) {
        anim_frame = 0;
    }
}
*/

// check if dead
if (hp <= 0) {
    state_switch("Dead");
}



scr_get_depth_phy();
