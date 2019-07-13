/*
 *
 * Copyright 2019 Tim Schaller
 * All rights reserved
 * Released under the GPL3
 * No claims are made as to the fitness and/or corectness of
 * this work. Use at your own risk. If you create useless things,
 * or if the parts fail it is on you NOT ME. As far as I know
 * this might make your printer burst into flames or print
 * little pink bunnies. Your call. };->
 *
*/


include <vars.scad>;
use <M5.scad>;
use <2020_z_mount_spacer.scad>;
use <v6_j_type_hotend.scad>;

nut_offset = 18-(M5_nut_height/2);

PART = "hotend_fit_test";

if (PART == "y_carriage_hotend_assembly") {
  color(part_color) y_carriage_hotend(cut="left");

  color("black", 0.5){
    translate([40, 0, 0]) rotate([90,0,0]){
      M5_bolt(l=(nut_offset*2)-M5_nut_height);
      translate([0,0,-nut_offset]) M5_nut();
    }
    translate([-40, 0, 0]) rotate([270,0,0]){
      M5_bolt(l=(nut_offset*2)-M5_nut_height);
      translate([0,0,-nut_offset]) M5_nut();
    }
  }
  color("darkred",0.25) hotend();
  color(part_color,0.5) y_carriage_hotend(cut="right");
}


if (PART == "y_carriage_hotend_left") {
  color(part_color)
  y_carriage_hotend(cut="left");
}


if (PART == "y_carriage_hotend_right") {
  color(part_color)
  y_carriage_hotend(cut="right");
}

if (PART == "hotend_fit_test") {
  translate([ 30,-3, 0]) hotend_fit_test(added=.5, cut="left");
  translate([ 30, 3, 0]) hotend_fit_test(added=.5, cut="right");

  translate([ 0,-3, 0]) hotend_fit_test(added=1, cut="left");
  translate([ 0, 3, 0]) hotend_fit_test(added=1, cut="right");

  translate([-30,-3, 0]) hotend_fit_test(added=1.5, cut="left");
  translate([-30, 3, 0]) hotend_fit_test(added=1.5, cut="right");


  translate([ 30, 30, 0]) hotend_fit_test(added=2, cut="left");
  translate([ 30, 36, 0]) hotend_fit_test(added=2, cut="right");

  translate([ 0, 30, 0]) hotend_fit_test(added=2.5, cut="left");
  translate([ 0, 36, 0]) hotend_fit_test(added=2.5, cut="right");

  translate([-30, 30, 0]) hotend_fit_test(added=3, cut="left");
  translate([-30, 36, 0]) hotend_fit_test(added=3, cut="right");


}
/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

/*
 * Because the y carriage needs to be bolted around the hotend
 * we model it in one piece then spit it in two pieces after.
 *
 * seperation = The distance between the bearing blocks on
 *              the Y-axis rails.
 *
 * cut = Either "left" or "right". This determines which side
 *       to render.
 *
 */

module hotend_fit_test(added=0,cut="left") {
  difference(){
    cube([20+added,20+added,12], center=true);
    translate([0,0,0]){
      translate([0,0, 5]) cylinder(h=4.1,d=16+added, $fn=100, center=true);
      cylinder(h=6.1,d=12+added, $fn=100, center=true);
      translate([0,0,-4.5]) cylinder(h=3.1,d=16+added, $fn=100, center=true);
    }
    if (cut == "right") {
      translate([0, -25, 0]) cube([50,50,20],center=true);
    };
    if (cut == "left") {
      translate([0, 25, 0]) cube([50,50,20],center=true);
    };
  }
}

module y_carriage_hotend(cut="left", seperation=40) {
  cut_offset = 25;
  difference(){
    y_carriage_hotend_full(seperation);
    if (cut == "right") {
      translate([0, -cut_offset, 0]) cube([150,50,20],center=true);
    };
    if (cut == "left") {
      translate([0, cut_offset, 0]) cube([150,50,20],center=true);
    };
  }
}

module y_carriage_hotend_full(seperation=40) {
  difference(){
    union(){
      difference(){
        cube([seperation,26,12], center=true);
        translate([0,0,0]){
          translate([0,0, 5]) cylinder(h=4.1,d=17, $fn=100, center=true);
          cylinder(h=6.1,d=14, $fn=100, center=true);
          translate([0,0,-4.5]) cylinder(h=3.1,d=17, $fn=100, center=true);
        }
      }
      translate([seperation,0,0]) rotate([90,0,0]) 2020_z_mount_spacer_a(tab=false);
      translate([-seperation,0,0]) rotate([90,0,0]) 2020_z_mount_spacer_a(tab=false);
    }
    translate([ 40, 0, 0]) rotate([90,0,0]) cylinder(h=50,d=M5_bolt_hole, $fn=100, center=true);
    translate([ 40, nut_offset, 0]) rotate([90,0,0]) cylinder(h=M5_nut_height, d=M5_nut_diam, $fn=6, center=true);
    translate([ 40,-nut_offset, 0]) rotate([90,0,0]) cylinder(h=M5_bolt_head_height, d=M5_bolt_head_diam, $fn=100, center=true);
    translate([-40, nut_offset, 0]) rotate([90,0,0]) cylinder(h=M5_bolt_head_height, d=M5_bolt_head_diam, $fn=100, center=true);
    translate([-40, 0, 0]) rotate([90,0,0]) cylinder(h=50,d=M5_bolt_hole, $fn=100, center=true);
    translate([-40,-nut_offset, 0]) rotate([90,0,0]) cylinder(h=M5_nut_height, d=M5_nut_diam, $fn=6, center=true);
  }
}
