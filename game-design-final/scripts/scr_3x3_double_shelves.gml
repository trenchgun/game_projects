/// scr_3x3_double_shelves()
angle = irandom(3) * 90;
                        
choice = irandom(array_length_1d(shelves)-1);
with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT, shelves[choice]) {
    phy_rotation = obj_level.angle;
}
choice = irandom(array_length_1d(shelves)-1);
with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT, shelves[choice]) {
    phy_rotation = obj_level.angle;
}
choice = irandom(array_length_1d(shelves)-1);
with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+32, shelves[choice]) {
    phy_rotation = obj_level.angle;
}
choice = irandom(array_length_1d(shelves)-1);
with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+32, shelves[choice]) {
    phy_rotation = obj_level.angle;
}      
