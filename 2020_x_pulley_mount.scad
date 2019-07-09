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
use <2020_mount_plate.scad>;


PART = "2020_x_pulley_mount";

if (PART == "2020_x_pulley_mount_assembly") {
  color("skyblue")
  2020_x_pulley_mount();

  color("red", 0.25)
  translate([0,31.0,2.5]) g2_smooth_pulley();

  color("red", 0.25)
  translate([15,43.0,2.5]) g2_smooth_pulley();

  // sanity check plates
  // translate([ 0,13,5.5]) cube([1,24,1], center=true);
  // translate([10,19,4.5]) cube([20,36,1], center=true);
}

if (PART == "2020_x_pulley_mount") {
  color("skyblue")
  2020_x_pulley_mount();
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */
module 2020_x_pulley_mount() {
  difference(){
    union(){
      2020_mount_plate(width=20);
      translate([-11, -11, 0]) rotate([0,0,90]) 2020_mount_plate(width=20);
      translate([-11, 0, 0]) cube([2,2,40], center=true);
      hull() {
        translate([ 0, 31, 0]) cylinder(h=5, d=12, center=true, $fn=100);
        translate([15, 43, 0]) cylinder(h=5, d=12, center=true, $fn=100);
        translate([-1, 0, 0]) cube([22,1,5], center=true);
      }
    }
    translate([ 0, 31, 0]) cylinder(h=6, d=5, center=true, $fn=100);
    translate([15, 43, 0]) cylinder(h=6, d=5, center=true, $fn=100);
  }
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
