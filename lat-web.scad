// Units are mm.

use <common.scad>;

module lat_web() {
    difference() {
        square([tube_width(), 2 * web_dx() + tube_width()], center = true);
        circle(r = bolt_diam() / 2, $fn = 20);
        translate([0, -web_dx(), 0])
            circle(r = bolt_diam() / 2, $fn = 20);
        translate([0, web_dx(), 0])
            circle(r = bolt_diam() / 2, $fn = 20);
    }
}

lat_web();
