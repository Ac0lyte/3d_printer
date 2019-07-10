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
use <2020_mount_plate.scad>;


PART = "2020_x_pulley_mount_assembly_one";

if (PART == "2020_x_pulley_mount_assembly_one") {
  color("yellow")
  2020_x_pulley_mount(type=1);

  color("red", 0.5) {
    ph=5;
    translate([0,31.0,ph]) g2_smooth_pulley();
  }
  color("black", 0.5) {
    wh=4.5;
    translate([0,31.0,wh]) M5_washer();
  }
}

if (PART == "2020_x_pulley_mount_assembly_two") {
  color("yellow")
  2020_x_pulley_mount(type=2);

  color("red", 0.5) {
    ph=5;
    translate([0,31.0,ph]) g2_smooth_pulley();
    translate([15,43.0,ph]) g2_smooth_pulley();
  }
  color("black", 0.5) {
    wh=4.5;
    translate([0,31.0,wh]) M5_washer();
    translate([15,43.0,wh]) M5_washer();
  }
}

if (PART == "2020_x_pulley_mount_one") {
  color("skyblue")
  2020_x_pulley_mount(type=1);
}

if (PART == "2020_x_pulley_mount_two") {
  color("skyblue")
  2020_x_pulley_mount(type=2);
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */
module 2020_x_pulley_mount(type=2) {
  difference(){
    brace_thickness = 8;
    brace_offset = 0;
    brace_length = 26;
    brace2_offset = 6;
    brace2_length = 38;

    union(){
      translate([ 0, 0, 0]) 2020_mount_plate(width=20);
      translate([ 0, 2, 0]) 2020_mount_plate(width=20);
      translate([ 0, 4, 0]) 2020_mount_plate(width=20);
      translate([-11, -11, 0]) rotate([0,0,90]) 2020_mount_plate(width=20);
      translate([-13, -11, 0]) rotate([0,0,90]) 2020_mount_plate(width=20);
      translate([-15, -11, 0]) rotate([0,0,90]) 2020_mount_plate(width=20);
      translate([-13, 2, 0]) cube([6,6,40], center=true);

      hull() {
        translate([ 0, 31, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        if (type == 2) {
          translate([15, 43, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        }
        translate([-3, 2, 0]) cube([26,6,brace_thickness], center=true);
      }

      hull(){
        translate([ brace_offset, 0,0]) cube([5,6,25], center=true);
        translate([ brace_offset,brace_length,  0]) cube([5,1,6], center=true);
      }
      if (type == 2) {
        hull(){
          translate([ brace2_offset, 0, 0]) cube([5,1,30], center=true);
          translate([ brace2_offset+10,brace2_length,  0]) cube([5,1,6], center=true);
        }
      }
    }
    translate([ 0, 31, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    if (type == 2) {
      translate([15, 43, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    }
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
