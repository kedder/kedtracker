EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32
LIBS:kedtracker
LIBS:switches
LIBS:kedder
LIBS:kedtracker-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Ked Tracker"
Date "2017-12-17"
Rev "0.6"
Comp ""
Comment1 "Open Glider Network Tracker"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RFM69HW RF1
U 1 1 598223BD
P 2700 4950
F 0 "RF1" H 2800 5600 60  0000 L CNN
F 1 "RFM69HW" H 2700 4500 60  0000 C CNN
F 2 "Ked Tracker:RFM69HW" H 2700 4950 60  0001 C CNN
F 3 "" H 2700 4950 60  0001 C CNN
	1    2700 4950
	-1   0    0    1   
$EndComp
Text GLabel 3700 5400 2    40   Input ~ 0
3.3V
Text Label 4450 3100 0    40   ~ 0
SPI_MOSI
Text Label 4450 3000 0    40   ~ 0
SPI_MISO
Text Label 4450 2900 0    40   ~ 0
SPI_CLOCK
Text Label 4450 2800 0    40   ~ 0
SPI_SELECT
$Comp
L VK2828U7G5LF J8
U 1 1 59822930
P 1800 3500
F 0 "J8" H 1400 3000 60  0000 L CNN
F 1 "VK2828U7G5LF" H 1800 3250 40  0000 C CNN
F 2 "Ked Tracker:Molex_PicoBlade_53047-0610_06x1.25mm_Straight" H 2250 3700 40  0001 C CNN
F 3 "" H 2250 3700 40  0001 C CNN
	1    1800 3500
	1    0    0    -1  
$EndComp
Text Label 4450 2700 0    40   ~ 0
GPS_RXD
Text Label 4450 2600 0    40   ~ 0
GPS_TXD
Text Label 4450 2500 0    40   ~ 0
GPS_PPS
Text Label 4450 2400 0    40   ~ 0
GPS_ENABLE
$Comp
L Earth #PWR01
U 1 1 59824D08
P 2250 5500
F 0 "#PWR01" H 2250 5250 50  0001 C CNN
F 1 "Earth" H 2250 5350 50  0001 C CNN
F 2 "" H 2250 5500 50  0001 C CNN
F 3 "" H 2250 5500 50  0001 C CNN
	1    2250 5500
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR02
U 1 1 5983759C
P 2200 2650
F 0 "#PWR02" H 2200 2400 50  0001 C CNN
F 1 "Earth" H 2200 2500 50  0001 C CNN
F 2 "" H 2200 2650 50  0001 C CNN
F 3 "" H 2200 2650 50  0001 C CNN
	1    2200 2650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 598375E1
P 2200 2550
F 0 "C2" H 2210 2620 50  0000 L CNN
F 1 "100nF" H 2210 2470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2200 2550 50  0001 C CNN
F 3 "" H 2200 2550 50  0001 C CNN
	1    2200 2550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 59837A47
P 3200 5600
F 0 "C4" H 3210 5670 50  0000 L CNN
F 1 "100nF" H 3210 5520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3200 5600 50  0001 C CNN
F 3 "" H 3200 5600 50  0001 C CNN
	1    3200 5600
	1    0    0    -1  
$EndComp
$Comp
L CONN_COAXIAL J1
U 1 1 59837E55
P 1800 5550
F 0 "J1" H 1810 5670 50  0000 C CNN
F 1 "ANT" V 1915 5550 50  0000 C CNN
F 2 "Ked Tracker:SMA_CONN" H 1800 5550 50  0001 C CNN
F 3 "" H 1800 5550 50  0001 C CNN
	1    1800 5550
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR03
U 1 1 59838011
P 1800 5750
F 0 "#PWR03" H 1800 5500 50  0001 C CNN
F 1 "Earth" H 1800 5600 50  0001 C CNN
F 2 "" H 1800 5750 50  0001 C CNN
F 3 "" H 1800 5750 50  0001 C CNN
	1    1800 5750
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR04
U 1 1 59838B5F
P 2100 1850
F 0 "#PWR04" H 2100 1600 50  0001 C CNN
F 1 "Earth" H 2100 1700 50  0001 C CNN
F 2 "" H 2100 1850 50  0001 C CNN
F 3 "" H 2100 1850 50  0001 C CNN
	1    2100 1850
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR05
U 1 1 59838C1F
P 850 900
F 0 "#PWR05" H 850 750 50  0001 C CNN
F 1 "+12V" H 850 1040 50  0000 C CNN
F 2 "" H 850 900 50  0001 C CNN
F 3 "" H 850 900 50  0001 C CNN
	1    850  900 
	1    0    0    -1  
$EndComp
Text GLabel 2650 1200 1    40   Input ~ 0
5V
$Comp
L Earth #PWR06
U 1 1 59970B11
P 3200 5800
F 0 "#PWR06" H 3200 5550 50  0001 C CNN
F 1 "Earth" H 3200 5650 50  0001 C CNN
F 2 "" H 3200 5800 50  0001 C CNN
F 3 "" H 3200 5800 50  0001 C CNN
	1    3200 5800
	1    0    0    -1  
$EndComp
Text Label 1700 5300 0    60   ~ 0
ANT
Text Label 2550 7100 0    40   ~ 0
STAT_LED
Text GLabel 1550 7100 0    40   Input ~ 0
3.3V
$Comp
L BMP280 B2
U 1 1 59B17E39
P 8950 3950
F 0 "B2" H 8850 4400 60  0000 C CNN
F 1 "BMP280" H 8950 4100 60  0000 C CNN
F 2 "Ked Tracker:BMP280" H 9000 3750 60  0001 C CNN
F 3 "" H 9000 3750 60  0001 C CNN
	1    8950 3950
	1    0    0    -1  
