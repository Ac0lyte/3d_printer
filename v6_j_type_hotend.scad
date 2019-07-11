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

PART = "hotend";

if (PART == "hotend") {
  color(part_color)
  hotend();
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module hotend() {
  difference(){
    union(){
      // bowden tube gripper
      translate([0,0, 18.5]) cylinder(h=1.5,d=10, $fn=100, center=true);
      translate([0,0, 17]) cylinder(h=1.5,d=5, $fn=100, center=true);
      translate([0,0, 15.5]) cylinder(h=1.5,d=8, $fn=100, center=true);
      translate([0,0, 14]) cylinder(h=2,d1=10, d2=8.5, $fn=100, center=true);
      translate([0,0, 10]) cylinder(h=6,d=11.6, $fn=6, center=true);

      // top of extruder, where to clamp it
      translate([0,0, 5]) cylinder(h=4,d=16, $fn=100, center=true);
      cylinder(h=6,d=12, $fn=100, center=true);
      translate([0,0,-4.5]) cylinder(h=3,d=16, $fn=100, center=true);

      // fins
      translate([0,0, -21]) cylinder(h=30,d=8, $fn=100, center=true);
      translate([0,0, -8.5]) cylinder(h=1,d=16, $fn=100, center=true);
      translate([0,0, -11]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -13.5]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -16]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -18.5]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -21]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -23.5]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -26]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -28.5]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -31]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -33.5]) cylinder(h=1,d=22, $fn=100, center=true);
      translate([0,0, -36]) cylinder(h=1,d=22, $fn=100, center=true);

      // heating block
      translate([0, 0, -37]) cylinder(h=2,d=3, $fn=100, center=true);
      translate([0, 6, -44]) cube([16,20,12], center=true);

      // hotend tip
      translate([0, 0, -51.65]) cylinder(h=3.3,d=8, $fn=6, center=true);
      translate([0, 0, -53.95]) cylinder(h=2,d1=.1, d2=5, $fn=100, center=true);
    }
    translate([0,0, 17]) cylinder(h=5,d=4, $fn=100, center=true);
    cylinder(h=35,d=4, $fn=100, center=true);
  }
}
