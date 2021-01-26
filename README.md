# Novaboot

Novaboot is a tool that automates booting of operating systems on
target hardware (typically embedded boards) or in Qemu. Initially, it
was developed to boot [NOVA Microhypervisor](http://hypervisor.org/)
(hence the name), but nowadays is well suited for booting Linux (and
perhaps other OSes) too.

## Instalation

The simplest way to install novaboot is to install `perl` and its
packages `IO-Stty` and `Expect` and copy the
[novaboot](server/novaboot-shell.pod) script somewhere to your $PATH.

You can also install everything (including man pages) by:

    make install

To install the optional server part (see below), run:

    make -C server install

## Documentation

Novaboot can be used in variety of setups. Most typical ones are
depicted in the figure below.

![Possible novaboot setups](doc/typical-setups.svg?raw=true "Title")

### Client side

- novaboot [documentation](./README.pod)

### Server-side (optional, needed only for setup C)

- [novaboot-shell](server/novaboot-shell.pod)
- [adduser-novaboot](server/adduser-novaboot.pod)
