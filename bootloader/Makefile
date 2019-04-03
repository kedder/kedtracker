BOOTLOADER_NAME=Ked Tracker Bootloader
BOOTLOADER_VERSION=1.0

PATHB = build/
PATHD = $(PATHB)depends/
PATHO = $(PATHB)objs/
PATHS = src/
PATHL = lib/

SRCS = $(wildcard $(PATHS)*.c)
SRCS += $(wildcard $(PATHS)*.cpp)
SRCS += $(wildcard $(PATHL)fatfs/*.c)
SRCS += $(wildcard $(PATHL)cmsis_boot/*.c)
SRCS += $(wildcard $(PATHL)cmsis_boot/startup/*.c)
SRCS += $(wildcard $(PATHL)stm_lib/src/*.c)
OBJS := $(patsubst $(PATHS)%.c, $(PATHO)%.o, $(SRCS))
OBJS := $(patsubst $(PATHS)%.cpp, $(PATHO)%.o, $(OBJS))
OBJS := $(patsubst $(PATHL)%.c, $(PATHO)%.o, $(OBJS))

BUILD_PATHS = $(PATHB) $(PATHD) $(PATHO) $(PATHO)fatfs/ $(PATHO)cmsis_boot/ $(PATHO)cmsis_boot/startup/ $(PATHO)stm_lib/src

CLEANUP = rm -rf
MKDIR = mkdir -p
TARGET_EXTENSION=out
CC := arm-none-eabi-gcc
CXX := arm-none-eabi-g++
LD := arm-none-eabi-gcc
AR := arm-none-eabi-ar
AS := arm-none-eabi-as
OBJCOPY := arm-none-eabi-objcopy
OBJDUMP := arm-none-eabi-objdump
GDB := arm-none-eabi-gdb
SIZE := arm-none-eabi-size

LDSCRIPT := ld/stm32f103c8.ld

CFLAGS := -c -Os -Wall -Wundef -fdata-sections -ffunction-sections
CFLAGS += -fno-common -g -mcpu=cortex-m3 -mthumb
CFLAGS += -DBOOTLOADER_VERSION='"$(BOOTLOADER_VERSION)"'
CFLAGS += -DBOOTLOADER_NAME='"$(BOOTLOADER_NAME)"'
# CFLAGS += -DSTM32F10X_MD
CFLAGS += -Isrc
CFLAGS += -Ilib/cmsis_boot
CFLAGS += -Ilib/cmsis
CFLAGS += -Ilib/stm_lib/inc
CFLAGS += -Ilib/fatfs
LDFLAGS := --static
LDFLAGS += -Wl,-Map=$(PATHB)bootloader.map
LDFLAGS += -Wl,--cref
LDFLAGS += -Wl,--emit-relocs
LDFLAGS += -Wl,--gc-sections
LDFLAGS += -nostartfiles --specs=nosys.specs
LDFLAGS += -T$(LDSCRIPT) -Lld
#LIBS := -lc
IMAGE := $(PATHB)bootloader.bin


.PRECIOUS: %.elf
.PRECIOUS: %.map
.PRECIOUS: %.bin
.PRECIOUS: $(PATHD)%.d
.PRECIOUS: $(PATHO)%.o

all: release

.PHONY: release
release: $(BUILD_PATHS) $(IMAGE)

%.bin: %.elf
	@echo "> creating BIN: $@"
	@$(OBJCOPY) -Obinary $(*).elf $(*).bin

%.hex: %.elf
	@echo "> creating HEX: $@"
	@$(OBJCOPY) -Oihex $(*).elf $(*).hex

%.elf %.map: $(OBJS) $(LDSCRIPT)
	@echo "> linking $@"
	@$(LD) $(LDFLAGS) $(OBJS) $(LIBS) -o $(*).elf
	@$(SIZE) $(*).elf

$(PATHO)%.o:: $(PATHS)%.c
	@echo "+ cc $<"
	@$(CC) $(CFLAGS) $< -o $@

$(PATHO)%.o:: $(PATHL)%.c
	@echo "+ cc $<"
	@$(CC) $(CFLAGS) $< -o $@

$(BUILD_PATHS):
	@echo "> creating $@"
	@$(MKDIR) $@

.PHONY: clean
clean:
	$(CLEANUP) $(PATHB)


OPENOCD_CFG = "openocd/stm32f1.cfg"

.PHONY: flash
flash: release
	openocd -f ${OPENOCD_CFG} \
		-c init \
		-c halt \
		-c targets \
	    -c "stm32f1x mass_erase 0" \
	    -c "flash erase_check 0" \
		-c "flash write_bank 0 $(IMAGE) 0" \
		-c "reset run" \
		-c "shutdown"

# -c "verify_image $(IMAGE)" 

.PHONY: debugger
debugger:
	openocd -f ${OPENOCD_CFG} \
	   -c init \
	   -c halt \
	   -c targets

.PHONY: gdb
gdb:
	$(GDB) \
		-tui \
		--eval-command "target remote localhost:3333" \
		$(PATHB)bootloader.elf
