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
use <bronze_bearing.scad>;
use <2020_mount_plate.scad>;

PART = "2020_bronze_bearing_holder";

if (PART == "2020_bronze_bearing_holder") {
    rotate([0, 00, 0])
    2020_bronze_bearing_holder();
}


/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */


module 2020_bronze_bearing_holder() {
  color("blue")
  difference(){
    union() {
      rotate([0,90,0]) 2020_mount_plate();
      translate([0,12,0]) cylinder(h=18, d=22, $fn=200, center=true);
      translate([0,2,0]) cube([15,4,18], center=true);
      translate([0,25,0]) cube([11,12,18], center=true);
    }
    translate([0,12,0]) bronze_bearing();
    translate([0,12,0]) cylinder(h=20, d=16, $fn=200, center=true);

    translate([0,25,0]) cube([1,13,20], center=true);
    translate([0,27,0]) rotate([0,90,0]) cylinder(h=20, d=M4_bolt_hole, $fn=200, center=true);
  }
}
