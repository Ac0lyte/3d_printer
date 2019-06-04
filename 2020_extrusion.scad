/* Global */
include <vars.scad>;

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_extrusion(bar_height){
    small=0.001;

    translate([0,0,0])
    intersection(){
        cylinder(d=26.87,h=bar_height,center=true, $fn=200);
        difference(){
            union(){
                difference(){
                cube([20,20,bar_height],center=true);
                    union()
                    {
                        cube([16.4+small,16.4+small,bar_height+small],center=true);
                        cube([6.2+small,20+small,bar_height+small],center=true);
                        cube([20+small,6.2+small,bar_height+small],center=true);

                        translate([0,9.75,0])
                        cube([7.2+small,0.5+small,bar_height+small],center=true);
                        translate([9.75+small,0,0])
                        cube([0.5+small,7.2+small,bar_height+small],center=true);
                        translate([0,-9.75-small,0])
                        cube([7.2+small,0.5+small,bar_height+small],center=true);
                        translate([-9.75-small,0,0])
                        cube([0.5+small,7.2+small,bar_height+small],center=true);
                    }

                }
                rotate([0,0,45]){
                    cube([1.5,26,bar_height],center=true);
                    cube([26,1.5,bar_height],center=true);
                }
                translate([7.5,7.5,0])cube([4.5,4.5,bar_height],center=true);
                translate([-7.5,-7.5,0])cube([4.5,4.5,bar_height],center=true);
                translate([-7.5,7.5,0])cube([4.5,4.5,bar_height],center=true);
                translate([7.5,-7.5,0])cube([4.5,4.5,bar_height],center=true);
                cube([8,8,bar_height],center=true);
            }
            cylinder(r=2.5,h=bar_height+small,center=true, $fn=200);
        }
}
}
