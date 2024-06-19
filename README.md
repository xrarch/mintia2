## WIP rewrite; See [Old MINTIA](http://github.com/limnarch/mintia) for a working OS.

# MINTIA

MINTIA is a custom operating system written in a custom programming language, as
part of a half-decade personal project to create a fully from-scratch RISC
workstation computer called [XR/station](https://github.com/xrarch/xremu).

Its kernel design pays homage to the Windows NT operating system. In particular
the virtual memory manager has been written with similar goals, with the
capability to swap to disk not only user pages but also kernel stacks, page
tables, and even ~50% of its own kernel code and heap.

MINTIA aims to be something that might have come off of a weird workstation
computer made by a doomed company in 1989, and that might have been considered
a pretty strong system at the time. It is also intended to be very portable.

![Running](https://raw.githubusercontent.com/xrarch/mintia/main/screenshot.png)

## Supported Architectures

<a href="https://github.com/xrarch/xremu"><img src="https://raw.githubusercontent.com/xrarch/mintia/main/badge-17032.png" width="256"></a>

## Building

As with all XR/station projects, the [newsdk](http://github.com/xrarch/newsdk) should
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

## Testing

With the XR/station emulator (`./xremu/`) and MINTIA repository (`./mintia2/`) in your current directory, run this command:

`./xremu/graphical.sh -dks ./mintia2/Images/MintiaTest-XRstation-upfre.img`

If it doesn't boot automatically, type this command at the firmware prompt:

`boot /disks/0/a`

MINTIA ~~should boot to the `username:` prompt.~~ does nothing currently!