$EndComp
Text GLabel 8800 4600 3    40   Input ~ 0
3.3V
$Comp
L Earth #PWR07
U 1 1 59B181A3
P 8900 4350
F 0 "#PWR07" H 8900 4100 50  0001 C CNN
F 1 "Earth" H 8900 4200 50  0001 C CNN
F 2 "" H 8900 4350 50  0001 C CNN
F 3 "" H 8900 4350 50  0001 C CNN
	1    8900 4350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C16
U 1 1 59B18536
P 8600 4450
F 0 "C16" H 8610 4520 50  0000 L CNN
F 1 "100nF" H 8610 4370 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8600 4450 50  0001 C CNN
F 3 "" H 8600 4450 50  0001 C CNN
	1    8600 4450
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 59B19B1A
P 9300 4650
F 0 "R10" V 9380 4650 50  0000 C CNN
F 1 "10K" V 9300 4650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9230 4650 50  0001 C CNN
F 3 "" H 9300 4650 50  0001 C CNN
	1    9300 4650
	0    -1   -1   0   
$EndComp
$Comp
L R R9
U 1 1 59B19BB5
P 9300 4450
F 0 "R9" V 9380 4450 50  0000 C CNN
F 1 "10K" V 9300 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9230 4450 50  0001 C CNN
F 3 "" H 9300 4450 50  0001 C CNN
	1    9300 4450
	0    -1   -1   0   
$EndComp
Text GLabel 9650 4550 2    40   Input ~ 0
3.3V
$Comp
L D D1
U 1 1 59B1C17B
P 850 1600
F 0 "D1" H 850 1700 50  0000 C CNN
F 1 "SS14" H 850 1500 50  0000 C CNN
F 2 "Diodes_SMD:D_SMA_Standard" H 850 1600 50  0001 C CNN
F 3 "" H 850 1600 50  0001 C CNN
	1    850  1600
	0    1    1    0   
$EndComp
$Comp
L Ferrite_Bead L1
U 1 1 59B1D266
P 1150 1350
F 0 "L1" V 1000 1375 50  0000 C CNN
F 1 "1uH" V 1300 1350 50  0000 C CNN
F 2 "Inductors:INDUCTOR_V" V 1080 1350 50  0001 C CNN
F 3 "" H 1150 1350 50  0001 C CNN
	1    1150 1350
	0    1    1    0   
$EndComp
$Comp
L BUCK_CVTR B1
U 1 1 59B305A7
P 2100 1450
F 0 "B1" H 1750 1700 60  0000 L CNN
F 1 "BUCK_CVTR" H 2050 1600 40  0000 L CNN
F 2 "Ked Tracker:Buck_Converter_Sm" H 1800 1450 60  0001 C CNN
F 3 "" H 1800 1450 60  0001 C CNN
	1    2100 1450
	1    0    0    -1  
$EndComp
NoConn ~ 1650 1550
$Comp
L Earth #PWR08
U 1 1 59B420DC
P 8400 4550
F 0 "#PWR08" H 8400 4300 50  0001 C CNN
F 1 "Earth" H 8400 4400 50  0001 C CNN
F 2 "" H 8400 4550 50  0001 C CNN
F 3 "" H 8400 4550 50  0001 C CNN
	1    8400 4550
	1    0    0    -1  
$EndComp
Text Label 1400 1350 0    40   ~ 0
SUP_CLEAN
Text Label 1050 1800 0    40   ~ 0
RP_PROTECTION
$Comp
L C_Small C5
U 1 1 59B6DBF2
P 3550 5600
F 0 "C5" H 3560 5670 50  0000 L CNN
F 1 "1uF" H 3560 5520 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3550 5600 50  0001 C CNN
F 3 "" H 3550 5600 50  0001 C CNN
	1    3550 5600
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR09
U 1 1 59B6DC4B
P 3550 5800
F 0 "#PWR09" H 3550 5550 50  0001 C CNN
F 1 "Earth" H 3550 5650 50  0001 C CNN
F 2 "" H 3550 5800 50  0001 C CNN
F 3 "" H 3550 5800 50  0001 C CNN
	1    3550 5800
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 59B6EA7A
P 1350 950
F 0 "C1" H 1375 1050 50  0000 L CNN
F 1 "330uF" H 1375 850 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D8.0mm_P3.80mm" H 1350 950 50  0001 C CNN
F 3 "" H 1350 950 50  0001 C CNN
	1    1350 950 
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR010
U 1 1 59B6EDC9
P 1600 800
F 0 "#PWR010" H 1600 550 50  0001 C CNN
F 1 "Earth" H 1600 650 50  0001 C CNN
F 2 "" H 1600 800 50  0001 C CNN
F 3 "" H 1600 800 50  0001 C CNN
	1    1600 800 
	1    0    0    -1  
$EndComp
$Comp
L Micro_SD_Card_Det1 J9
U 1 1 5A00BEEF
P 5900 6450
F 0 "J9" H 5250 7150 50  0000 C CNN
F 1 "SDCARD_READER" H 6550 7150 50  0000 R CNN
F 2 "Ked Tracker:SDCARD_BOMB" H 7950 7150 50  0001 C CNN
F 3 "" H 5900 6550 50  0001 C CNN
	1    5900 6450
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR011
U 1 1 5A00C4B3
P 4900 7100
F 0 "#PWR011" H 4900 6850 50  0001 C CNN
F 1 "Earth" H 4900 6950 50  0001 C CNN
F 2 "" H 4900 7100 50  0001 C CNN
F 3 "" H 4900 7100 50  0001 C CNN
	1    4900 7100
	1    0    0    -1  
