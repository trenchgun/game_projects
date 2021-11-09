/// state_e_dead();
if (state_new) {
    visible = false;
    // create particle effect
    dx = x + lengthdir_x(16,global.UPRIGHT+90);
    dy = y + lengthdir_y(16,global.UPRIGHT+90);
    with instance_create(dx, dy, obj_bullet_impact) {
        //part_system_depth(sparks, depth);
        part_emitter_burst(sparks, spark_emitter, part_spark, 100);
    }
    
    // draw a image of the dead enemy on ground
    with instance_create(x,y,obj_dead_body) {
        sprite_index = other.spr_dead;
        image_index = irandom(1);
        image_angle = other.body_dir;
        depth = 999998;
    }
    // drop ammo
    var rx = x + irandom(16) - 16;
    var ry = y + irandom(16) - 16;
    instance_create(rx, ry, obj_ammo_drop);
    
    // drop loot
    var drops = irandom(3);
    if (drops > 0) {
        for (var i=0; i<=drops; i++) {
            loot = loot_list[irandom(array_length_1d(loot_list)-1)];
            var rx = x + irandom(16) - 16;
            var ry = y + irandom(16) - 16;
            //if (loot != obj_inventory.loot_money) {
            with instance_create(rx, ry, loot) {
                //image_index = other.loot;
                //type = other.loot;
                //amount = irandom(4)+1;
            }
            
        }
    }
    
    
    instance_destroy();
}
