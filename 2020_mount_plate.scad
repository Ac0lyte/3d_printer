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
 */

include <vars.scad>;

PART = "2020_mount_plate";

if (PART == "2020_mount_plate") {
    rotate([90, 0, 90])
    2020_mount_plate();
}


 /* ========================================================= */
 /* MODULES                                                   */
 /* ========================================================= */


module 2020_mount_plate() {
  color("blue")
  difference(){
      cube([18,2,40], center=true);
      translate([0,0,15]) rotate([90,0,0]) cylinder(h=3, d=M4_bolt_hole, $fn=200, center=true);
      translate([0,0,-15]) rotate([90,0,0]) cylinder(h=3, d=M4_bolt_hole, $fn=200, center=true);
  }
}