$EndComp
Text GLabel 4900 5400 1    40   Input ~ 0
3.3V
$Comp
L Earth #PWR012
U 1 1 5A00D319
P 5400 5550
F 0 "#PWR012" H 5400 5300 50  0001 C CNN
F 1 "Earth" H 5400 5400 50  0001 C CNN
F 2 "" H 5400 5550 50  0001 C CNN
F 3 "" H 5400 5550 50  0001 C CNN
	1    5400 5550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 5A00D363
P 5200 5500
F 0 "C7" H 5210 5570 50  0000 L CNN
F 1 "100nF" H 5210 5420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5200 5500 50  0001 C CNN
F 3 "" H 5200 5500 50  0001 C CNN
	1    5200 5500
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R6
U 1 1 5A00D98C
P 4800 5800
F 0 "R6" H 4800 5900 50  0000 L CNN
F 1 "10K" V 4800 5750 40  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4800 5800 50  0001 C CNN
F 3 "" H 4800 5800 50  0001 C CNN
	1    4800 5800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R5
U 1 1 5A00D9E3
P 4700 5800
F 0 "R5" H 4700 5900 50  0000 L CNN
F 1 "10K" V 4700 5750 40  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4700 5800 50  0001 C CNN
F 3 "" H 4700 5800 50  0001 C CNN
	1    4700 5800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R4
U 1 1 5A00DF44
P 4600 5800
F 0 "R4" H 4600 5900 50  0000 L CNN
F 1 "10K" V 4600 5750 40  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4600 5800 50  0001 C CNN
F 3 "" H 4600 5800 50  0001 C CNN
	1    4600 5800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R7
U 1 1 5A01235A
P 8050 5550
F 0 "R7" V 7950 5500 50  0000 L CNN
F 1 "820" V 8050 5500 40  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 8050 5550 50  0001 C CNN
F 3 "" H 8050 5550 50  0001 C CNN
	1    8050 5550
	0    1    1    0   
$EndComp
$Comp
L LED LED3
U 1 1 5A0123E3
P 7700 5550
F 0 "LED3" H 7700 5650 50  0000 C CNN
F 1 "BLUE" H 7700 5450 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 7700 5550 50  0001 C CNN
F 3 "" H 7700 5550 50  0001 C CNN
	1    7700 5550
	1    0    0    -1  
$EndComp
$Comp
L Speaker LS1
U 1 1 5A013A83
P 1950 6500
F 0 "LS1" H 2000 6725 50  0000 R CNN
F 1 "BUZZER" H 2000 6650 50  0000 R CNN
F 2 "Buzzers_Beepers:Buzzer_12x9.5RM7.6" H 1950 6300 50  0001 C CNN
F 3 "" H 1940 6450 50  0001 C CNN
	1    1950 6500
	-1   0    0    1   
$EndComp
Text Label 2500 6400 2    40   ~ 0
BUZ_OUT
Text Label 2300 6500 0    40   ~ 0
BUZ_IN
$Comp
L Earth #PWR013
U 1 1 5A023604
P 3400 1850
F 0 "#PWR013" H 3400 1600 50  0001 C CNN
F 1 "Earth" H 3400 1700 50  0001 C CNN
F 2 "" H 3400 1850 50  0001 C CNN
F 3 "" H 3400 1850 50  0001 C CNN
	1    3400 1850
	1    0    0    -1  
$EndComp
Text GLabel 4250 1450 2    40   Input ~ 0
3.3V
$Comp
L C_Small C6
U 1 1 5A02380C
P 3750 1650
F 0 "C6" H 3760 1720 50  0000 L CNN
F 1 "47uF" H 3760 1570 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210" H 3750 1650 50  0001 C CNN
F 3 "" H 3750 1650 50  0001 C CNN
	1    3750 1650
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR014
U 1 1 5A023990
P 3750 1850
F 0 "#PWR014" H 3750 1600 50  0001 C CNN
F 1 "Earth" H 3750 1700 50  0001 C CNN
F 2 "" H 3750 1850 50  0001 C CNN
F 3 "" H 3750 1850 50  0001 C CNN
	1    3750 1850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 5A024206
P 3000 1650
F 0 "C3" H 3010 1720 50  0000 L CNN
F 1 "1uF" H 3010 1570 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3000 1650 50  0001 C CNN
F 3 "" H 3000 1650 50  0001 C CNN
	1    3000 1650
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR015
U 1 1 5A0243BD
P 3000 1850
F 0 "#PWR015" H 3000 1600 50  0001 C CNN
F 1 "Earth" H 3000 1700 50  0001 C CNN
F 2 "" H 3000 1850 50  0001 C CNN
F 3 "" H 3000 1850 50  0001 C CNN
	1    3000 1850
	1    0    0    -1  
$EndComp
$Comp
L LM2936-3.3 U1
U 1 1 5A02514F
P 3400 1450
F 0 "U1" H 3250 1575 50  0000 C CNN
F 1 "LM3940" H 3400 1575 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3Lead_TabPin2" H 3400 1675 50  0001 C CIN
F 3 "" H 3400 1400 50  0001 C CNN
	1    3400 1450
	1    0    0    -1  
$EndComp
$Comp
L Polyfuse_Small F1
U 1 1 5A148D8E
P 850 1100
F 0 "F1" V 775 1100 50  0000 C CNN
F 1 "0.2A" V 925 1100 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuse_SMD1206_Reflow" H 900 900 50  0001 L CNN
F 3 "" H 850 1100 50  0001 C CNN
	1    850  1100
	1    0    0    -1  
$EndComp
$Comp
L Polyfuse_Small F2
U 1 1 5A1493BC
P 2800 1450
F 0 "F2" V 2725 1450 50  0000 C CNN
F 1 "0.5A" V 2875 1450 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuse_SMD1206_Reflow" H 2850 1250 50  0001 L CNN
F 3 "" H 2800 1450 50  0001 C CNN
	1    2800 1450
	0    -1   -1   0   
