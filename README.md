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

* Communication via standard IGC RJ45 socket or LX NAV style RJ45 socket.
  Allows to re-use existing equipment like FLARM viewers or cables.

* Barometric sensor onboard for more precise altitude measurement.

## Schematics

Current schematics can be also downloaded in
[PDF format](hardware/render/kedtracker-schematics.pdf?raw=true).

![Schematic](/hardware/render/kedtracker-schematics.png?raw=true "Schematic")