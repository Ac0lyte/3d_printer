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
use <M5.scad>;
use <g2.scad>;
use <2020_mount_plate.scad>;


PART = "2020_z_carriage_belt_clamp_assembly";


if (PART == "2020_z_carriage_belt_clamp_assembly") {
  color(part_color) 2020_z_carriage_belt_clamp();

  color("red",0.5)
  translate([1,15,14.25]) z_belt_clamp();
}

if (PART == "2020_z_carriage_belt_clamp") {
  color(part_color) 2020_z_carriage_belt_clamp();
}

if (PART == "z_belt_clamp") {
  color(part_color) z_belt_clamp();
}


/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_z_carriage_belt_clamp() {
    difference(){
      union(){
        rotate([0,90,0]) 2020_mount_plate(height=5,width=20);
        translate([0,6,0]) cube([20, 7, 20], center=true);
        translate([0,10,0]) cube([5, 25, 36], center=true);
        translate([7,12,5]) rotate([90,0,0]) cylinder(h=19, d=5, $fn=100, center=true);
        translate([7,12,-5]) rotate([90,0,0]) cylinder(h=19, d=5, $fn=100, center=true);
      }
      translate([0,16.5,0]) cube([6,14,5], center=true);
      translate([ 0, 7, 14]) rotate([0,90,0]) cylinder(h=8, d=M4_bolt_hole, $fn=100, center=true);
      translate([ 0, 7,-14]) rotate([0,90,0]) cylinder(h=8, d=M4_bolt_hole, $fn=100, center=true);
    }
}

module z_belt_clamp(){
  difference(){
    cube([13,25,8], center=true);
    translate([0,-5,0]) cube([7,25,9], center=true);
    translate([ 0, -8, 0]) rotate([0,90,0]) cylinder(h=14, d=M4_bolt_hole, $fn=100, center=true);
  }
}
