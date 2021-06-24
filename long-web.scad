// Units are mm.

use <common.scad>;

module long_web() {
    translate([0, -web_extension() / 2, 0])
        difference() {
            square([tube_width(), 2 * web_dx() + tube_width() + web_extension()], center = true);
            translate([0, web_extension() / 2, 0])
                circle(r = bolt_diam() / 2, $fn = 20);
            translate([0, web_extension() / 2 - web_dx(), 0])
                circle(r = bolt_diam() / 2, $fn = 20);
            translate([0, -web_extension() / 2 - web_dx(), 0])
                circle(r = bolt_diam() / 2, $fn = 20);
            translate([0, web_extension() / 2 + web_dx(), 0])
                circle(r = bolt_diam() / 2, $fn = 20);
        }
}

long_web();
