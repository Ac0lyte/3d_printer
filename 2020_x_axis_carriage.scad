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
use <v6_j_type_hotend.scad>;


PART = "10mm_rail_clamp";

if (PART == "2020_x_axis_carriage_assembly") {
  color(part_color, 0.25)
  2020_x_axis_carriage_connector_left();

  color(part_color, 0.25)
  2020_x_axis_carriage_connector_right();

  translate([ 24.5,-.5,00]) 2020_x_axis_carriage_rail_mount();
  translate([-24.5,-.5,00]) rotate([0, 0, 180]) 2020_x_axis_carriage_rail_mount();

  color("green",0.25) {
    translate([ 21, 19.5, 0]) rotate([0,90,180]) scs10uu();
    translate([-21, 19.5, 0]) rotate([0,90,180]) scs10uu();
  }

  color("red",0.25) {
    translate([ 24.5, -1, 75]) rotate([0,0, 90]) scs10uu();
    translate([-24.5, -1, 75]) rotate([0,0,270]) scs10uu();
  }
  translate([0, -17, 75]) rotate([270,0,0]) hotend();
}


if (PART == "2020_x_axis_carriage_connector_left") {
  color(part_color)
  2020_x_axis_carriage_connector_left();
}

if (PART == "2020_x_axis_carriage_connector_right") {
  color(part_color)
  2020_x_axis_carriage_connector_right();
}

if (PART == "2020_x_axis_carriage_rail_mount") {
  color(part_color)
  2020_x_axis_carriage_rail_mount();
}

if (PART == "2020_x_axis_carriage_half") {
  color(part_color)
  difference(){
    2020_x_axis_carriage();
    translate([0,0,50]) cube([100,100,100], center=true);
  }
}

if (PART == "2020_x_axis_carriage_left") {
  color(part_color)
  difference(){
    2020_x_axis_carriage();
    translate([50,0,0]) cube([100,100,100], center=true);
  }
}

if (PART == "2020_x_axis_carriage_right") {
  color(part_color)
  difference(){
    2020_x_axis_carriage();
    translate([-50,0,0]) cube([100,100,100], center=true);
  }
}

if (PART == "10mm_rail_clamp") {
  color(part_color) 10mm_rail_clamp();
}
/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_x_axis_carriage_connector_left() {
  difference() {
    translate([0, 2.75, 0]) rotate([0,90,0]) scale([1, .5, 1]) 2020_z_mount_spacer_a(tab = false);
    translate([ 17, 0, 0]) cube([3,15,41], center=true);
    translate([-17, 0, 0]) cube([3,15,41], center=true);
  }
  translate([0,4,37.75]) cube([31,9,35.5], center=true);
  difference(){
    translate([0,14.5,50.5]) cube([40,12,10], center=true);
    translate([0,14.5,50]) rotate([0,0,0]) cylinder(h=22, d=M4_bolt_hole, $fn=100, center=true);
    translate([0,14.5,53.51]) rotate([0,0,30]) cylinder(h=M5_nut_height, d=M5_nut_diam, $fn=6, center=true);
  }
  translate([0,20,45]) cube([40,1,1], center=true);
  translate([0,9,45]) cube([40,1,1], center=true);
}

module 2020_x_axis_carriage_connector_right() {
  difference() {
    translate([0, 2.75, 0]) rotate([0,90,0]) scale([1, .5, 1]) 2020_z_mount_spacer_a(tab = false);
    translate([ 17, 0, 0]) cube([3,15,41], center=true);
    translate([-17, 0, 0]) cube([3,15,41], center=true);
  }
  translate([0,4,27.75]) cube([31,9,15.5], center=true);
  difference(){
    translate([0,14.5,27.25]) cube([40,12,14.5], center=true);
    translate([0,14.5,27]) rotate([0,0,0]) cylinder(h=22, d=M4_bolt_hole, $fn=100, center=true);
    translate([0,14.5,21.49]) rotate([0,0,30]) cylinder(h=M5_nut_height, d=M5_nut_diam, $fn=6, center=true);
  }
  translate([0,20,35]) cube([40,1,1], center=true);
  translate([0,9,35]) cube([40,1,1], center=true);
}

module 2020_x_axis_carriage_rail_mount() {
  difference() {
    union (){
      translate([2,0, 0]) cube([22,14,40], center=true);
      translate([-2, 0, 20]) rotate([0,0,270]) 10mm_rail_clamp(d=10.75, w=40);
    }
    translate([-4, 0, 0]) rotate([0,90,0]) scs10uu_holes();
    translate([-2, 0, 20]) rotate([0,0,270]) 10mm_rail_clamp_holes(d=10.75, w=40, extend=true, h1=false);
  }
}

module 2020_x_axis_carriage() {
  rotate([0,90,0]) 2020_z_mount_spacer_a(tab = false);
  translate([ 32,-.5,0]) rotate([0,0,180]) 10mm_rail_clamp(d=10, w=40);
  translate([-32,-.5,0]) rotate([0,180,180]) 10mm_rail_clamp(d=10, w=40);
  difference() {
    translate([ 24,0,0]) rotate([0,0,180]) cube([16,13,40], center=true);
    translate([ 32,-.5,0]) rotate([0,0,180]) 10mm_rail_clamp_holes(d=10, w=40);
  }
  difference() {
    translate([-24,0,0]) rotate([0,0,180]) cube([16,13,40], center=true);
    translate([-32,-.5,0]) rotate([0,0,180]) 10mm_rail_clamp_holes(d=10, w=40);
  }
}

module 10mm_rail_clamp(d=11, w=40) {
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
    10mm_rail_clamp_holes(d=d, w=w);
  }
}

module 10mm_rail_clamp_holes(d=11, w=40, h1=true, h2=true, extend=false) {
  wall=2;

  // Remove space for the rod
  translate([0,0,0]) cylinder(h=w+1, d=d, $fn=200, center=true);

  // Create the slit
  translate([0,d,0]) cube([1,d+1,w+1], center=true);
  if (extend == true) {
    translate([0, 1, w]) cube([1,d+1,w+1], center=true);
    translate([0, 1,-w]) cube([1,d+1,w+1], center=true);
    translate([0, d, w]) cube([1,d+1,w+1], center=true);
    translate([0, d,-w]) cube([1,d+1,w+1], center=true);
  }

  // create the bolt holes
  if (h1 == true) {
    translate([ 0, d*1.10,-10]) rotate([0,90,0]) cylinder(h=20, d=M4_bolt_hole, $fn=200, center=true);
    translate([ 6, d*1.10,-10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=6, center=true);
    translate([-7, d*1.10,-10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=200, center=true);
  }
  if (h2 == true) {
    translate([ 0, d*1.10, 10]) rotate([0,90,0]) cylinder(h=20, d=M4_bolt_hole, $fn=200, center=true);
    translate([ 6, d*1.10, 10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=6, center=true);
    translate([-7, d*1.10, 10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=200, center=true);
  }
}
