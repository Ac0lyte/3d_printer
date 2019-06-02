include <vars.scad>;

if (PART == "pivot_nut_holder") {
    color("skyblue") pivot_nut_holder();
}

module pivot_nut_holder(
    pivot_diam = pivot_diam,
    bolt_diam = height_bolt_diam + 1,
    nut_diam = M4_nut_diam,
    nut_height = M4_nut_height,
    nut_width = M4_nut_width
) {
    difference() {
        sphere( d=pivot_diam, $fn=100);

        // center bolt hole
        cylinder(h=pivot_diam+1, d=bolt_diam, $fn=100, center=true);

        // height adjustment nut hole
        rotate([0,0,0]) cylinder(h=nut_height +0.5, d=nut_diam+0.5, $fn=6, center=true);
        translate([5,0,0]) cube([8,nut_width + 0.5 ,nut_height+0.5], center=true);

        // Take the bottom off the sphere
        translate([0 ,0 ,0 - pivot_diam/2 - nut_height]) cube([pivot_diam, pivot_diam, pivot_diam], center=true);
    }
}
