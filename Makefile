all: firmware build-firmware schematics-png

FIRMWARE_GIT = git@github.com:kedder/diy-tracker.git

BOOTLOADER_BUILD = bootloader/build
BOOTLOADER_BIN = $(BOOTLOADER_BUILD)/bootloader.bin
FIRMWARE_BUILD = firmware/build
MAIN_BIN = $(FIRMWARE_BUILD)/main.bin
SETUP_BIN = $(FIRMWARE_BUILD)/setup.bin

flash: build-firmware
	openocd -f openocd/stm32f1.cfg \
	   -c init \
	   -c targets \
	   -c halt \
	   -c "stm32f1x mass_erase 0" \
	   -c "flash erase_check 0" \
	   -c "flash write_bank 0 $(BOOTLOADER_BIN) 0x0" \
	   -c "flash write_bank 0 $(MAIN_BIN) 0x2000" \
	   -c "reset run" \
	   -c shutdown
	@echo Flashing completed

flash-setup: build-firmware
	openocd -f openocd/stm32f1.cfg \
	   -c init \
	   -c targets \
	   -c halt \
	   -c "stm32f1x mass_erase 0" \
	   -c "flash erase_check 0" \
	   -c "flash write_bank 0 $(BOOTLOADER_BIN) 0x0" \
	   -c "flash write_bank 0 $(SETUP_BIN) 0x2000" \
	   -c "reset run" \
	   -c shutdown
	@echo Flashing completed

flash-usb: build-firmware
	stm32flash -w $(MAIN_BIN) /dev/ttyUSB0

.PHONY: debugger
debugger:
	openocd -f openocd/stm32f1.cfg \
	   -c init \
	   -c halt \
	   -c targets

.PHONY: gdb
gdb:
	arm-none-eabi-gdb \
		-tui \
		--eval-command "target remote localhost:3333" \
		firmware/build/main.elf


console:
	#screen /dev/ttyUSB0 115200,echo
	picocom --baud 115200 --echo /dev/ttyUSB0


firmware: firmware/makefile

firmware/makefile:
	git submodule init
	git submodule update

.PHONY: build-firmware
build-firmware: firmware
	$(MAKE) -C firmware all setup


clean:
	$(MAKE) -C firmware clean
	rm -rf venv
	rm .python-installed

.PHONY: schematics-png
schematics-png:
	$(MAKE) -C hardware/render


# Python environment

VENV_BIN=venv/bin
PYTHON=$(VENV_BIN)/python

venv:
	python3 -m venv venv

.python-installed: python-requirements.txt | venv
	$(VENV_BIN)/pip install -r python-requirements.txt
	touch .python-installed


.PHONY: deploy
deploy: .python-installed build-firmware
	$(PYTHON) scripts/deploy.py

.PHONY: labels
labels: .python-installed box/production/.generated

box/production/.generated: prodlist.csv
	$(PYTHON) scripts/makelabels.py box/labels-%s.svg prodlist.csv box/production
	$(PYTHON) scripts/makelabels.py box/manual-sheet.svg prodlist.csv box/production
	touch box/production/.generated

.PHONY: package
package: build-firmware | packages
	bootloader/packagefw.py --version `cat fwversion.txt` \
		$(MAIN_BIN) packages/kedtracker-`cat fwversion.txt`.fw

packages:
	mkdir packages
