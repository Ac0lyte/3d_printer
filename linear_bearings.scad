/*
* The parts in this file are:
*
*   - scs10uu()
*     A quick mock up of a SCS10UU bearing race
*     used for fitment and to help keep my sanity.
*
*   - scs10uu_holes()
*     Just 4 cylinders used with a difference to
*     place holes in the carriage for mounting
*     the bearings
*
*   - bearing_race()
*     A generic, parameterized bearing race
*     created incase I need to model anything else
*     in the same family as the SCS10UU
*
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

PART = "scs10uu";

if (PART == "scs10uu") {
    color(part_color)
    scs10uu();
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

// http://www.cncshop.com.au/index.php?main_page=product_info&cPath=20_26&products_id=8
// K = (W-B)/2
// Top hole bevel = 5.5mm

module scs10uu() {
  bearing_race(
    T  = 8,
    h  = 13,
    E  = 20,
    W  = 40,
    L  = 35,
    F  = 26,
    G  = 21,
    B  = 28,
    C  = 21,
    K  = 6,
    S1 = 5,
    S2 = 4.3,
    L1 = 12,
    id = 10,
    od = 18
  );
}

module scs10uu_holes(W  = 40,   L  = 35, F  = 26, B  = 28, C  = 21, S1 = 5) {
  bearing_holes(W, L,  F, B, C, S1);
}



module bearing_race ( T, h, E, W, L, F, G, B, C, K, S1, S2, L1, id, od )
{
  bevel_height = 1;

  // Screw holes Y is always either zero or 1/2 height
  x1 = B/2;
  x2 = 0 - x1;

  y1 = (F/2) -(L1/2);  // center height of screw holes
  y2 = (F/2) - L1 -((G-L1)/2) +(bevel_height/2);   // center height of non-screw holes
  y3 = -7.5;

  z1 = C/2;
  z2 = 0 - z1;

  h1 = L1;
  h2 = G-L1-bevel_height;

  // bearing
  color("grey")
  difference() {
    // linear bearing outside diameter
    cylinder(h=L-4, d=od, center=true, $fn=200);

    // linear bearing inside diameter
    cylinder(h=L, d=id, center=true, $fn=200);
  }

  difference(){
    // linear bearing outside diameter
    cylinder(h=L, d=od + 1, center=true, $fn=200);
    cylinder(h=L+1, d=od, center=true, $fn=200);

  }

  // Screw holes
  difference(){
    translate([x1, y1, z1]) rotate([90,0,0]) cylinder(h=h1, d=S1 + 0.01, $fn=100, center=true);
    translate([x1, y1, z1]) rotate([90,0,0]) cylinder(h=h1+0.01, d=S1, $fn=100, center=true);
  }
  difference(){
    translate([x1, y1, z2]) rotate([90,0,0]) cylinder(h=h1, d=S1 + 0.01, $fn=100, center=true);
    translate([x1, y1, z2]) rotate([90,0,0]) cylinder(h=h1+0.01, d=S1, $fn=100, center=true);
  }
  difference(){
    translate([x2, y1, z1]) rotate([90,0,0]) cylinder(h=h1, d=S1 + 0.01, $fn=100, center=true);
    translate([x2, y1, z1]) rotate([90,0,0]) cylinder(h=h1+0.01, d=S1, $fn=100, center=true);
  }
  difference(){
    translate([x2, y1, z2]) rotate([90,0,0]) cylinder(h=h1, d=S1 + 0.01, $fn=100, center=true);
    translate([x2, y1, z2]) rotate([90,0,0]) cylinder(h=h1+0.01, d=S1, $fn=100, center=true);
  }

  // non screw holes
  difference(){
    translate([x1, y2, z1]) rotate([90,0,0]) cylinder(h=h2, d=S2 + 0.01, $fn=100, center=true);
    translate([x1, y2, z1]) rotate([90,0,0]) cylinder(h=h2+0.01, d=S2, $fn=100, center=true);
  }
  difference(){
    translate([x1, y2, z2]) rotate([90,0,0]) cylinder(h=h2, d=S2 + 0.01, $fn=100, center=true);
    translate([x1, y2, z2]) rotate([90,0,0]) cylinder(h=h2+0.01, d=S2, $fn=100, center=true);
  }
  difference(){
    translate([x2, y2, z1]) rotate([90,0,0]) cylinder(h=h2, d=S2 + 0.01, $fn=100, center=true);
    translate([x2, y2, z1]) rotate([90,0,0]) cylinder(h=h2+0.01, d=S2, $fn=100, center=true);
  }
  difference(){
    translate([x2, y2, z2]) rotate([90,0,0]) cylinder(h=h2, d=S2 + 0.01, $fn=100, center=true);
    translate([x2, y2, z2]) rotate([90,0,0]) cylinder(h=h2+0.01, d=S2, $fn=100, center=true);
  }

  // hole bevels
  difference(){
    translate([x1, y3, z1]) rotate([90,0,0]) cylinder(h=bevel_height + 0.01, d2=S1 + 0.01, d1=S2 + 0.01, $fn=100, center=true);
    translate([x1, y3, z1]) rotate([90,0,0]) cylinder(h=bevel_height, d2=S1, d1=S2, $fn=100, center=true);
  }
  difference(){
    translate([x1, y3, z2]) rotate([90,0,0]) cylinder(h=bevel_height + 0.01, d2=S1 + 0.01, d1=S2 + 0.01, $fn=100, center=true);
    translate([x1, y3, z2]) rotate([90,0,0]) cylinder(h=bevel_height, d2=S1, d1=S2, $fn=100, center=true);
  }
  difference(){
    translate([x2, y3, z1]) rotate([90,0,0]) cylinder(h=bevel_height + 0.01, d2=S1 + 0.01, d1=S2 + 0.01, $fn=100, center=true);
    translate([x2, y3, z1]) rotate([90,0,0]) cylinder(h=bevel_height, d2=S1, d1=S2, $fn=100, center=true);
  }
  difference(){
    translate([x2, y3, z2]) rotate([90,0,0]) cylinder(h=bevel_height + 0.01, d2=S1 + 0.01, d1=S2 + 0.01, $fn=100, center=true);
    translate([x2, y3, z2]) rotate([90,0,0]) cylinder(h=bevel_height, d2=S1, d1=S2, $fn=100, center=true);
  }


  color("lightgrey")
  difference() {
    // base block
    cube([W,F,L], center=true);

    // linear bearing outside diameter
    cylinder(h=L+1, d=od, center=true, $fn=200);

    // Screw holes
    translate([x1, (L1/2)+1, z1]) rotate([90,0,0]) cylinder(h=L1+1, d=S1, $fn=100, center=true);
    translate([x1, (L1/2)+1, z2]) rotate([90,0,0]) cylinder(h=L1+1, d=S1, $fn=100, center=true);
    translate([x2, (L1/2)+1, z1]) rotate([90,0,0]) cylinder(h=L1+1, d=S1, $fn=100, center=true);
    translate([x2, (L1/2)+1, z2]) rotate([90,0,0]) cylinder(h=L1+1, d=S1, $fn=100, center=true);

    translate([x1, 0, z1]) rotate([90,0,0]) cylinder(h=F+1, d=S2, $fn=100, center=true);
    translate([x1, 0, z2]) rotate([90,0,0]) cylinder(h=F+1, d=S2, $fn=100, center=true);
    translate([x2, 0, z1]) rotate([90,0,0]) cylinder(h=F+1, d=S2, $fn=100, center=true);
    translate([x2, 0, z2]) rotate([90,0,0]) cylinder(h=F+1, d=S2, $fn=100, center=true);

    // Top bevels
    // right top cutout
    // Top slanted cutout
    // F-G = cutout height
    // L   = cutout length
    // E*.75 = cutout top width    (.75 comes from measuring)
    // K+3 = cutout bottom width   (3 comes from measuring)

    translate([(W/2)-K, 0-((F/2)-((F-G)/2)), 0])
    hull(){
      translate([-(E-(E*0.75))/2, -(F-G)/2, 0]) cube([E*0.75, 0.1, L+1], center=true);
      translate([.75, (F-G)/2, 0])  cube([K+2, 0.1, L+1], center=true);
    }

    // left top cutout
    translate([0-((W/2)-K), 0-((F/2)-((F-G)/2)), 0])
    hull(){
      translate([(E-(E*0.75))/2, -(F-G)/2, 0]) cube([E*0.75, 0.1, L+1], center=true);
      translate([-0.75, (F-G)/2, 0])  cube([K+2, 0.1, L+1], center=true);
    }

    // Side cutouts
    translate([W/2, 0-(L1/2), 0])
    hull(){
      cube([3, F-L1+0.1, L+1], center=true);
      cube([0.01, F-T+0.1, L+1], center=true);
    }

    translate([-(W/2), 0-(L1/2), 0])
    hull(){
      cube([3, F-L1+0.1, L+1], center=true);
      cube([0.01, F-T+0.1, L+1], center=true);
    }

    // bottom indent
    translate([0, F/2, 0])
    hull() {
      cube([(B/2)+1, 0.01 ,L+1], center=true);
      cube([B/2, 2 ,L+1], center=true);
    }
  }


}

// used to punch out mounting holes
module bearing_holes ( W, L, F, B, C, S1)
{
  color("lightcoral")
  union() {
    // Screw holes Y is always either zero or 1/2 height
    x1 = B/2;
    x2 = 0 - x1;

    z1 = C/2;
    z2 = 0 - z1;

    translate([x1, 0, z1]) rotate([90,0,0]) cylinder(h=F+1, d=S1, $fn=100, center=true);
    translate([x1, 0, z2]) rotate([90,0,0]) cylinder(h=F+1, d=S1, $fn=100, center=true);
    translate([x2, 0, z1]) rotate([90,0,0]) cylinder(h=F+1, d=S1, $fn=100, center=true);
    translate([x2, 0, z2]) rotate([90,0,0]) cylinder(h=F+1, d=S1, $fn=100, center=true);
  }
}
