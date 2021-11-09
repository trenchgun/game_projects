var px = obj_player.x;
var py = obj_player.y;
var los_player = (!collision_line(x,y,px,py,obj_wall,false,true));

/// state_e_in_cover();
if (state_new) {
    // set leg sprite to idle since we arent moving
    spr_legs = spr_legs_idle;
    // find the spot to peek from
    peek = instance_nearest(x,y,wp_peek);

    //if (point_distance(x,y,peek.x,peek.y) > 128) {
    //    peek = cover;
    //}
    
    alarm[4] = room_speed * (irandom(2)+1); 
}

// This state has the enemy continuously move 
// out of cover to a peek waypoint and shoot
// at the player.

// execute actions based on
// 0 --> not peeking
// 1 --> moving to peek
// 2 --> peeking
// 3 --> moving back to cover 

//if (peek != noone) {
switch (peeking) {
    case 0: // in cover, not peeking
        // change sprites
        spr_legs = spr_legs_idle;
        // reset ammo
        ammo_loaded = ammo_mag;
        // if player can see us, we need to find new cover
        // make sure we arent peeking constantly
        //if (state_timer mod room_speed) {
            // only a 50% chance to peek every second
            //if (irandom(1) = 1) {
        //if (!covering) {
                //alarm[4] = room_speed * (irandom(2)+1);
                // create path to peek
                //scr_get_path_to_point(peek.x, peek.y);
                // change substate
                //peeking = 1;
                //break;
            //}
        //}
        if los_player {
            state_switch("SeekCover");
            break;
        }
        break;
    case 1: // moving to peek
    case 3: // moving to cover
    
        var target;
        if (peeking == 1) {
            target = peek;
        } else {
            target = cover;
        }
        
        scr_get_path_to_point(target.x, target.y);
        
        // change body to gun down sprite
        spr_body = spr_body_idle;
        // move to and from cover and peeking
    
        // get the next point along the path
        var tx = path_get_point_x(path, 1);
        var ty = path_get_point_y(path, 1);
        
        // "push" yourself towards that next point
        //var new_spd = spd; // make it faster then path speed for jellyfish results
        legs_dir = point_direction(x, y, tx, ty);
        hspd = lengthdir_x(spd, legs_dir);
        vspd = lengthdir_y(spd, legs_dir);
        
        
        // set direction
        if (los_player) {
            body_dir = point_direction(x,y,px,py);
            head_dir = body_dir;
        } else {
            body_dir = legs_dir;
            head_dir = legs_dir;
        }
    
        phy_position_x += hspd;
        phy_position_y += vspd;
        
        if (peeking == 1) {
            if (point_distance(x,y,peek.x,peek.y) < 8) {
                // reached peek location
                //path_clear_points(path);
                // set timer for how long to peek
                alarm[3] = room_speed * (irandom(2)+1);
                // change substate
                peeking = 2;
                break;
            }
        }
        if (peeking == 3) {
            if (point_distance(x,y,cover.x,cover.y) < 8) {
                // reached peek location
                //path_clear_points(path);
                // change substate
                alarm[4] = room_speed * (irandom(2)+1);
                peeking = 0;
                break;
            }
        }

        //physics_apply_force(x, y, hspd*2, vspd*2);
        
        // animate
        if (hspd != 0 || vspd != 0) {
            spr_legs = anim_legs_walk[anim_frame];
            if (state_timer % 2 == 0) {
                anim_frame++;
            }
            if (anim_frame == 8) {
                anim_frame = 0;
            }
        } else {
            spr_legs = spr_legs_idle;
        }
        
        break;
    case 2: // peeking, shooting
        // change body to gun up sprite
        spr_body = spr_body_aggro;
        spr_legs = spr_legs_idle;
        aim_dir = point_direction(x,y,px,py);
        
        
        if (!los_player && (p_last_x != 0) && (p_last_y != 0)) {
            aim_dir = point_direction(x,y,p_last_x,p_last_y);
        }
        legs_dir = aim_dir;
        body_dir = aim_dir;
        head_dir = aim_dir;
        aim_dir += irandom(gun_spread*2) - gun_spread;
        //spr_body = spr_e_robo_hg_up;
        // shoot at player till out of ammo
        if (!firing  && (ammo_loaded > 0)) {
            
            // rate of fire
            firing = true;
            alarm[0] = gun_rof;
            // create bullet
            var gx = x + lengthdir_x(16,aim_dir);
            var gy = y + lengthdir_y(16,aim_dir);
            with instance_create(gx, gy, obj_bullet_enemy) {
                phy_rotation = -other.aim_dir;
                physics_apply_local_force(0,0,175,0);
            }
            // manage ammo
            ammo_loaded --;
        }
        break;
    default:
        break;
}
//}
// check if dead
if (hp <= 0) {
    state_switch("Dead");
}

// get depth
scr_get_depth_phy();