$EndComp
Text Label 900  1350 0    40   ~ 0
SUP_PROT
Text Label 2900 1450 0    40   ~ 0
5V_PROT
Text Label 1950 3000 1    40   ~ 0
5V_PROT
$Comp
L STM32F103 MCU1
U 1 1 5A19EA8C
P 6050 2950
F 0 "MCU1" H 5200 4000 60  0000 C CNN
F 1 "STM32F103" H 6100 2950 60  0000 C CNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 6050 2950 60  0001 C CNN
F 3 "" H 6050 2950 60  0001 C CNN
	1    6050 2950
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR016
U 1 1 5A19EFEA
P 5700 4400
F 0 "#PWR016" H 5700 4150 50  0001 C CNN
F 1 "Earth" H 5700 4250 50  0001 C CNN
F 2 "" H 5700 4400 50  0001 C CNN
F 3 "" H 5700 4400 50  0001 C CNN
	1    5700 4400
	1    0    0    -1  
$EndComp
NoConn ~ 5500 1800
$Comp
L C_Small C8
U 1 1 5A19F5C9
P 4900 1700
F 0 "C8" V 5000 1600 50  0000 L CNN
F 1 "100nF" V 4800 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4900 1700 50  0001 C CNN
F 3 "" H 4900 1700 50  0001 C CNN
	1    4900 1700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 5A19F728
P 5500 1250
F 0 "C9" V 5550 1300 50  0000 L CNN
F 1 "100nF" V 5450 1300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5500 1250 50  0001 C CNN
F 3 "" H 5500 1250 50  0001 C CNN
	1    5500 1250
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 5A19F793
P 5700 1250
F 0 "C10" V 5750 1300 50  0000 L CNN
F 1 "100nF" V 5650 1300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5700 1250 50  0001 C CNN
F 3 "" H 5700 1250 50  0001 C CNN
	1    5700 1250
	1    0    0    -1  
$EndComp
$Comp
L C_Small C11
U 1 1 5A19F806
P 5900 1250
F 0 "C11" V 5950 1300 50  0000 L CNN
F 1 "100nF" V 5850 1300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5900 1250 50  0001 C CNN
F 3 "" H 5900 1250 50  0001 C CNN
	1    5900 1250
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR017
U 1 1 5A1A0E87
P 5350 1000
F 0 "#PWR017" H 5350 750 50  0001 C CNN
F 1 "Earth" H 5350 850 50  0001 C CNN
F 2 "" H 5350 1000 50  0001 C CNN
F 3 "" H 5350 1000 50  0001 C CNN
	1    5350 1000
	1    0    0    -1  
$EndComp
Text Label 6200 1750 1    40   ~ 0
RESET
$Comp
L CONN_01X04 J2
U 1 1 5A1A3ABC
P 10000 1400
F 0 "J2" H 10000 1650 50  0000 C CNN
F 1 "SWD" V 10100 1400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 10000 1400 50  0001 C CNN
F 3 "" H 10000 1400 50  0001 C CNN
	1    10000 1400
	-1   0    0    -1  
$EndComp
$Comp
L C_Small C18
U 1 1 5A1A3FEA
P 10700 1400
F 0 "C18" H 10710 1470 50  0000 L CNN
F 1 "100nF" H 10710 1320 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10700 1400 50  0001 C CNN
F 3 "" H 10700 1400 50  0001 C CNN
	1    10700 1400
	1    0    0    -1  
$EndComp
Text GLabel 5350 1450 0    40   Input ~ 0
3.3V
Text GLabel 10700 1150 1    40   Input ~ 0
3.3V
Text Label 10200 1350 0    40   ~ 0
SWDIO
Text Label 10200 1450 0    40   ~ 0
SWDCLK
Text Label 6500 1750 1    40   ~ 0
SWDIO
Text Label 6600 1750 1    40   ~ 0
SWDCLK
$Comp
L SW_Push SW1
U 1 1 5A1A719B
P 9050 1350
F 0 "SW1" H 9100 1450 50  0000 L CNN
F 1 "RESET" H 9050 1290 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_REED_CT05-XXXX-G1" H 9050 1550 50  0001 C CNN
F 3 "" H 9050 1550 50  0001 C CNN
	1    9050 1350
	0    -1   -1   0   
$EndComp
$Comp
L Earth #PWR018
U 1 1 5A1A7425
P 9400 1650
F 0 "#PWR018" H 9400 1400 50  0001 C CNN
F 1 "Earth" H 9400 1500 50  0001 C CNN
F 2 "" H 9400 1650 50  0001 C CNN
F 3 "" H 9400 1650 50  0001 C CNN
	1    9400 1650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C17
U 1 1 5A1A751B
P 9400 1350
F 0 "C17" H 9410 1420 50  0000 L CNN
F 1 "1uF" H 9410 1270 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 9400 1350 50  0001 C CNN
F 3 "" H 9400 1350 50  0001 C CNN
	1    9400 1350
	1    0    0    -1  
$EndComp
$Comp
L R_Small R11
U 1 1 5A1A7841
P 9400 1000
F 0 "R11" H 9430 1020 50  0000 L CNN
F 1 "10K" H 9430 960 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 9400 1000 50  0001 C CNN
F 3 "" H 9400 1000 50  0001 C CNN
	1    9400 1000
	1    0    0    -1  
