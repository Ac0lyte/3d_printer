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

PART = "2020_x_pulley_mount_assembly_flat_two";

/***************************************************************/

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

/***************************************************************/

if (PART == "2020_x_pulley_mount_assembly_center_one") {
  pully_x = -24;
  pully_y = 11.5;
  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  // pully mount
  rotate([0,0,90]) {
    color("skyblue")
    2020_x_pulley_mount_center(type=1);

    // mount screw and nut
    color("black", 0.25) {
      translate([pully_x, pully_y ,bolt_height]) M5_bolt(l=bolt_length);
      translate([pully_x, pully_y ,washer_height+pully_width+3]) M5_washer();
      translate([pully_x, pully_y ,nut_height]) M5_nut();
      translate([pully_x, pully_y ,washer_height]) M5_washer();
    }
    // pully
    color("red", 0.5) {
      translate([pully_x, pully_y ,pully_height]) g2_smooth_pulley(h=pully_width);
    }
  }
}

if (PART == "2020_x_pulley_mount_assembly_center_two") {
  pully_x = -24;
  pully_y = 11.5;
  pully2_offset = 14;
  pully2_x = pully_x - pully2_offset;
  pully2_y = pully_y + pully2_offset;

  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  // pully mount
  rotate([0,0,90]) {
    color(part_color)
    2020_x_pulley_mount_center(type=2);

    // mount screw and nut
    color("black", 0.25) {
      translate([pully_x, pully_y ,bolt_height]) M5_bolt(l=bolt_length);
      translate([pully_x, pully_y ,washer_height+pully_width+3]) M5_washer();
      translate([pully_x, pully_y ,nut_height]) M5_nut();
      translate([pully_x, pully_y ,washer_height]) M5_washer();

      translate([pully2_x, pully2_y, bolt_height]) M5_bolt(l=bolt_length);
      translate([pully2_x, pully2_y, washer_height+pully_width+3]) M5_washer();
      translate([pully2_x, pully2_y, nut_height]) M5_nut();
      translate([pully2_x, pully2_y, washer_height]) M5_washer();
    }

    // pulleys
    color("red", 0.5) {
      ph=5;
      translate([pully_x, pully_y, ph]) g2_smooth_pulley();
      translate([pully2_x, pully2_y, ph]) g2_smooth_pulley();
    }
  }
}

if (PART == "2020_x_pulley_mount_center_one") {
  color(part_color)
  2020_x_pulley_mount_center(type=1);
}

if (PART == "2020_x_pulley_mount_center_two") {
  color(part_color)
  2020_x_pulley_mount_center(type=2);
}

/***************************************************************/

if (PART == "2020_x_pulley_mount_assembly_offset_one") {
  pully_x = -13;
  pully_y = 13;
  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  // pully mount
  rotate([0,0,90]) {
    //color("skyblue")
    2020_x_pulley_mount_offset(type=1);

    // mount screw and nut
    color("black", 0.25) {
      translate([pully_x, pully_y ,bolt_height]) M5_bolt(l=bolt_length);
      translate([pully_x, pully_y ,washer_height+pully_width+3]) M5_washer();
      translate([pully_x, pully_y ,nut_height]) M5_nut();
      translate([pully_x, pully_y ,washer_height]) M5_washer();
    }
    // pully
    color("red", 0.5) {
      translate([pully_x, pully_y ,pully_height]) g2_smooth_pulley(h=pully_width);
    }
  }
}

if (PART == "2020_x_pulley_mount_assembly_offset_two") {
  pully_x = -13;
  pully_y = 13;
  pully2_offset = 14;
  pully2_x = pully_x - pully2_offset;
  pully2_y = pully_y + pully2_offset;

  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  // pully mount
  rotate([0,0,90]) {
    color(part_color)
    2020_x_pulley_mount_offset(type=2);

    // mount screw and nut
    color("black", 0.25) {
      translate([pully_x, pully_y ,bolt_height]) M5_bolt(l=bolt_length);
      translate([pully_x, pully_y ,washer_height+pully_width+3]) M5_washer();
      translate([pully_x, pully_y ,nut_height]) M5_nut();
      translate([pully_x, pully_y ,washer_height]) M5_washer();

      translate([pully2_x, pully2_y, bolt_height]) M5_bolt(l=bolt_length);
      translate([pully2_x, pully2_y, washer_height+pully_width+3]) M5_washer();
      translate([pully2_x, pully2_y, nut_height]) M5_nut();
      translate([pully2_x, pully2_y, washer_height]) M5_washer();
    }

    // pulleys
    color("red", 0.5) {
      ph=5;
      translate([pully_x, pully_y, ph]) g2_smooth_pulley();
      translate([pully2_x, pully2_y, ph]) g2_smooth_pulley();
    }
  }
}

