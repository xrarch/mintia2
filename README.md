## WIP rewrite; See [Old MINTIA](http://github.com/xrarch/mintia) for a working OS.

# MINTIA

MINTIA is a custom operating system written in a custom programming language, as
part of a half-decade personal project to create a fully from-scratch RISC
workstation computer called [XR/station](https://github.com/xrarch/xremu).

MINTIA aims to be something that might have come off of a weird workstation
computer made by a doomed company in 1989, and that might have been considered
a pretty strong system at the time. It is also intended to be very portable.

## Kernel Design Acknowledgements

The scheduler design is inspired by FreeBSD's ULE. The overall system structure,
particularly the usage of a hierarchical interrupt structure and the usage of
software interrupts for deferred events, is inspired by the Windows NT kernel.
The memory manager is inspired by VMS, NT, and UVM. The overall structure of the
IO system, particularly its fundamentally asynchronous nature, is inspired by
VMS and NT. The locking design (usage of turnstiles and priority inheritance) is
inspired by Solaris. The plug-n-play and power management aspects of the IO
system are inspired by XNU's IOKit.

## Supported Architectures

<a href="https://github.com/xrarch/xremu"><img src="https://raw.githubusercontent.com/xrarch/mintia2/main/badge-17032.png" width="256"></a>
<a href="https://github.com/fox32-arch/fox32"><img src="https://raw.githubusercontent.com/xrarch/mintia2/main/badge-fox32.png" width="256"></a>

## Building

The [newsdk](http://github.com/xrarch/newsdk) should
be in a directory `../newsdk` relative to this repository. It should be set up as per
the instructions in that repo.

The [a4x](http://github.com/xrarch/a4x) repository should also be cloned at `../a4x`
as some header files are needed for the XR/station build.

Running `../newsdk/bin/xrbt.exe build.xrbt all` should then place a MINTIA test
image at `Images/MintiaTest-XRstation-upfre.img`. Windows users should use WSL
as Cygwin seems to have problems with the SDK. Multi-core builds are encouraged
with the `JOBS=N` argument, where N is the number of cores on your machine.

To build for fox32, add `PLATFORM=fox32` and the distribution image should
be placed at `Images/MintiaTest-fox32-upfre.img`.

To clean the source tree, add `CLEANUP=1` to the command line you'd use to
build.

## Testing

With the XR/station emulator (`./xremu/`) and MINTIA repository (`./mintia2/`) in your current directory, run this command:

`./xremu/graphical.sh -dks ./mintia2/Images/MintiaTest-XRstation-upfre.img`

If it doesn't boot automatically, type this command at the firmware prompt:

`boot dks0s0`

MINTIA ~~should boot to the login prompt.~~ does nothing currently!
