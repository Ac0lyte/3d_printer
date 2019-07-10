/*
 *
 * Copyright 2019 Tim Schaller
 * All rights reserved
 * Released under the GPL3
 * No claims are made as to the fitness and/or corectness of
 * this work. Use at your own risk. If you create useless things,
 * or if the parts fail it is on you NOT ME. As far as I know
 * this might make your printer burst into flames or print
 * little pink bunnies. You call. };->
 *
 *
 *
 * This is just a parts library for M5 nuts, bolts, washers, etc.
*/

include <vars.scad>;

/*
  h = height of the M5_washer
  w = width of the washer (od-id)
*/
module M5_washer(h=1,w=1) {
  difference() {
    cylinder(h=h, d=w+M5_bolt_diam, center=true, $fn=100);
    cylinder(h=h+0.1, d=M5_bolt_diam, center=true, $fn=100);
  }
}
