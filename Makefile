all: firmware build-firmware schematics-png

FIRMWARE_GIT = git@github.com:kedder/diy-tracker.git

flash: build-firmware
	openocd -f openocd/stm32f1.cfg \
	   -c init \
	   -c targets \
	   -c halt \
	   -c "stm32f1x mass_erase 0" \
	   -c "flash erase_check 0" \
	   -c "flash write_bank 0 firmware/build/main.bin 0" \
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
	   -c "flash write_bank 0 firmware/build/setup.bin 0" \
	   -c "reset run" \
	   -c shutdown
	@echo Flashing completed

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
		firmware/build/setup.elf


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

.PHONY: schematics-png
schematics-png:
	$(MAKE) -C hardware/render


# Python environment

VENV_BIN=venv/bin
PYTHON=$(VENV_BIN)/python

venv:
	virtualenv -p python3 venv

.python-installed: python-requirements.txt | venv
	$(VENV_BIN)/pip install -r python-requirements.txt
	touch python-requirements.txt


.PHONY: deploy
deploy: .python-installed build-firmware
	$(PYTHON) scripts/deploy.py


