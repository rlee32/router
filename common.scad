// Units are mm.

function i2mm(x) = x * 0.0254 * 1000;

function rotor_radius() = i2mm(6);
function bolt_diam() = i2mm(1.0/8);
function arm_count() = 8;

function center_to_motor() = 1.03125 * rotor_radius(); // overall center to motor axis.

// tube
function tube_height() = i2mm(0.5);
function tube_width() = i2mm(0.5);
function tube_thickness() = i2mm(1/16);



