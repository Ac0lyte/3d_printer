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
use <2020_bronze_bearing_holder.scad>;
use <2020_z_mount_spacer.scad>;
use <2020_mount_plate.scad>;
use <linear_bearings.scad>;


PART = "2020_x_axis_carriage_assembly";

if (PART == "2020_x_axis_carriage_assembly") {
  color("skyblue")
  translate([0, 0, 0]) rotate([0,180,0])  difference(){
    2020_x_axis_carriage();
    translate([0,0,50]) cube([100,100,100], center=true);
  }

  translate([0, -17, 40]) rotate([270,0,0]) hotend();

  color("green",0.25)
  translate([0, 19.5, 0]) rotate([0,90,180]) scs10uu();

  color("red",0.25)
  translate([ 32, -1, 40]) rotate([0,0,180]) scs10uu();
  color("red",0.25)
  translate([-32, -1, 40]) rotate([0,0,180]) scs10uu();
}

if (PART == "2020_x_axis_carriage_half") {
  color("skyblue")
  difference(){
    2020_x_axis_carriage();
    translate([0,0,50]) cube([100,100,100], center=true);
  }
}

if (PART == "2020_x_axis_carriage_left") {
  color("skyblue")
  difference(){
    2020_x_axis_carriage();
    translate([50,0,0]) cube([100,100,100], center=true);
  }
}

if (PART == "2020_x_axis_carriage_right") {
  color("skyblue")
  difference(){
    2020_x_axis_carriage();
    translate([-50,0,0]) cube([100,100,100], center=true);
  }
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_x_axis_carriage() {
  rotate([0,90,0]) 2020_z_mount_spacer_a(tab = false);
  translate([ 32,-.5,0]) rotate([0,0,180]) 2020_pillow_block(d=10, w=40);
  translate([-32,-.5,0]) rotate([0,180,180]) 2020_pillow_block(d=10, w=40);
  difference() {
    translate([ 24,0,0]) rotate([0,0,180]) cube([16,13,40], center=true);
    translate([ 32,-.5,0]) rotate([0,0,180]) 2020_pillow_block_holes(d=10, w=40);
  }
  difference() {
    translate([-24,0,0]) rotate([0,0,180]) cube([16,13,40], center=true);
    translate([-32,-.5,0]) rotate([0,0,180]) 2020_pillow_block_holes(d=10, w=40);
  }
}

module 2020_pillow_block(d=10, w=40) {
  wall=2;

  difference(){
    union() {
      translate([0,0,0]) cylinder(h=w, d=d+(wall*2), $fn=200, center=true);
      hull() {
        translate([0,(d/4),0]) cube([d+(wall*2),(d/2)+wall,w], center=true);
        translate([0,d/2,0]) cube([d,d/2,w], center=true);
      }
      translate([0,d,0]) cube([d,d,w], center=true);
    }
    // Remove space for the rod
    translate([0,0,0]) cylinder(h=w+1, d=d, $fn=200, center=true);

    // Create the slit
    translate([0,d,0]) cube([1,d+1,w+1], center=true);

    // create the bolt hole
    translate([0,d*1.10,-10]) rotate([0,90,0]) cylinder(h=20, d=M4_bolt_hole, $fn=200, center=true);
    translate([6,d*1.10,-10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=6, center=true);
  }
}

module 2020_pillow_block_holes(d=10, w=20) {
  wall=2;

  // Remove space for the rod
  translate([0,0,0]) cylinder(h=w+1, d=d, $fn=200, center=true);

  // Create the slit
  translate([0,d,0]) cube([1,d+1,w+1], center=true);
  // create the bolt hole
  translate([0,d*1.10,0]) rotate([0,90,0]) cylinder(h=20, d=M4_bolt_hole, $fn=200, center=true);
  translate([6,d*1.10,0]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=6, center=true);
}

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
