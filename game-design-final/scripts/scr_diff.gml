/// scr_diff
// returns difference between two numbers
n1 = argument[0];
n2 = argument[1];

if (n1 > n2) {
    return n1 - n2;
} else if (n1 < n2) {
    return n2 - n1;
} else {
    return 0;
}
