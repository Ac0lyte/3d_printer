bowden_wrench();


module bowden_wrench() {
    outside=14;
    inside=12;
    stem_offset = 7;
    mouth_height = 12;
    
    difference() {
        union(){
            // Bottom wrench mouth
            difference(){
                cylinder(h=mouth_height, d=outside, $fn=200, center=true);
                cylinder(h=mouth_height+1, d=inside, $fn=6, center=true);
                translate([7.5, 0, 0]) cylinder(h=mouth_height+1, d=16, $fn=6, center=true);        
            }
            
            difference() {
                translate([0,0,10]) cylinder(h=10, d1=outside, d2=outside+2, $fn=200, center=true);
                translate([0,0,10]) cylinder(h=11, d=outside, $fn=200, center=true);
                translate([stem_offset,0,10]) cylinder(h=11, d=outside, $fn=200, center=true);
            }

            difference() {
                translate([0,0,45]) cylinder(h=60, d=outside+2, $fn=200, center=true);
                translate([0,0,45]) cylinder(h=61, d=outside, $fn=200, center=true);
                translate([stem_offset,0,45]) cylinder(h=61, d=outside, $fn=200, center=true);
            }
         
        }
    }
}