$EndComp
Text GLabel 9400 800  1    40   Input ~ 0
3.3V
Text Label 9100 1150 0    40   ~ 0
RESET
Text Label 6300 1750 1    40   ~ 0
OSCOUT
Text Label 6400 1750 1    40   ~ 0
OSCIN
Text Label 6500 4450 1    40   ~ 0
RTCIN
Text Label 6600 4450 1    40   ~ 0
RTCOUT
$Comp
L Crystal_Small Y2
U 1 1 5A1A98FB
P 8050 1300
F 0 "Y2" H 8050 1400 50  0000 C CNN
F 1 "8M" H 8050 1200 50  0000 C CNN
F 2 "Crystals:Crystal_SMD_HC49-SD" H 8050 1300 50  0001 C CNN
F 3 "" H 8050 1300 50  0001 C CNN
	1    8050 1300
	0    1    1    0   
$EndComp
$Comp
L R_Small R8
U 1 1 5A1A9CF5
P 8350 1300
F 0 "R8" H 8380 1320 50  0000 L CNN
F 1 "1M" H 8380 1260 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 8350 1300 50  0001 C CNN
F 3 "" H 8350 1300 50  0001 C CNN
	1    8350 1300
	1    0    0    -1  
$EndComp
$Comp
L C_Small C14
U 1 1 5A1AA183
P 7750 1150
F 0 "C14" H 7760 1220 50  0000 L CNN
F 1 "22pF" H 7760 1070 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7750 1150 50  0001 C CNN
F 3 "" H 7750 1150 50  0001 C CNN
	1    7750 1150
	0    1    1    0   
$EndComp
$Comp
L C_Small C15
U 1 1 5A1AA224
P 7750 1450
F 0 "C15" H 7760 1520 50  0000 L CNN
F 1 "22pF" H 7760 1370 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7750 1450 50  0001 C CNN
F 3 "" H 7750 1450 50  0001 C CNN
	1    7750 1450
	0    1    1    0   
$EndComp
Text Label 8400 1450 0    40   ~ 0
OSCOUT
Text Label 8400 1150 0    40   ~ 0
OSCIN
Text Label 6000 1600 1    40   ~ 0
BOOT0
Text Label 6100 1750 1    40   ~ 0
BOOT1
Text Label 6400 4450 1    40   ~ 0
STAT_LED
$Comp
L R_Small R2
U 1 1 5A1AE2A3
P 2350 7450
F 0 "R2" H 2380 7470 50  0000 L CNN
F 1 "520" H 2380 7410 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 2350 7450 50  0001 C CNN
F 3 "" H 2350 7450 50  0001 C CNN
	1    2350 7450
	0    1    1    0   
$EndComp
$Comp
L LED_Small LED2
U 1 1 5A1AE342
P 1850 7450
F 0 "LED2" H 1800 7575 50  0000 L CNN
F 1 "YELLOW" H 1700 7350 50  0000 L CNN
F 2 "LEDs:LED_0603" V 1850 7450 50  0001 C CNN
F 3 "" V 1850 7450 50  0001 C CNN
	1    1850 7450
	-1   0    0    1   
$EndComp
$Comp
L LED_Small LED1
U 1 1 5A1AE523
P 1850 7100
F 0 "LED1" H 1800 7225 50  0000 L CNN
F 1 "GREEN" H 1750 7000 50  0000 L CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" V 1850 7100 50  0001 C CNN
F 3 "" V 1850 7100 50  0001 C CNN
	1    1850 7100
	-1   0    0    1   
$EndComp
$Comp
L R_Small R1
U 1 1 5A1AEAEE
P 2350 7100
F 0 "R1" H 2380 7120 50  0000 L CNN
F 1 "100" H 2380 7060 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 2350 7100 50  0001 C CNN
F 3 "" H 2350 7100 50  0001 C CNN
	1    2350 7100
	0    1    1    0   
$EndComp
$Comp
L LED_Small LED5
U 1 1 5A1AF5A5
P 4100 1850
F 0 "LED5" H 4050 1975 50  0000 L CNN
F 1 "RED" H 4000 1750 50  0000 L CNN
F 2 "LEDs:LED_0603" V 4100 1850 50  0001 C CNN
F 3 "" V 4100 1850 50  0001 C CNN
	1    4100 1850
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R3
U 1 1 5A1AF662
P 4100 1600
F 0 "R3" H 4130 1620 50  0000 L CNN
F 1 "520" H 4130 1560 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4100 1600 50  0001 C CNN
F 3 "" H 4100 1600 50  0001 C CNN
	1    4100 1600
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR019
U 1 1 5A1B01CE
P 4100 2050
F 0 "#PWR019" H 4100 1800 50  0001 C CNN
F 1 "Earth" H 4100 1900 50  0001 C CNN
F 2 "" H 4100 2050 50  0001 C CNN
F 3 "" H 4100 2050 50  0001 C CNN
	1    4100 2050
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR020
U 1 1 5A1B2252
P 1650 2500
F 0 "#PWR020" H 1650 2250 50  0001 C CNN
F 1 "Earth" H 1650 2350 50  0001 C CNN
F 2 "" H 1650 2500 50  0001 C CNN
F 3 "" H 1650 2500 50  0001 C CNN
	1    1650 2500
	-1   0    0    1   
