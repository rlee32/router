// Units are mm.

use <common.scad>;


module tube(length, top_bolts, side_bolts) {
    difference() {
        cube([tube_width(), length, tube_height()], center = true);
        cube([tube_width() - 2 * tube_thickness(), 2 * length, tube_height() - 2 * tube_thickness()], center = true);
        for (i = top_bolts) {
            translate([0, -length / 2 + i, 0])
                cylinder(h = 2 * tube_height(), d = bolt_diam(), center = true, $fn = 30);
        }
        for (i = side_bolts) {
            translate([0, -length / 2 + i, 0])
                rotate([0, 90, 0])
                    cylinder(h = 2 * tube_width(), d = bolt_diam(), center = true, $fn = 30);
        }
    }
}

test_length = i2mm(6);
tube(test_length, [tube_width(), test_length - tube_width()], [tube_width(), test_length - tube_width(), test_length / 2]);
