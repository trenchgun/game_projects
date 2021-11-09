/// scr_3x3_lockerbank_double()

angle = irandom(3) * 90;
                        
switch (angle) {
    case 0:
    case 180:
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+5, prop_locker_x3) {
            phy_rotation = 0;
        }
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT-5, prop_locker_x3) {
            phy_rotation = 180;
        }
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+5, prop_locker_x3) {
            phy_rotation = 0;
        }
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT-5, prop_locker_x3) {
            phy_rotation = 180;
        }
        break;
    case 90:
    case 270:
        with instance_create(ix*CELL_WIDTH+5, iy*CELL_HEIGHT, prop_locker_x3) {
            phy_rotation = 90;
        }
        with instance_create(ix*CELL_WIDTH-5, iy*CELL_HEIGHT, prop_locker_x3) {
            phy_rotation = 270;
        }
        with instance_create(ix*CELL_WIDTH+5, iy*CELL_HEIGHT+32, prop_locker_x3) {
            phy_rotation = 90;
        }
        with instance_create(ix*CELL_WIDTH-5, iy*CELL_HEIGHT+32, prop_locker_x3) {
            phy_rotation = 270;
        }
        break;
    default:
        break;
}
