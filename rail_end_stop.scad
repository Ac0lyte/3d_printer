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

microswitch_color="black";
microswitch_button_color="red";
microswitch_contact_color="grey";

use <microswitch.scad>;

PART = "rail_end_stop_bottom";

id=10.5;
od=15;
width=7;


if (PART == "rail_end_stop_assembly") {
  color(part_color) rail_end_stop_top(id=id, od=od, width=width);
  color(part_color, 0.75) rail_end_stop_bottom(id=id, od=od, width=width);

  color("black",0.25) translate([-3, 8.5, 11]) microswitch();
}

if (PART == "rail_end_stop_top") {
  color(part_color) rail_end_stop_top(id=id, od=od, width=width);
}

if (PART == "rail_end_stop_bottom") {
  color(part_color) rail_end_stop_bottom(id=id, od=od, width=width);
}

if (PART == "rail_end_stop_2") {
  color(part_color) rail_end_stop_2();
}


/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module rail_end_stop_top(id=10, od=14, width=5){
  difference(){
    color(part_color) rail_end_stop(id, od, width);
    translate([0, 0,-20]) cube([30,30,40],center=true);
  }
}

module rail_end_stop_bottom(id=10, od=14, width=5){
  difference(){
    color(part_color) rail_end_stop(id, od, width);
    translate([0, 0, 20]) cube([30,30,40],center=true);
  }
}

module rail_end_stop(id=10, od=14, width=5){
  plate_height=2;
  plate_width=20;
  plate_depth=width;
  tab_width=14;
  tab_height=4;
  bolt_diam=3.5;

  union(){
    rotate([90, 0, 0]) difference(){
      union(){
        // pipe clamp
        cylinder(h=width, d=od, $fn=360, center=true);
        // clamping Tabs
        cube([od+tab_width, tab_height, width], center=true);
      }
      // pipe clamp cutout
      cylinder(h=width+1, d=id, $fn=360, center=true); // rail
      // clamping tabs bolt holes
      rotate([90,0,0]){
        translate([  (od/2)+(tab_width/4),  0, 0]) cylinder(h=tab_height+1, d=bolt_diam, $fn=360, center=true);
        translate([0-((od/2)+(tab_width/4)), 0, 0]) cylinder(h=tab_height+1, d=bolt_diam, $fn=360, center=true);
      }
    }
    difference(){
      translate([0, 0, (od+plate_height)/2-1]) cube([plate_width, plate_depth, plate_height], center=true);
      translate([-4.75, 0, (od+plate_height)/2-1]) cylinder(h=6, $fn=100, center=true);
    }
    translate([ 4.75, 0, (od+plate_height)/2+2]) cylinder(h=6, $fn=100, center=true);
  }
}

module rail_end_stop_2(){
  difference(){
    union(){
      cube([20,20,5], center=true);
      translate([5, 0, 3.5]) cube([5, 20, 2], center=true);
      translate([5, 4.75, 2.5 + (M4_bolt_head_height/2) + 3]) cylinder(h=6, d=2, $fn=100, center=true);
    }
    cylinder(h=6, d=M4_bolt_hole, $fn=100, center=true);
    translate([0,0,2.5+(M4_bolt_head_height/2)]) cylinder(h=M4_bolt_head_height, d=M4_bolt_head_diam, $fn=100, center=true);
    translate([5,-4.75, 2]) cylinder(h=10, d=2, $fn=100, center=true);
  }
}
