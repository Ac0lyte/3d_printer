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
brace_length=15;
brace_rise = 0;
pully_width=10;
brace_length=15;

PART = "2020_z_pulley_tensioner";

if (PART == "2020_z_pulley_mount_assembly") {
  washer_height = (pully_width)/2+1.5;
  nut_height = brace_thickness + M5_nut_height + pully_width/2 -2;
  bolt_length = pully_width + (brace_thickness * 2)+M5_bolt_head_height;
  bolt_height = (M5_bolt_head_height)/2;

  color(part_color)
  2020_z_pulley_mount();

  translate([0,brace_length,0]) rotate([90,0,0]) {
    color("black", 0.25) {
      translate([0,0,-bolt_height]) M5_bolt(l=bolt_length);
      translate([0,0,washer_height]) M5_washer();
      translate([0,0,-washer_height]) M5_washer();
      translate([0,0,-nut_height]) M5_nut();
    }
    color("red", 0.5) {
      translate([0,0,-(pully_width/2+1)]) g2_smooth_pulley(h=pully_width);
    }
  }

}

if (PART == "2020_z_pulley_tensioner_assembly") {
  washer_height = (pully_width)/2+1.5;
  nut_height = brace_thickness + M5_nut_height + pully_width/2 -2;
  bolt_length = pully_width + (brace_thickness * 2)+M5_bolt_head_height;
  bolt_height = (M5_bolt_head_height)/2;

  color(part_color)
  2020_z_pulley_mount(tensioner=true);

  translate([0,brace_length,0]) rotate([90,0,0]) {
    color("black", 0.25) {
      translate([0,0,-bolt_height]) M5_bolt(l=bolt_length);
      translate([0,0,washer_height]) M5_washer();
      translate([0,0,-washer_height]) M5_washer();
      translate([0,0,-nut_height]) M5_nut();
    }
    color("red", 0.5) {
      translate([0,0,-(pully_width/2+1)]) g2_smooth_pulley(h=pully_width);
    }
  }

}


if (PART == "2020_z_pulley_mount_assembly_two") {
  washer_height = (pully_width)/2+1.5;
  nut_height = brace_thickness + M5_nut_height + pully_width/2;
  bolt_length = pully_width + 4 + (brace_thickness * 2)+M5_bolt_head_height;
  bolt_height = (M5_bolt_head_height)/2;

  color(part_color)
  2020_z_pulley_mount();

  translate([brace_rise,brace_length,0]) {
    color("black", 0.25) {
      translate([0,0,-bolt_height]) M5_bolt(l=bolt_length);
      translate([0,0,washer_height]) M5_washer();
      translate([0,0,-washer_height]) M5_washer();
      translate([0,0,-nut_height]) M5_nut();
    }
    color("red", 0.5) {
      translate([0,0,-(pully_width/2+1)]) g2_smooth_pulley(h=pully_width);
    }
  }

}

if (PART == "2020_z_pulley_mount") {
  color(part_color)
  2020_z_pulley_mount();
}

if (PART == "2020_z_pulley_tensioner") {
  color(part_color)
  2020_z_pulley_mount(tensioner=true);
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_z_pulley_mount(tensioner=false) {
  brace_offset = (brace_thickness + pully_width)/2 +2;
  mount_thickness = 5;
  base_width = 20+mount_thickness;

  union(){
    // 2020 mount plate
    difference(){
      cube([20,mount_thickness,50], center=true);
      rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M5_bolt_head_diam, $fn=100, center=true);
      translate([0,0,20]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,0,-20]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
    }
    translate([10+(mount_thickness)/2,-(10+(mount_thickness)/2),0]) rotate([0,0,90])
    difference(){
      cube([20,mount_thickness,50], center=true);
      rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,0,20]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,0,-20]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
    }
    translate([10+(mount_thickness)/2,0,0]) cube([mount_thickness,mount_thickness,50], center=true);

    // pully holder
    difference() {
      union(){
        translate([0,mount_thickness,0]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=18, $fn=100, center=true);
        translate([0,25,0]) rotate([90,0,0]) hull(){
           cylinder(h=mount_thickness+1, d=18, $fn=100, center=true);
           translate([9,0,0]) cube([1,18,mount_thickness+1], center=true);
        }
        translate([12,15,0]) difference() {
          cube([mount_thickness+1,mount_thickness+(2*brace_offset)-1,18], center=true);
          translate([0, 0, 7]) cube([mount_thickness+2, 14, 6], center=true);
          translate([0, 0,-7]) cube([mount_thickness+2, 14,6], center=true);
        }
      }
      rotate([90,0,0]) cylinder(h=4*(mount_thickness+brace_offset)+1, d=M4_bolt_hole, $fn=100, center=true);
    }

  }
}


module 2020_z_pulley_mount_two() {
  brace_offset = (brace_thickness + pully_width)/2 +2;
  mount_thickness = 5;
  union(){
    difference(){
      cube([20,mount_thickness,50], center=true);
      rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,0,20]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,0,-20]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
    }
    translate([10+(mount_thickness)/2,-(10+(mount_thickness)/2),0]) rotate([0,0,90])
    difference(){
      cube([20,mount_thickness,50], center=true);
      rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,0,20]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,0,-20]) rotate([90,0,0]) cylinder(h=mount_thickness+1, d=M4_bolt_hole, $fn=100, center=true);
    }
    translate([10+(mount_thickness)/2,0,0]) cube([mount_thickness,mount_thickness,50], center=true);


    base_width = 20+mount_thickness;

    translate([0,0,brace_offset])
    difference(){
      hull(){
        translate([mount_thickness/2,0,0]) cube([base_width,1,brace_thickness], center=true);
        translate([brace_rise,brace_length,0]) cylinder(h=brace_thickness, d=18, center=true);
      }
      translate([brace_rise,brace_length,0]) cylinder(h=brace_thickness+1, d=M5_bolt_diam, $fn=100, center=true);
    }

    translate([0,0,-brace_offset])
    difference(){
      hull(){
        translate([mount_thickness/2,0,0]) cube([base_width,1,brace_thickness], center=true);
        translate([brace_rise,brace_length,0]) cylinder(h=brace_thickness, d=18, center=true);
      }
      translate([brace_rise,brace_length,0]) cylinder(h=brace_thickness+1, d=M5_bolt_diam, $fn=100, center=true);
    }
  }
}
