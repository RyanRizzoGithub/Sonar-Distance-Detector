// Dimensions for parent
totalWidth = 71;
totalLength = 47;
totalHeight = 19;

// Dimensions for inner cube
innerWidth = 55;
innerLength = 37;
innerHeight = 19;

// Dimensions for ledge
ledgeWidth = 57;
ledgeLength = 39;
ledgeHeight = 2;

// Dimensions for cycliner
cylinderHeight = 4;
cylinderDiameter = 4;

// Dimensions for Arduino USB hole
arduinoHoleWidth = 10;
arduinoHoleLength = 16;
arduinoHoleHeight = 10;

// Dimensions for Computer UBS hole
computerHoleWidth = 10;
computerHoleLength = 14;
computerHoleHeight = 11;

difference() {
    intersection() {
        difference() {
            cube([totalWidth, totalLength, totalHeight], center = true);
            translate([0, 0, 1])
                cube([innerWidth, innerLength, innerHeight], center = true);
            translate([0, 0, 9])
                cube([ledgeWidth, ledgeLength, ledgeHeight], center = true);
            translate([32, 0, 2])
                cube([arduinoHoleWidth, arduinoHoleLength, arduinoHoleHeight], center = true);
            translate([-32, 0, 2])
                cube([computerHoleWidth, computerHoleLength, computerHoleHeight], center = true);
        }  
    }
}
translate([22, 14, -7])
                cylinder(cylinderHeight, cylinderDiameter, cylinderDiameter, center = true);
translate([-22, 14, -7])
                cylinder(cylinderHeight, cylinderDiameter, cylinderDiameter, center = true);
translate([22, -14, -7])
                cylinder(cylinderHeight, cylinderDiameter, cylinderDiameter, center = true);
translate([-22, -14, -7])
                cylinder(cylinderHeight, cylinderDiameter, cylinderDiameter, center = true);