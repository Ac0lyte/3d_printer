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

PART = "2020_mount_plate";

if (PART == "2020_mount_plate") {
  color(part_color)
  rotate([90, 0, 90])
  2020_mount_plate();
}

if (PART == "2020_mount_plate_2") {
  color(part_color)
  rotate([90, 0, 90])
  2020_mount_plate_2();
}


 /* ========================================================= */
 /* MODULES                                                   */
 /* ========================================================= */

/*
 *  A base plate used when designing parts for the 2020 system
 *
 * width = x
 * height = y
 * length = z
 * holes = number of screw holes
 * hole_size = diameter of holes
 * margin = distance from edges to the CENTER of the holes
 */

 module 2020_mount_plate(
   height=2,
   width=18,
   length=40,
   holes=2,
   hole_size=M4_bolt_hole,
   margin=5
 ) {
   space = ((length - (margin *2)) / (holes-1) );
   difference(){
     cube([width, height, length], center=true);
     z_start = 0 - ((length/2)-margin);
     if (holes > 0) {
       if (holes == 1) {
         rotate([90,0,0]) cylinder(h=height+1, d=hole_size, $fn=200, center=true);
       } else {
         for (Z = [ 1 : holes ]) {
            z = z_start + ((Z-1) * space);
            echo(z);
            translate([0,0,z]) rotate([90,0,0]) cylinder(h=height+1, d=hole_size, $fn=200, center=true);
         }
       }
     }
   }
 }

/* A shorter version of above */

 module 2020_mount_plate_2(height=2) {
   2020_mount_plate(length=20, width=20);
 }
