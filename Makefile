all: firmware build-firmware

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

.PHONY: debugger
debugger:
	openocd -f openocd/stm32f1.cfg \
	   -c init \
	   -c targets \
	   -c halt

console:
	#screen /dev/ttyUSB0 115200,echo
	picocom --baud 115200 --echo /dev/ttyUSB0


firmware: firmware/makefile

firmware/makefile:
	git submodule init
	git submodule update

.PHONY: build-firmware
build-firmware: firmware
	$(MAKE) -C firmware


clean:
	$(MAKE) -C firmware clean