if (PART == "2020_x_pulley_mount_offset_one") {
  color(part_color)
  2020_x_pulley_mount_offset(type=1);
}

if (PART == "2020_x_pulley_mount_offset_two") {
  color(part_color)
  2020_x_pulley_mount_offset(type=2);
}

/***************************************************************/


if (PART == "2020_x_pulley_mount_assembly_flat_one") {
  pully_x = 0;
  pully_y = 0;
  pully_z = 16.5;
  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  // pully mount
  rotate([0,0,0]){
    color(part_color)
    2020_x_pulley_mount_flat(type=1);

    // mount screw and nut
    translate([pully_x, pully_y, pully_z - pully_height]) {
      color("black", 0.25) {
        translate([0, 0 ,bolt_height]) M5_bolt(l=bolt_length);
        translate([0, 0 ,washer_height+pully_width+3]) M5_washer();
        translate([0, 0 ,nut_height]) M5_nut();
        translate([0, 0 ,washer_height]) M5_washer();
      }

      // pully
      color("red", 0.5) {
        translate([0, 0 ,pully_height]) g2_smooth_pulley(h=pully_width);
      }
    }

  }
}

if (PART == "2020_x_pulley_mount_assembly_flat_two") {
  pully_x = 0;
  pully_y = 0;
  pully_z = 16.5;

  pully2_x = 13;
  pully2_y = -13;

  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  // pully mount
    color(part_color)
    2020_x_pulley_mount_flat(type=2);

    // mount screw and nut
    translate([pully_x, pully_y, pully_z - pully_height]) {
      color("black", 0.25) {
        translate([0, 0 ,bolt_height]) M5_bolt(l=bolt_length);
        translate([0, 0 ,washer_height+pully_width+3]) M5_washer();
        translate([0, 0 ,nut_height]) M5_nut();
        translate([0, 0 ,washer_height]) M5_washer();
      }

      // pully
      color("red", 0.5) {
        translate([0, 0, pully_height]) g2_smooth_pulley(h=pully_width);
      }
    }

    // mount screw and nut
    translate([pully2_x, pully2_y, pully_z - pully_height]) {
      color("black", 0.25) {
        translate([0, 0 ,bolt_height]) M5_bolt(l=bolt_length);
        translate([0, 0 ,washer_height+pully_width+3]) M5_washer();
        translate([0, 0 ,nut_height]) M5_nut();
        translate([0, 0 ,washer_height]) M5_washer();
      }

      // pully
      color("red", 0.5) {
        translate([0, 0, pully_height]) g2_smooth_pulley(h=pully_width);
      }
    }

}

if (PART == "2020_x_pulley_mount_flat_one") {
  color(part_color)
  2020_x_pulley_mount_flat(type=1);
}

