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
 * This is just a parts library for G2 belt assessories.
 * You know pullys and things.
*/

include <vars.scad>;

PART = "g2_smooth_pulley";

if (PART == "g2_smooth_pulley") {
    g2_smooth_pulley();
}


module g2_smooth_pulley(h=6.5) {
  difference() {
    union() {
      translate([0, 0, (h/2)+1]) cylinder(h=h, d=12, center=true, $fm=100);
      translate([0, 0, 0.5]) cylinder(h=1, d=18, center=true, $fm=100);
      translate([0, 0, h+1.5]) cylinder(h=1, d=18, center=true, $fm=100);
    }
    translate([0, 0, (h/2)+1])
    cylinder(h=h+3, d=5, center=true, $fn=100);
  }
}
