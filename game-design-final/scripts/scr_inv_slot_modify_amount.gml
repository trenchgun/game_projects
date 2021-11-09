/// scr_inv_slot_modify_amount(slot, amount, override);

// add stack limit

var slot = argument[0];
var amount = argument[1];
var override = argument[2];

if !override {  // if not overriding current values
    globale.inventory[# slot, 1] += amount; // increase amount by input amount
} else {    // if we are overriding current values
    global.inventory[# slot, 1] = amount; // set amount to input amount
}

// clear slot if the amount is less than or equal to 0
if (global.inventory[# slot, 1] <= 0) {
    global.inventory[# slot, 0] = item.none;
    global.inventory[# slot, 1] = 0;
}