if (PART == "2020_x_pulley_mount_flat_two") {
  color(part_color)
  2020_x_pulley_mount_flat(type=2);
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

    // corner 2020 mount
    union(){
      translate([ 0, 2, 0]) 2020_mount_plate(width=20, height=6);
      translate([-13, -11, 0]) rotate([0,0,90]) 2020_mount_plate(width=20, height=6);
      translate([-13, 2, 0]) cube([6,6,40], center=true);

      // horizontal brace
      hull() {
        translate([ 0, 31, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        if (type == 2) {
          translate([15, 43, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        }
        translate([-3, 2, 0]) cube([26,6,brace_thickness], center=true);
      }

      //vertical braces
      hull(){
        translate([ brace_offset, 2,0]) cube([5,6,21], center=true);
        translate([ brace_offset,brace_length,  0]) cube([5,1,6], center=true);
      }
      if (type == 2) {
        hull(){
          translate([ brace2_offset, 0, -10]) cube([5,1,15], center=true);
          translate([ brace2_offset+10,brace2_length,  0]) cube([5,1,6], center=true);
        }
      }
    }

    // Holes
    translate([ 0, 31, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    if (type == 2) {
      translate([15, 43, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    }
  }
}

/***************************************************************/

module 2020_x_pulley_mount_center(type=2) {
  difference(){
    brace_offset = 0;
    brace_length = 26;
    brace2_offset = 6;
    brace2_length = 38;

    pully_x = -24;
    pully_y = 11.5;
    pully2_offset = 14;
    pully2_x = pully_x - pully2_offset;
    pully2_y = pully_y + pully2_offset;


    // corner 2020 mount
    union(){
      translate([ 0, 2, 0]) 2020_mount_plate(width=20, height=6);
      translate([-13, -11, 0]) rotate([0,0,90]) 2020_mount_plate(width=20, height=6);
      translate([-13, 2, 0]) cube([6,6,40], center=true);

      // horizontal brace side 1
      hull() {
        translate([ pully_x, pully_y, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        translate([-3, 2, 0]) cube([26,6,brace_thickness], center=true);
        if (type == 2) {
          translate([pully2_x, pully2_y, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        }
      }

      // horizontal brace side 2
      hull() {
        translate([ pully_x, pully_y, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        translate([-13, -8, 0]) rotate([0,0,90]) cube([26,6,brace_thickness], center=true);
        if (type == 2) {
          translate([pully2_x, pully2_y, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        }
      }
    }

    translate([ pully_x, pully_y, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    if (type == 2) {
      translate([pully2_x, pully2_y, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    }
  }
}

/***************************************************************/

module 2020_x_pulley_mount_offset(type=2) {
  difference(){
    brace_offset = 0;
    brace_length = 26;
    brace2_offset = 6;
    brace2_length = 38;

    pully_x = -13;
    pully_y = 13;
    pully2_offset = 14;
    pully2_x = pully_x - pully2_offset;
    pully2_y = pully_y + pully2_offset;


    // corner 2020 mount
    union(){
      translate([19, 0, 0])
      rotate([0, 0, 270]) {
        translate([13, 0, 0]) 2020_mount_plate(width=20, height=6);
        translate([0, -13, 0]) rotate([0,0,90]) 2020_mount_plate(width=20, height=6);
        translate([0, 0, 0]) cube([6,6,40], center=true);
      }
      // horizontal brace side 1
      hull() {
        translate([ pully_x, pully_y, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        translate([9, 0, 0]) cube([26,6,brace_thickness], center=true);
        if (type == 2) {
          translate([pully2_x, pully2_y, 0]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        }
      }

    }
    translate([ pully_x, pully_y, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    if (type == 2) {
      translate([pully2_x, pully2_y, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    }
  }
}

/***************************************************************/

module 2020_x_pulley_mount_flat(type=2) {
  brace_offset = 0;
  brace_length = 26;
  brace2_offset = 6;
  brace2_length = 38;

  pully_z = 15.5;

  pully_x = 0;
  pully_y = 0;

  pully2_x = 13;
  pully2_y = -13;

  mount_length = 34;
  mount_height = 30;
  mount_thickness = 6;

  brace_length = 20;
  brace_offset = 15.5 - (brace_thickness/2);

  difference(){

    union(){
      // inside corner 2020 mount
      difference(){
        union(){
          translate([0, 0, 0]) rotate([0, 0, 0]) cube([20, mount_length, mount_thickness], center=true);
          translate([0, (mount_length/2)-(mount_thickness/2), (mount_height/2)-(mount_thickness/2)]) rotate([90, 0, 0]) cube([20,mount_height,mount_thickness], center=true);
        }
        translate([0,-((mount_length/2)-6), 0]) cylinder(h=mount_thickness+1, d=4, center=true, $fn=100);
        translate([0, (mount_length/2)-(mount_thickness/2), (mount_height)-(mount_thickness/2)-6]) rotate([90, 0, 0])
          cylinder(h=mount_thickness+1, d=4, center=true, $fn=100);
      }

      // pully mount
      hull() {
        translate([0, (mount_length/2)-(mount_thickness), (mount_height/2)-(mount_thickness/2)]) cube([20,1,brace_thickness], center=true);
        translate([ pully_x, pully_y, brace_offset]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        if (type == 2) {
          translate([pully2_x, pully2_y, brace_offset]) cylinder(h=brace_thickness, d=12, center=true, $fn=100);
        }
      }
    }

    // Pully mount Holes
    translate([ pully_x, pully_y, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    translate([ pully_x, pully_y, brace_offset]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    if (type == 2) {
      translate([pully2_x, pully2_y, 0]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
      translate([pully2_x, pully2_y, brace_offset]) cylinder(h=brace_thickness+1, d=5, center=true, $fn=100);
    }
  }
}

/***************************************************************/
