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

 /* ========================================================= */
 /* MODULES                                                   */
 /* ========================================================= */

include <vars.scad>;

PART = "glass_holder_corner";

if (PART == "glass_holder_corner") {
    glass_holder_corner();
}


module glass_holder_corner(
  height=3.5,
  length=20,
  bolt_head_diam=9,
  bolt_hole_diam=5.5
) {
  intersection() {
    difference() {
      union() {
        cube([length, length, height+2], center=true);
        translate([-(bolt_head_diam/2), -(bolt_head_diam/2), -height])
            cylinder(h=7, d=bolt_head_diam+2, $fn=100, center=true);
      }
      translate([1,1,0]) cube([length, length, height], center=true);

      translate([-(bolt_head_diam/2), -(bolt_head_diam/2), -(height-1)])
          cylinder(h=7, d=bolt_head_diam, $fn=6, center=true);
      translate([-(bolt_head_diam/2), -(bolt_head_diam/2), height-1])
          cylinder(h=3, d=bolt_head_diam, $fn=100, center=true);

      translate([-(bolt_head_diam/2), -(bolt_head_diam/2), height-1])
          cylinder(h=30, d=bolt_hole_diam, $fn=100, center=true);
    }
    translate([-(length/2), -(length/2), 0])
        cylinder(h=30, d=length*2, $fn=200, center=true);    
  }
}
