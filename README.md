tplusesimple
=====

[PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)
is a network-capable sound server program distributed by
[freedesktop.org](https://www.freedesktop.org/wiki/).

The [simple API](https://freedesktop.org/software/pulseaudio/doxygen/simple.html)
is designed for applications with very basic sound playback or capture needs.
It can only support a single stream per connection and has no handling of
complex features like events, channel mappings and volume control.

This extension is Tcl bindings for PulseAudio simple API.
Capture function added to current codebase but not actually verify.


License
=====

LGPL 2.1, or (at your option) any later version.


Commands
=====

pulseaudio::simple HANDLE ?-appname name? ?-direction direction? ?-format format? ?-rate samplerate? ?-channels channels?   
HANDLE read  
HANDLE write byte_aray  
HANDLE flush  
HANDLE drain  
HANDLE get_latency  
HANDLE close

`-direction` could setup below value:
PLAYBACK, RECORD, and default setting is PLAYBACK

`-format` could setup below value:
SAMPLE_U8, SAMPLE_ALAW, SAMPLE_ULAW, SAMPLE_S16LE, SAMPLE_S16BE,
SAMPLE_FLOAT32LE, SAMPLE_FLOAT32LE, SAMPLE_S32LE, SAMPLE_S32BE,
SAMPLE_S24LE, SAMPLE_S24BE, SAMPLE_S24_32LE, SAMPLE_S24_32BE,
default setting is SAMPLE_S16LE

Once the connection is established to the server, data can start flowing.
`read` method read some data from the server. `write` write some data to the server.
Note that these operations always block.

`flush` method will throw away all data currently in buffers.

`drain` method will wait for all sent data to finish playing.

Once playback or capture is complete, the connection should be closed
and resources freed. This is done through `close` method.


Linux Build
=====

I only test tpulsesimple under openSUSE LEAP 42.2 and Ubuntu 14.04.

Users need install libpulse development files. Below is an example for openSUSE:

	sudo zypper in libpulse-devel

Below is an example for Ubuntu:

	sudo apt-get install libpulse-dev

Building under most UNIX systems is easy, just run the configure script and then
run make. For more information about the build process, see the tcl/unix/README
file in the Tcl src dist. The following minimal example will install the extension
in the /opt/tcl directory.

	$ cd tpulsesimple
	$ ./configure --prefix=/opt/tcl
	$ make
	$ make install

If you need setup directory containing tcl configuration (tclConfig.sh),
below is an example:

	$ cd tpulsesimple
	$ ./configure --with-tcl=/opt/activetcl/lib
	$ make
	$ make install


Examples
=====

Cowork with [tclmpg123](https://github.com/ray2501/tclmpg123).

	#
	# Using PulseAudio and libmpg123 to play a mp3 file
	#

	package require tpulsesimple
	package require mpg123

	if {$argc > 0} {
	  set name [lindex $argv 0]
	} else {
	  puts "Please input filename."
	  exit
	}

	if {[catch {set data [mpg123 mpg0 $name]}]} {
	  puts "mpg123: read file failed."
	  exit
	}

	pulseaudio::simple simple0 -direction PLAYBACK \
	  -appname "PlayMP3" \
	  -format SAMPLE_S16LE \
	  -rate [dict get $data samplerate] \
	  -channels [dict get $data channels]

	while {[catch {set buffer [mpg0 read]}] == 0} {
	  simple0 write $buffer
	}

	mpg0 close
	simple0 close