$EndComp
NoConn ~ 2350 4700
Text Label 2050 4800 0    40   ~ 0
SPI_SELECT
Text Label 2050 4900 0    40   ~ 0
SPI_MOSI
Text Label 2050 5000 0    40   ~ 0
SPI_MISO
Text Label 2050 5100 0    40   ~ 0
SPI_CLOCK
Text Label 3150 4700 0    40   ~ 0
RF_RESET
Text Label 3150 4800 0    40   ~ 0
RF_IRQ
Text Label 3150 5300 0    40   ~ 0
RF_AUXSTAT
Text Label 7250 2800 0    40   ~ 0
RF_RESET
Text Label 7250 2700 0    40   ~ 0
RF_IRQ
Text Label 7250 2600 0    40   ~ 0
RF_AUXSTAT
NoConn ~ 3100 4900
NoConn ~ 3100 5000
NoConn ~ 3100 5100
NoConn ~ 3100 5200
Text Label 7250 3100 0    40   ~ 0
BUZ_OUT
Text Label 7250 3200 0    40   ~ 0
BUZ_IN
Text Label 4200 6150 0    40   ~ 0
SD_CS
Text Label 4200 6250 0    40   ~ 0
SD_MOSI
Text Label 4200 6450 0    40   ~ 0
SD_SCK
Text Label 4200 6650 0    40   ~ 0
SD_MISO
Text Label 7250 3500 0    40   ~ 0
SD_CS
Text Label 7250 3600 0    40   ~ 0
SD_SCK
Text Label 7250 3700 0    40   ~ 0
SD_MISO
Text Label 7250 3800 0    40   ~ 0
SD_MOSI
Text Label 7950 5750 0    40   ~ 0
CON1_RXD
Text Label 7950 5900 0    40   ~ 0
CON1_TXD
Text Label 4450 3300 0    40   ~ 0
CON1_TXD
Text Label 4450 3400 0    40   ~ 0
CON1_RXD
Text Label 9100 5000 1    40   ~ 0
BARO_SDA
Text Label 9000 5000 1    40   ~ 0
BARO_SCL
Text Label 7250 2900 0    40   ~ 0
BARO_SCL
Text Label 7250 3000 0    40   ~ 0
BARO_SDA
Text Label 1550 3000 1    40   ~ 0
GPS_ENABLE
Text Label 1750 3000 1    40   ~ 0
GPS_TXD
Text Label 1850 3000 1    40   ~ 0
GPS_RXD
Text Label 2050 3000 1    40   ~ 0
GPS_PPS
NoConn ~ 7200 3400
NoConn ~ 7200 3300
NoConn ~ 7200 2400
NoConn ~ 7200 2500
NoConn ~ 4900 3200
NoConn ~ 4900 3700
$Comp
L Earth #PWR021
U 1 1 5A1C547E
P 6750 7000
F 0 "#PWR021" H 6750 6750 50  0001 C CNN
F 1 "Earth" H 6750 6850 50  0001 C CNN
F 2 "" H 6750 7000 50  0001 C CNN
F 3 "" H 6750 7000 50  0001 C CNN
	1    6750 7000
	1    0    0    -1  
$EndComp
NoConn ~ 5000 6850
NoConn ~ 5000 6750
NoConn ~ 5000 6050
$Comp
L CONN_01X02 J3
U 1 1 5A2F0786
P 10700 2350
F 0 "J3" H 10700 2500 50  0000 C CNN
F 1 "BOOT" V 10800 2350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x01_Pitch2.54mm" H 10700 2350 50  0001 C CNN
F 3 "" H 10700 2350 50  0001 C CNN
	1    10700 2350
	1    0    0    -1  
$EndComp
Text Label 9950 2400 0    40   ~ 0
BOOT0
$Comp
L R_Small R13
U 1 1 5A2F0AA3
P 10450 2550
F 0 "R13" H 10480 2570 50  0000 L CNN
F 1 "10K" H 10480 2510 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 10450 2550 50  0001 C CNN
F 3 "" H 10450 2550 50  0001 C CNN
	1    10450 2550
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR022
U 1 1 5A2F0D34
P 10450 2750
F 0 "#PWR022" H 10450 2500 50  0001 C CNN
F 1 "Earth" H 10450 2600 50  0001 C CNN
F 2 "" H 10450 2750 50  0001 C CNN
F 3 "" H 10450 2750 50  0001 C CNN
	1    10450 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5700 3200 5800
Connection ~ 3200 5400
Wire Wire Line
	1550 5550 1650 5550
Wire Wire Line
	1550 5300 1550 5550
Wire Wire Line
	2350 5300 1550 5300
Wire Wire Line
	3200 5400 3200 5500
Wire Wire Line
	3100 5400 3700 5400
Wire Wire Line
	1950 2400 1950 3000
Connection ~ 2250 5400
Wire Wire Line
	2350 5400 2250 5400
Wire Wire Line
	2250 5200 2250 5500
Wire Wire Line
	2350 5200 2250 5200
Wire Wire Line
	1650 2500 1650 3000
Wire Wire Line
	1550 7100 1750 7100
Wire Wire Line
	1950 7100 2250 7100
Wire Wire Line
	2450 7100 2850 7100
Wire Wire Line
	8800 4350 8800 4600
Wire Wire Line
	8800 4450 8700 4450
Wire Wire Line
	8500 4450 8400 4450
Wire Wire Line
	9000 4350 9000 5000
Wire Wire Line
	9100 4350 9100 5000
Wire Wire Line
	9550 4650 9450 4650
Wire Wire Line
	9550 4450 9550 4650
Wire Wire Line
	9550 4450 9450 4450
Wire Wire Line
	9550 4550 9650 4550
Connection ~ 9550 4550
Wire Wire Line
	2100 1750 2100 1850
Connection ~ 2100 1800
Wire Wire Line
	850  1800 2100 1800
Connection ~ 8800 4450
Wire Wire Line
	8400 4450 8400 4550
Wire Wire Line
	850  1800 850  1750
Wire Wire Line
	850  1200 850  1450
Wire Wire Line
	850  1350 1000 1350
Wire Wire Line
	1300 1350 1650 1350
Connection ~ 850  1350
Wire Wire Line
	3550 5500 3550 5400
Connection ~ 3550 5400
Wire Wire Line
	3550 5800 3550 5700
Wire Wire Line
	1350 1100 1350 1350
Connection ~ 1350 1350
Wire Wire Line
	1350 800  1350 700 
Wire Wire Line
	1350 700  1600 700 
Wire Wire Line
	1600 700  1600 800 
Wire Wire Line
	4150 6250 5000 6250
