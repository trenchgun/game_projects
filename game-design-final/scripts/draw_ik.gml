///draw_ik(orig_x, orig_y, target_x, target_y, length1, length2, flip, sprite1, sprite2)

/*
MIT License

Copyright (c) 2017 Dominick Schroer

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software")
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
*/

var orig_x = argument0;
var orig_y = argument1;
var target_x = argument2;
var target_y = argument3;
var length1 = argument4;
var length2 = argument5;
var flip = argument6;
var sprite1 = argument7;
var sprite2 = argument8;

var dist = point_distance(orig_x, orig_y, target_x, target_y);
var base_angle = -arctan2(target_y - orig_y, target_x - orig_x);

var cos_a = (length1 * length1) + (dist * dist) - (length2 * length2);
cos_a = cos_a / (2 * length1 * dist);
cos_a = min(1, max(-1, cos_a));
var angle = arccos(cos_a);

if(flip)
{
    angle = -angle;
}

var angle_1 = radtodeg(base_angle + angle);

var b2_x = orig_x + lengthdir_x(length1, angle_1);
var b2_y = orig_y + lengthdir_y(length1, angle_1);

var angle_2 = radtodeg(-arctan2(target_y - b2_y, target_x - b2_x));

draw_sprite_ext(sprite1, 0, orig_x, orig_y, 1, 1, angle_1, c_white, 1);
draw_sprite_ext(sprite2, 0, b2_x, b2_y, 1, 1, angle_2, c_white, 1);
