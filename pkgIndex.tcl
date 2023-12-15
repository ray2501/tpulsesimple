# -*- tcl -*-
# Tcl package index file, version 1.1
#
if {[package vsatisfies [package provide Tcl] 9.0-]} {
    package ifneeded tpulsesimple 0.3 \
	    [list load [file join $dir libtcl9tpulsesimple0.3.so] [string totitle tpulsesimple]]
} else {
    package ifneeded tpulsesimple 0.3 \
	    [list load [file join $dir libtpulsesimple0.3.so] [string totitle tpulsesimple]]
}