Wire Wire Line
	5000 6550 4900 6550
Wire Wire Line
	4900 6550 4900 7100
Wire Wire Line
	4900 6350 5000 6350
Wire Wire Line
	4900 5400 4900 6350
Wire Wire Line
	4150 6450 5000 6450
Wire Wire Line
	4150 6150 5000 6150
Wire Wire Line
	4150 6650 5000 6650
Wire Wire Line
	5300 5500 5400 5500
Wire Wire Line
	5400 5500 5400 5550
Wire Wire Line
	4600 5500 5100 5500
Connection ~ 4900 5500
Wire Wire Line
	4700 5700 4700 5500
Wire Wire Line
	4800 5700 4800 5500
Connection ~ 4800 5500
Wire Wire Line
	4800 5900 4800 6150
Connection ~ 4800 6150
Wire Wire Line
	4700 5900 4700 6250
Connection ~ 4700 6250
Wire Wire Line
	4600 5900 4600 6450
Connection ~ 4600 6450
Wire Wire Line
	4600 5700 4600 5500
Connection ~ 4700 5500
Wire Wire Line
	7900 5750 8300 5750
Wire Wire Line
	7900 5900 8300 5900
Wire Wire Line
	8300 5550 8150 5550
Wire Wire Line
	7950 5550 7850 5550
Wire Wire Line
	7550 5550 7400 5550
Wire Wire Line
	2550 6500 2150 6500
Wire Wire Line
	2550 6400 2150 6400
Wire Wire Line
	2550 1450 2700 1450
Wire Wire Line
	3400 1750 3400 1850
Wire Wire Line
	3700 1450 4250 1450
Wire Wire Line
	3750 1450 3750 1550
Connection ~ 3750 1450
Wire Wire Line
	3750 1750 3750 1850
Wire Wire Line
	3000 1750 3000 1850
Connection ~ 2650 1450
Wire Wire Line
	850  900  850  1000
Wire Wire Line
	2900 1450 3100 1450
Wire Wire Line
	3000 1550 3000 1450
Connection ~ 3000 1450
Wire Wire Line
	2650 1200 2650 1450
Wire Wire Line
	5700 4200 5700 4400
Wire Wire Line
	5350 850  5350 1000
Wire Wire Line
	5900 1350 5900 1800
Wire Wire Line
	5350 850  5900 850 
Wire Wire Line
	5500 850  5500 1150
Wire Wire Line
	5700 850  5700 1150
Connection ~ 5500 850 
Wire Wire Line
	5900 850  5900 1150
Connection ~ 5700 850 
Wire Wire Line
	6200 1800 6200 1550
Wire Wire Line
	10200 1350 10500 1350
Wire Wire Line
	10200 1450 10500 1450
Wire Wire Line
	10200 1250 10700 1250
Wire Wire Line
	10700 1150 10700 1300
Wire Wire Line
	10200 1550 10700 1550
Wire Wire Line
	10700 1500 10700 1650
Connection ~ 10700 1550
Wire Wire Line
	5350 1450 5900 1450
Connection ~ 5900 1450
Wire Wire Line
	5700 1350 5700 1800
Connection ~ 5700 1450
Wire Wire Line
	5800 1450 5800 1800
Connection ~ 5800 1450
Connection ~ 5500 1450
Wire Wire Line
	5500 1350 5500 1450
Connection ~ 10700 1250
Wire Wire Line
	6500 1800 6500 1550
Wire Wire Line
	6600 1800 6600 1550
Wire Wire Line
	9050 1150 9400 1150
Wire Wire Line
	9050 1550 9400 1550
Wire Wire Line
	9400 1450 9400 1650
Wire Wire Line
	9400 1100 9400 1250
Connection ~ 9400 1550
Connection ~ 9400 1150
Wire Wire Line
	9400 800  9400 900 
Wire Wire Line
	6300 1800 6300 1550
Wire Wire Line
	6400 1800 6400 1550
Wire Wire Line
	6500 4200 6500 4500
Wire Wire Line
	6600 4200 6600 4500
Wire Wire Line
	8050 1200 8050 1150
Wire Wire Line
	7850 1150 8600 1150
Wire Wire Line
	8350 1200 8350 1150
Connection ~ 8350 1150
Wire Wire Line
	8050 1400 8050 1450
Wire Wire Line
	7850 1450 8600 1450
Wire Wire Line
	8350 1400 8350 1450
Connection ~ 8350 1450
Wire Wire Line
	7650 1150 7550 1150
Connection ~ 7550 1150
Wire Wire Line
	7650 1450 7550 1450
Connection ~ 7550 1450
Connection ~ 8050 1450
Connection ~ 8050 1150
Wire Wire Line
	6100 1800 6100 1550
Wire Wire Line
	6000 1800 6000 1550
Wire Wire Line
	6400 4200 6400 4500
Wire Wire Line
	2250 7450 1950 7450
Wire Wire Line
	1750 7450 1600 7450
Wire Wire Line
	1600 7450 1600 7100
Connection ~ 1600 7100
Wire Wire Line
	2450 7450 2550 7450
Wire Wire Line
	2550 7450 2550 7100
Connection ~ 2550 7100
Wire Wire Line
	4100 1700 4100 1750
Wire Wire Line
	4100 1500 4100 1450
Connection ~ 4100 1450
Wire Wire Line
	4100 1950 4100 2050
Wire Wire Line
	4900 2400 4400 2400
Wire Wire Line
	4400 2500 4900 2500
Wire Wire Line
	4900 2600 4400 2600
Wire Wire Line
	4900 2700 4400 2700
Wire Wire Line
	4900 3100 4400 3100
Wire Wire Line
	2000 4900 2350 4900
Wire Wire Line
	2000 5000 2350 5000
