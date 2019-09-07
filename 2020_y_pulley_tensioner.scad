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
use <2020_y_pulley_mount.scad>;

brace_thickness = 8;

PART = "open_pulley_slide";

/***************************************************************/

if (PART == "2020_y_pulley_tensioner_assembly") {
  brace_offset = 0;
  brace_length = 26;
  pully_x = -18;
  pully_y = 18;
  pully_height = 4;
  pully_width=6.5;
  washer_height = pully_height-0.5;
  nut_height = pully_height - (M5_nut_height)/2 - 5.5;
  bolt_length = 23;
  bolt_height = (M5_bolt_head_height)/2;
  bolt_offset = 4;

  // pully mount
  rotate([0,0,90]) {
    //color("skyblue")
    2020_y_pulley_tensioner(
      brace_offset = brace_offset,
      brace_length = brace_length,
      pully_x = pully_x,
      pully_y = pully_y
    );

    // mount screw and nut
    color("black", 0.25) {
      translate([pully_x, pully_y ,bolt_offset + bolt_height]) M5_bolt(l=bolt_length);
      translate([pully_x, pully_y ,washer_height+pully_width+3]) M5_washer();
      translate([pully_x, pully_y ,nut_height]) M5_nut();
      translate([pully_x, pully_y ,washer_height]) M5_washer();
    }

    // pully Slide
    translate([pully_x, 15 ,pully_height+4]) open_pulley_slide();

    // pully
    color("red", 0.5)
    translate([pully_x, pully_y ,pully_height]) g2_smooth_pulley(h=pully_width);
  }
}


if (PART == "2020_y_pulley_tensioner") {
  color(part_color)
  2020_y_pulley_tensioner();
}

if (PART == "open_pulley_slide") {
  color(part_color)
  open_pulley_slide();
}


/***************************************************************/

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_y_pulley_tensioner(
  brace_offset = 0,
  brace_length = 26,

  pully_x = -18,
  pully_y = 18
) {
  slide_x = pully_x;

  difference(){

    // corner 2020 mount
    union(){
      translate([20, -20, 8])
      rotate([0, 0, 180]) {
        translate([12, 0, 0]) 2020_mount_plate(width=20, height=4, length=24);
        translate([0, -12, 0]) rotate([0,0,90]) 2020_mount_plate(width=20, height=4, length=24);
        translate([0, 0, 0]) cube([4,4,24], center=true);
      }

      // Slide run back
      translate([slide_x+2, -20, 8]) cube([32, 4, 24], center=true);

      // horizontal slide run - outside
      translate([slide_x, pully_y - 15, 8]) cube([28, 46, 24], center=true);


    }
    // horizontal slide run - remove inside
    translate([slide_x, pully_y - 9, 8]) cube([25, 46, 20], center=true);
    // horizontal slide run - remove grove in top/bottom
    translate([slide_x, pully_y -9, 8]) cube([10, 46, 27], center=true);
    // horizontal slide run - remove grove in left/right
    translate([slide_x, pully_y -5, 8]) cube([30, 30, 12], center=true);

    // tention screw hole
    translate([ slide_x, -17, pully_y/2]) rotate([90, 0, 0]) cylinder(h=13, d=5, center=true, $fn=100);
  }
}

/***************************************************************/

 module open_pulley_slide() {
  difference(){
    hull() {
      translate([0,-8, 0]) cube([24, 20, 19], center=true);
      translate([0,-11, 0]) sphere(d=19, center=true, $fn=100);
      translate([0, -3, 0]) cylinder(h=19, d=24, $fn=100, center=true);
    }
    hull() {
      translate([0, 8, 0]) cube([20, 40, 11], center=true);
      translate([0,-14, 0]) sphere(d=10, center=true, $fn=100);
    }
    translate([0, -3, 0]) cylinder(h=20, d=M5_bolt_hole, $fn=100, center=true);
    translate([0, -11, 0]) rotate([90, 0, 0]) cylinder(h=20, d=M5_bolt_hole, $fn=100, center=true);
    translate([0, 8, 0]) cube([40, 40, 11], center=true);
  }
}

/***************************************************************/
