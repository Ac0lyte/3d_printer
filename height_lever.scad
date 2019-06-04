/* Global */
include <vars.scad>;
include <608zz_bearing.scad>;

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module height_lever() {
  // Platform base dimentions
  platfom_width = 180;
  platfom_height = 5;
  platfom_depth = 30;

  //
  linear_bearing_height=29;
  linear_bearing_od=19;
  linear_bearing_id=10;

  //608zz
  bearing_height=7;
  bearing_od=22;
  bearing_id=8;
  bearing_race=11;

  // M5 Nut
  M5_height = 4;
  M5_diam = 9;

  // Lever rod
  rod_diam = 6;
  
  // hight adjust lever
  color("lightblue") {
    // 608zz bearing holder
    difference() {
      union(){
        // lever handle
        hull(){
          translate([10, 35, bearing_height+7.5]) cylinder(h=5, d=10, $fn=100, center=true);
          translate([40, 35, bearing_height+10]) rotate([0,90,0]) cylinder(h=20, d=12, $fn=100, center=true);
        }
        translate([170, 35, bearing_height+10]) rotate([0,90,0]) cylinder(h=20, d=12, $fn=100, center=true);
        // bearing holder
        hull(){
          translate([170,38,0]) rotate([90,0,0])  cylinder(h=bearing_height+5, d=bearing_od+5, $fn=100, center=true);
          translate([200,38,0]) rotate([90,0,0])  cylinder(h=bearing_height+5, d=bearing_od+5, $fn=100, center=true);
        }
      }
      
      // Bearing holes
      translate([170,35.5,0]) rotate([90,0,0])  cylinder(h=bearing_height+1, d=bearing_od+0.1,   $fn=100, center=true);
      translate([200,40.5,0]) rotate([90,0,0])  cylinder(h=bearing_height+1, d=bearing_od+0.1,   $fn=100, center=true);
      
      // screw hole in lever
      translate([10, 35, bearing_height+7.5]) cylinder(h=10, d=4, $fn=100, center=true);
      // spring indent in lever
      translate([10, 35, bearing_height+3]) cylinder(h=5, d=5, $fn=100, center=true);

      // Rod holes
      translate([45, 35, bearing_height+10]) rotate([0,90,0]) cylinder(h=15, d=rod_diam, $fn=100, center=true);
      translate([165, 35, bearing_height+10]) rotate([0,90,0]) cylinder(h=15, d=rod_diam, $fn=100, center=true);
    }
  }
}

