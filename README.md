# Ked Tracker - Open Glider Network tracker hardware

Based on design by glidernet.org project: http://wiki.glidernet.org/ogn-tracker-diy.

It is a small airborn avionic device that periodically transmits aircraft
position. Signal is picked up by ground-based receivers and published on Open
Glider Network, so that aircraft position can be found on  various aircraft
tracking systems, like http://glidertracker.de/ or
https://www.flightradar24.com/. It is also received by other OGN tracker
devices in the vicinity and can be used to improve pilot' situation awareness.
See http://wiki.glidernet.org/ for more information.

Ked Tracker is designed using [KiCad](http://kicad-pcb.org/) electronic schematic and PCB design software.

## Features

* Can be powered from onboard 12V power supply (or any 9-24V power
  supply for that matter).

* Standard NMEA output.

* Uses FLARM NMEA sentences to report detected nearby aircrafts for
  interoperability with existing hardware and software.

* Communication via standard IGC RJ45 socket.
  Allows to re-use existing equipment like FLARM viewers or cables.

* Communication via USB interface. Device is visible as virtual COM port
  when connected to a computer. Requires no special cables other then standerd
  micro-USB cable. Device can also be powered by 5V from USB interface.

* Communication via Bluetooth. For hassle-free wireless connection with
  phone or tablet.

* Barometric sensor onboard for more precise altitude measurement.

* Slot for SD-card. Currently for logging device activity. Firmware for IGC
  flight logger is pending.

* Beeper to provide sound feedback for important events.

## Schematics

Current schematics can be also downloaded in
[PDF format](hardware/render/kedtracker.pdf?raw=true).

![Schematic Page 1](/hardware/render/kedtracker-0.png?raw=true "Schematic Page 1")
![Schematic Page 2](/hardware/render/kedtracker-1.png?raw=true "Schematic Page 2")

## Setting Up Development Environment

You will need to install additional packages for development. Packages for
ubuntu are specified here; other operating systems might have similar
requirements.

### Building Firmware and Flashing MCU

```
sudo apt install gcc-arm-none-eabi openocd picocom
sudo add-user `whoami` plugdev
sudo add-user `whoami` dialout
```

### Developing Hardware

```
sudo apt install kicad
```
