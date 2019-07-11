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

brace_thickness = 8;

PART = "2020_x_pulley_mount_assembly_two";

if (PART == "2020_x_pulley_mount_assembly_one") {
  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  rotate([0,0,90]) {
    color("skyblue")
    2020_x_pulley_mount(type=1);

    color("black", 0.25) {
      translate([0,31.0,bolt_height]) M5_bolt(l=bolt_length);
      translate([0,31.0,washer_height+pully_width+3]) M5_washer();
      translate([0,31.0,nut_height]) M5_nut();
      translate([0,31.0,washer_height]) M5_washer();
    }
    color("red", 0.5) {
      translate([0,31.0,pully_height]) g2_smooth_pulley(h=pully_width);
    }
  }
}

if (PART == "2020_x_pulley_mount_assembly_two") {
  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  rotate([0,0,90]) {
    color(part_color)
    2020_x_pulley_mount(type=2);

    color("black", 0.5) {
      wh=4.5;
      translate([0,31.0,bolt_height]) M5_bolt(l=bolt_length);
      translate([0,31.0,washer_height+pully_width+3]) M5_washer();
      translate([0,31.0,nut_height]) M5_nut();
      translate([0,31.0,washer_height]) M5_washer();

      translate([15,43.0,bolt_height]) M5_bolt(l=bolt_length);
      translate([15,43.0,washer_height+pully_width+3]) M5_washer();
      translate([15,43.0,nut_height]) M5_nut();
      translate([15,43.0,washer_height]) M5_washer();
    }
    color("red", 0.5) {
      ph=5;
      translate([0,31.0,ph]) g2_smooth_pulley();
      translate([15,43.0,ph]) g2_smooth_pulley();
    }
  }
}

if (PART == "2020_x_pulley_mount_one") {
  color(part_color)
  2020_x_pulley_mount(type=1);
}

if (PART == "2020_x_pulley_mount_two") {
  color(part_color)
  2020_x_pulley_mount(type=2);
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */
module 2020_x_pulley_mount(type=2) {
  difference(){
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
          translate([ brace2_offset, 0, -10]) cube([5,1,15], center=true);
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
