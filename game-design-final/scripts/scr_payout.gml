/// scr_payout();

// totals the value of the inventory and adds the total to the global.bank variable

for (var slot = 0; slot < 9; slot++) {
    var iid = global.inventory[# slot, 0];
    var amount = global.inventory[# slot, 1];
    
    var value = global.item_index[# iid, item_stat.value] * amount;
    global.bank += value;
}
