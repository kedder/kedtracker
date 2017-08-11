all: firmware

flash: firmware
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

.PHONY: firmware
firmware:
	$(MAKE) -C firmware


clean:
	$(MAKE) -C firmware clean