Wire Wire Line
	4400 3000 4900 3000
Wire Wire Line
	2350 5100 2000 5100
Wire Wire Line
	4400 2900 4900 2900
Wire Wire Line
	2000 4800 2350 4800
Wire Wire Line
	4900 2800 4400 2800
Wire Wire Line
	3100 4700 3550 4700
Wire Wire Line
	3100 4800 3550 4800
Wire Wire Line
	3100 5300 3550 5300
Wire Wire Line
	7200 2800 7700 2800
Wire Wire Line
	7200 2700 7700 2700
Wire Wire Line
	7200 2600 7700 2600
Wire Wire Line
	7200 3200 7700 3200
Wire Wire Line
	7200 3100 7700 3100
Wire Wire Line
	7200 3500 7700 3500
Wire Wire Line
	7200 3600 7700 3600
Wire Wire Line
	7200 3700 7700 3700
Wire Wire Line
	7200 3800 7700 3800
Wire Wire Line
	4900 3300 4400 3300
Wire Wire Line
	4900 3400 4400 3400
Wire Wire Line
	9150 4650 9000 4650
Connection ~ 9000 4650
Wire Wire Line
	9150 4450 9100 4450
Connection ~ 9100 4450
Wire Wire Line
	7200 2900 7700 2900
Wire Wire Line
	7200 3000 7700 3000
Wire Wire Line
	2050 3000 2050 2600
Wire Wire Line
	1850 3000 1850 2600
Wire Wire Line
	1750 3000 1750 2600
Wire Wire Line
	1550 2600 1550 3000
Wire Wire Line
	2200 2450 2200 2400
Wire Wire Line
	2200 2400 1950 2400
Wire Wire Line
	5900 4250 5900 4200
Connection ~ 5700 4250
Wire Wire Line
	5800 4200 5800 4250
Connection ~ 5800 4250
Wire Wire Line
	6700 6950 6750 6950
Wire Wire Line
	6750 6950 6750 7000
Wire Wire Line
	7550 1150 7550 1550
Wire Wire Line
	10350 2400 10500 2400
Wire Wire Line
	10450 2450 10450 2400
Connection ~ 10450 2400
Wire Wire Line
	10450 2650 10450 2750
Wire Wire Line
	10500 2300 10450 2300
Wire Wire Line
	10450 2300 10450 2200
Text GLabel 10450 2200 1    40   Input ~ 0
3.3V
$Comp
L R_Small R12
U 1 1 5A2F121B
P 10250 2400
F 0 "R12" H 10280 2420 50  0000 L CNN
F 1 "10K" H 10280 2360 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 10250 2400 50  0001 C CNN
F 3 "" H 10250 2400 50  0001 C CNN
	1    10250 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	10150 2400 9950 2400
NoConn ~ 4900 3500
NoConn ~ 4900 3600
$Sheet
S 8300 5400 1200 950 
U 59FF7E7B
F0 "Console" 60
F1 "console.sch" 60
F2 "CON_INPUT" O L 8300 5750 60 
F3 "CON_OUTPUT" I L 8300 5900 60 
F4 "BT_PAIRED" O L 8300 5550 60 
$EndSheet
Wire Wire Line
	5600 4200 5600 4500
$Comp
L Earth_Protective #PWR023
U 1 1 5A304E47
P 5600 4500
F 0 "#PWR023" H 5850 4250 50  0001 C CNN
F 1 "Earth_Protective" H 6050 4350 50  0001 C CNN
F 2 "" H 5600 4400 50  0001 C CNN
F 3 "" H 5600 4400 50  0001 C CNN
	1    5600 4500
	1    0    0    -1  
$EndComp
$Comp
L Earth_Protective #PWR024
U 1 1 5A3051F7
P 7550 1550
F 0 "#PWR024" H 7800 1300 50  0001 C CNN
F 1 "Earth_Protective" H 8000 1400 50  0001 C CNN
F 2 "" H 7550 1450 50  0001 C CNN
F 3 "" H 7550 1450 50  0001 C CNN
	1    7550 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4250 5900 4250
$Comp
L Earth #PWR025
U 1 1 5A3090AA
P 10700 1650
F 0 "#PWR025" H 10700 1400 50  0001 C CNN
F 1 "Earth" H 10700 1500 50  0001 C CNN
F 2 "" H 10700 1650 50  0001 C CNN
F 3 "" H 10700 1650 50  0001 C CNN
	1    10700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1550 5600 1800
Wire Wire Line
	4900 1550 5600 1550
Wire Wire Line
	4900 1550 4900 1600
Text GLabel 4900 1550 0    40   Input ~ 0
3.3V
$Comp
L Earth #PWR026
U 1 1 5A3180D8
P 4900 1850
F 0 "#PWR026" H 4900 1600 50  0001 C CNN
F 1 "Earth" H 4900 1700 50  0001 C CNN
F 2 "" H 4900 1850 50  0001 C CNN
F 3 "" H 4900 1850 50  0001 C CNN
	1    4900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1800 4900 1850
$Comp
L Earth_Protective #PWR027
U 1 1 5A31B6EF
P 6600 4500
F 0 "#PWR027" H 6850 4250 50  0001 C CNN
F 1 "Earth_Protective" H 7050 4350 50  0001 C CNN
F 2 "" H 6600 4400 50  0001 C CNN
F 3 "" H 6600 4400 50  0001 C CNN
	1    6600 4500
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 5A76FDB7
P 7400 5650
F 0 "#PWR?" H 7400 5400 50  0001 C CNN
F 1 "Earth" H 7400 5500 50  0001 C CNN
F 2 "" H 7400 5650 50  0001 C CNN
F 3 "" H 7400 5650 50  0001 C CNN
	1    7400 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 5550 7400 5650
$EndSCHEMATC
