


difference() {
    // Parent cube
    cube([70, 51, 51], center = true);
    // Parent cutout
    
    cube([60, 41, 56], center = true);
    translate([0, 0, -5])
        cube([60, 56, 51], center = true);
    translate([0, 0, -5])
        cube([75, 41, 56], center = true);
}

       

difference() {
    // Distance sensor housing
    cube([52, 21, 28], center = true);
    translate([0, 5, 0])
        cube([46, 17, 22], center = true);
    translate([0, 6,10])
        cube([15, 40, 10], center = true);
}
difference() {
    translate([0, 0, -25])
        cylinder(5, 50, 50, center = true);
    translate([0, 0, -25])
        cylinder(6, 45, 45, center = true);
}


difference() {
    // Base
   translate([0, 0, -25])
       cube([60, 41, 5], center = true); 
   translate([0, 0, -25])
        cylinder(10, 2, 2, center = true);
   translate([-4, 0, -25])
        cylinder(10, 1, 1, center = true); 
   translate([4, 0, -25])
        cylinder(10, 1, 1, center = true);
   translate([-8, 0, -25])
        cylinder(10, 1, 1, center = true); 
   translate([8, 0, -25])
        cylinder(10, 1, 1, center = true);
   translate([-12, 0, -25])
        cylinder(10, 1, 1, center = true); 
   translate([12, 0, -25])
        cylinder(10, 1, 1, center = true);
   translate([0, 0, -30])
        cube([40, 10, 10], center = true);
    
    
    // Base cutouts
    translate([-28, 0, -25])
        cube([10, 17, 10], center = true);
    
    translate([28, 0, -25])
        cube([10, 17, 10], center = true);
        
    translate([0, 15, -25])
        cube([66, 15, 10], center = true);

    translate([0, -15, -25])
        cube([66, 15, 10], center = true);
}

// Base pegs
translate([28, 16, -25])
rotate([0, 0, 55])
    cube([30, 8, 5], center = true);

translate([-28, 16, -25])
rotate([0, 0, -55])
    cube([30, 8, 5], center = true);

translate([28, -16, -25])
rotate([0, 0, -55])
    cube([30, 8, 5], center = true);

translate([-28, -16, -25])
rotate([0, 0, 55])
    cube([30, 8, 5], center = true);

// Distance sensor standoffs
translate([20, -3, 8])
rotate([90, 0, 0])
    cylinder(6, 2, 2, center = true);

translate([-20, -3, 8])
rotate([90, 0, 0])
    cylinder(6, 2, 2, center = true);

translate([20, -3, -8])
rotate([90, 0, 0])
    cylinder(6, 2, 2, center = true);

translate([-20, -3, -8])
rotate([90, 0, 0])
    cylinder(6, 2, 2, center = true);



// 3D Poles
translate([27, 15, 18])
rotate([46, 225, 0])
    cylinder(22, 2, 2, center = true);
    
translate([-27, -15, 18])
rotate([-46, -225, 0])
    cylinder(22, 2, 2, center = true);
    
translate([27, -15, 18])
rotate([-46, 225, 0])
    cylinder(22, 2, 2, center = true);
    
translate([-27, 15, 18])
rotate([46, -225, 0])
    cylinder(22, 2, 2, center = true);
    
translate([27, -15, -18])
rotate([46, -225, 0])
    cylinder(22, 2, 2, center = true);
    
translate([-27, -15, -18])
rotate([46, 225, 0])
    cylinder(22, 2, 2, center = true);
    
translate([-27, 15, -18])
rotate([-46, 225, 0])
    cylinder(22, 2, 2, center = true);
    
translate([27, 15, -18])
rotate([-46, -225, 0])
    cylinder(22, 2, 2, center = true);

/*
    
translate([28, -16, -16])
rotate([40, -210, 0])
    cylinder(24, 1.5, 1.5, center = true);
        
translate([28, 16, -16])
rotate([40, -30, 0])
    cylinder(24, 1.5, 1.5, center = true); 
  
translate([-28, 16, -16])
rotate([40, 30, 0])
    cylinder(24, 1.5, 1.5, center = true); 
  
*/   
    
    
    
    
    
    
    