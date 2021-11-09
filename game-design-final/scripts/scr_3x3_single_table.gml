// scr_3x3_single_table()

// place table center
choice = irandom(array_length_1d(tables)-1);
instance_create(ix*CELL_WIDTH+16, iy*CELL_HEIGHT+16, tables[choice]);                        
choice = irandom(array_length_1d(chairs)-1);

// place top chair
with instance_create(ix*CELL_WIDTH+16, iy*CELL_HEIGHT, chairs[choice]) {
    phy_rotation = 270; 
}
// place left chair
with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+16, chairs[choice]) {
    phy_rotation = 0; 
}
// place right chair
with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+16, chairs[choice]) {
    phy_rotation = 180; 
}
// place bottom chair
with instance_create(ix*CELL_WIDTH+16, iy*CELL_HEIGHT+32, chairs[choice]) {
    phy_rotation = 90; 
}
