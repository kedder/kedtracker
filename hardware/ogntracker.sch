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
LIBS:ogntracker
LIBS:ogntracker-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L STM32DEVBOARD U1
U 1 1 59822FEC
P 5500 3350
F 0 "U1" H 5200 4050 60  0000 L CNN
F 1 "STM32DEVBOARD" H 5500 1750 60  0000 C CNN
F 2 "OGN Tracker:STM32DEVBOARD" H 5375 2900 60  0001 C CNN
F 3 "" H 5375 2900 60  0001 C CNN
	1    5500 3350
	1    0    0    -1  
$EndComp
Text GLabel 6550 3050 1    60   Input ~ 0
5V
$Comp
L RFM69HW U2
U 1 1 598223BD
P 5450 5650
F 0 "U2" H 5100 6300 60  0000 L CNN
F 1 "RFM69HW" H 5450 5200 60  0000 C CNN
F 2 "OGN Tracker:RFM69HW" H 5450 5650 60  0001 C CNN
F 3 "" H 5450 5650 60  0001 C CNN
	1    5450 5650
	-1   0    0    1   
$EndComp
Text GLabel 6300 6100 2    60   Input ~ 0
3.3V
Text Label 4450 4300 1    40   ~ 0
SPI_MOSI
Text Label 4350 4300 1    40   ~ 0
SPI_MISO
Text Label 4250 4300 1    40   ~ 0
SPI_CLOCK
Text Label 4150 4300 1    40   ~ 0
SPI_SELECT
Text Label 6250 5200 1    40   ~ 0
CHIP_RESET
Text Label 6150 5200 1    40   ~ 0
INT_REQ
Text Label 6050 5200 1    40   ~ 0
AUX_STATUS
$Comp
L VK2828U7G5LF U3
U 1 1 59822930
P 3200 4350
F 0 "U3" H 2750 4850 40  0000 L CNN
F 1 "VK2828U7G5LF" H 3200 4100 40  0000 C CNN
F 2 "OGN Tracker:Molex_PicoBlade_53047-0610_06x1.25mm_Straight" H 3650 4550 40  0001 C CNN
F 3 "" H 3650 4550 40  0001 C CNN
	1    3200 4350
	1    0    0    -1  
$EndComp
Text GLabel 3350 3800 1    60   Input ~ 0
5V
Text Label 3850 3550 0    40   ~ 0
GPS_RXD
Text Label 3850 3450 0    40   ~ 0
GPS_TXD
Text Label 3850 3350 0    40   ~ 0
GPS_PPS
Text Label 3850 3250 0    40   ~ 0
GPS_ENABLE
$Comp
L LED D1
U 1 1 59822D69
P 4350 2950
F 0 "D1" H 4350 3050 50  0000 C CNN
F 1 "LED" H 4350 2850 50  0000 C CNN
F 2 "OGN Tracker:Molex_PicoBlade_53047-0210_02x1.25mm_Straight" H 4350 2950 50  0001 C CNN
F 3 "" H 4350 2950 50  0001 C CNN
	1    4350 2950
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 59822DD1
P 4800 2950
F 0 "R1" V 4880 2950 50  0000 C CNN
F 1 "R" V 4800 2950 50  0000 C CNN
F 2 "OGN Tracker:Resistor_Horizontal_RM7mm" V 4730 2950 50  0001 C CNN
F 3 "" H 4800 2950 50  0001 C CNN
	1    4800 2950
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR01
U 1 1 59824B64
P 5000 4900
F 0 "#PWR01" H 5000 4650 50  0001 C CNN
F 1 "Earth" H 5000 4750 50  0001 C CNN
F 2 "" H 5000 4900 50  0001 C CNN
F 3 "" H 5000 4900 50  0001 C CNN
	1    5000 4900
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR02
U 1 1 59824BF9
P 4000 3000
F 0 "#PWR02" H 4000 2750 50  0001 C CNN
F 1 "Earth" H 4000 2850 50  0001 C CNN
F 2 "" H 4000 3000 50  0001 C CNN
F 3 "" H 4000 3000 50  0001 C CNN
	1    4000 3000
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR03
U 1 1 59824C5B
P 3050 3750
F 0 "#PWR03" H 3050 3500 50  0001 C CNN
F 1 "Earth" H 3050 3600 50  0001 C CNN
F 2 "" H 3050 3750 50  0001 C CNN
F 3 "" H 3050 3750 50  0001 C CNN
	1    3050 3750
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR04
U 1 1 59824D08
P 5000 6200
F 0 "#PWR04" H 5000 5950 50  0001 C CNN
F 1 "Earth" H 5000 6050 50  0001 C CNN
F 2 "" H 5000 6200 50  0001 C CNN
F 3 "" H 5000 6200 50  0001 C CNN
	1    5000 6200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR05
U 1 1 5983759C
P 3750 3800
F 0 "#PWR05" H 3750 3550 50  0001 C CNN
F 1 "Earth" H 3750 3650 50  0001 C CNN
F 2 "" H 3750 3800 50  0001 C CNN
F 3 "" H 3750 3800 50  0001 C CNN
	1    3750 3800
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C1
U 1 1 598375E1
P 3650 3800
F 0 "C1" H 3660 3870 50  0000 L CNN
F 1 "100nF" H 3660 3720 50  0000 L CNN
F 2 "OGN Tracker:C_Rect_L7_W2.5_P5" H 3650 3800 50  0001 C CNN
F 3 "" H 3650 3800 50  0001 C CNN
	1    3650 3800
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C3
U 1 1 59837A47
P 5950 6300
F 0 "C3" H 5960 6370 50  0000 L CNN
F 1 "100nF" H 5960 6220 50  0000 L CNN
F 2 "OGN Tracker:C_Rect_L7_W2.5_P5" H 5950 6300 50  0001 C CNN
F 3 "" H 5950 6300 50  0001 C CNN
	1    5950 6300
	1    0    0    -1  
$EndComp
$Comp
L CONN_COAXIAL J1
U 1 1 59837E55
P 4550 6250
F 0 "J1" H 4560 6370 50  0000 C CNN
F 1 "ANT" V 4665 6250 50  0000 C CNN
F 2 "OGN Tracker:IPEX" H 4550 6250 50  0001 C CNN
F 3 "" H 4550 6250 50  0001 C CNN
	1    4550 6250
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR06
U 1 1 59838011
P 4550 6450
F 0 "#PWR06" H 4550 6200 50  0001 C CNN
F 1 "Earth" H 4550 6300 50  0001 C CNN
F 2 "" H 4550 6450 50  0001 C CNN
F 3 "" H 4550 6450 50  0001 C CNN
	1    4550 6450
	1    0    0    -1  
$EndComp
$Comp
L BUCK_CONVERTER SUP1
U 1 1 59838663
P 9400 5000
F 0 "SUP1" H 9100 5250 60  0000 L CNN
F 1 "BUCK_CONVERTER" H 9100 4750 60  0000 L CNN
F 2 "OGN Tracker:Buck_Converter_Sm" H 9150 5000 60  0001 C CNN
F 3 "" H 9150 5000 60  0001 C CNN
	1    9400 5000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 J2
U 1 1 5983881B
P 8450 5000
F 0 "J2" H 8450 5150 50  0000 C CNN
F 1 "CONN_PWR" V 8550 5000 50  0000 C CNN
F 2 "OGN Tracker:XY301-5-2" H 8450 5000 50  0001 C CNN
F 3 "" H 8450 5000 50  0001 C CNN
	1    8450 5000
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR07
U 1 1 59838B5F
P 8700 5250
F 0 "#PWR07" H 8700 5000 50  0001 C CNN
F 1 "Earth" H 8700 5100 50  0001 C CNN
F 2 "" H 8700 5250 50  0001 C CNN
F 3 "" H 8700 5250 50  0001 C CNN
	1    8700 5250
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR08
U 1 1 59838C1F
P 8700 4800
F 0 "#PWR08" H 8700 4650 50  0001 C CNN
F 1 "+12V" H 8700 4940 50  0000 C CNN
F 2 "" H 8700 4800 50  0001 C CNN
F 3 "" H 8700 4800 50  0001 C CNN
	1    8700 4800
	1    0    0    -1  
$EndComp
Text GLabel 9000 5150 0    60   Input ~ 0
5V
Text GLabel 5100 4550 0    60   Input ~ 0
3.3V
$Comp
L CP_Small C2
U 1 1 59970A98
P 6300 6300
F 0 "C2" H 6310 6370 50  0000 L CNN
F 1 "1uF" H 6310 6220 50  0000 L CNN
F 2 "OGN Tracker:C_Radial_D5_L11_P2.5" H 6300 6300 50  0001 C CNN
F 3 "" H 6300 6300 50  0001 C CNN
	1    6300 6300
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR09
U 1 1 59970B11
P 6300 6600
F 0 "#PWR09" H 6300 6350 50  0001 C CNN
F 1 "Earth" H 6300 6450 50  0001 C CNN
F 2 "" H 6300 6600 50  0001 C CNN
F 3 "" H 6300 6600 50  0001 C CNN
	1    6300 6600
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 5997115E
P 6250 3150
F 0 "C4" H 6260 3220 50  0000 L CNN
F 1 "100nF" H 6260 3070 50  0000 L CNN
F 2 "OGN Tracker:C_Rect_L7_W2.5_P5" H 6250 3150 50  0001 C CNN
F 3 "" H 6250 3150 50  0001 C CNN
	1    6250 3150
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C5
U 1 1 599711B3
P 6550 3150
F 0 "C5" H 6560 3220 50  0000 L CNN
F 1 "10uF" H 6560 3070 50  0000 L CNN
F 2 "OGN Tracker:C_Radial_D5_L11_P2.5" H 6550 3150 50  0001 C CNN
F 3 "" H 6550 3150 50  0001 C CNN
	1    6550 3150
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR010
U 1 1 599713FC
P 6550 3250
F 0 "#PWR010" H 6550 3000 50  0001 C CNN
F 1 "Earth" H 6550 3100 50  0001 C CNN
F 2 "" H 6550 3250 50  0001 C CNN
F 3 "" H 6550 3250 50  0001 C CNN
	1    6550 3250
	1    0    0    -1  
$EndComp
Text Label 4450 6000 0    60   ~ 0
ANT
Text Label 4950 2950 0    60   ~ 0
LED
$Comp
L CONN_01X04 UART1
U 1 1 59A1B6D3
P 7350 4200
F 0 "UART1" H 7350 4450 50  0000 C CNN
F 1 "CONSOLE1" V 7450 4200 50  0000 C CNN
F 2 "" H 7350 4200 50  0001 C CNN
F 3 "" H 7350 4200 50  0001 C CNN
	1    7350 4200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 59A1BB3D
P 7050 3950
F 0 "#PWR?" H 7050 3700 50  0001 C CNN
F 1 "Earth" H 7050 3800 50  0001 C CNN
F 2 "" H 7050 3950 50  0001 C CNN
F 3 "" H 7050 3950 50  0001 C CNN
	1    7050 3950
	-1   0    0    1   
$EndComp
Text GLabel 7150 4350 0    60   Input ~ 0
3.3V
Text Label 6450 4150 0    40   ~ 0
CON1_RXD
Text Label 6450 4250 0    40   ~ 0
CON1_TXD
$Comp
L CONN_01X04 UART2
U 1 1 59A1BF8A
P 3250 5200
F 0 "UART2" H 3250 5450 50  0000 C CNN
F 1 "CONSOLE2" V 3350 5200 50  0000 C CNN
F 2 "" H 3250 5200 50  0001 C CNN
F 3 "" H 3250 5200 50  0001 C CNN
	1    3250 5200
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR?
U 1 1 59A1C116
P 3550 5450
F 0 "#PWR?" H 3550 5200 50  0001 C CNN
F 1 "Earth" H 3550 5300 50  0001 C CNN
F 2 "" H 3550 5450 50  0001 C CNN
F 3 "" H 3550 5450 50  0001 C CNN
	1    3550 5450
	1    0    0    -1  
$EndComp
Text GLabel 3450 5050 2    40   Input ~ 0
3.3V
Wire Wire Line
	6550 3300 6550 3250
Wire Wire Line
	6250 3300 6550 3300
Wire Wire Line
	6250 3250 6250 3300
Connection ~ 6250 3050
Wire Wire Line
	5850 3050 6550 3050
Connection ~ 6300 6500
Wire Wire Line
	5950 6500 6300 6500
Wire Wire Line
	5950 6400 5950 6500
Wire Wire Line
	6300 6400 6300 6600
Connection ~ 5950 6100
Wire Wire Line
	6300 6100 6300 6200
Connection ~ 8700 4950
Wire Wire Line
	8700 4800 8700 4950
Wire Wire Line
	8650 4950 9000 4950
Connection ~ 8700 5050
Wire Wire Line
	8700 5250 8700 5050
Wire Wire Line
	8650 5050 9000 5050
Wire Wire Line
	4300 6250 4400 6250
Wire Wire Line
	4300 6000 4300 6250
Wire Wire Line
	5100 6000 4300 6000
Wire Wire Line
	5950 6100 5950 6200
Wire Wire Line
	5850 6100 6300 6100
Wire Wire Line
	3350 3800 3550 3800
Wire Wire Line
	3350 3850 3350 3800
Connection ~ 5000 6100
Wire Wire Line
	5100 6100 5000 6100
Wire Wire Line
	5000 5900 5000 6200
Wire Wire Line
	5100 5900 5000 5900
Wire Wire Line
	3050 3750 3050 3850
Wire Wire Line
	4000 2950 4000 3000
Wire Wire Line
	5000 4650 5000 4900
Wire Wire Line
	5100 4650 5000 4650
Wire Wire Line
	4000 2950 4200 2950
Wire Wire Line
	4650 2950 4500 2950
Wire Wire Line
	5100 2950 4950 2950
Wire Wire Line
	2950 3250 2950 3850
Wire Wire Line
	5100 3250 2950 3250
Wire Wire Line
	3450 3350 3450 3850
Wire Wire Line
	5100 3350 3450 3350
Wire Wire Line
	3150 3450 3150 3850
Wire Wire Line
	5100 3450 3150 3450
Wire Wire Line
	3250 3550 3250 3850
Wire Wire Line
	5100 3550 3250 3550
Wire Wire Line
	6250 5400 5850 5400
Wire Wire Line
	6250 3550 6250 5400
Wire Wire Line
	5850 3550 6250 3550
Wire Wire Line
	6150 5500 5850 5500
Wire Wire Line
	6150 3650 6150 5500
Wire Wire Line
	5850 3650 6150 3650
Wire Wire Line
	6050 5900 5850 5900
Wire Wire Line
	6050 3750 6050 5900
Wire Wire Line
	5850 3750 6050 3750
Wire Wire Line
	4450 5600 5100 5600
Wire Wire Line
	4450 3950 4450 5600
Wire Wire Line
	5100 3950 4450 3950
Wire Wire Line
	4350 5700 5100 5700
Wire Wire Line
	4350 3850 4350 5700
Wire Wire Line
	5100 3850 4350 3850
Wire Wire Line
	4250 5800 5100 5800
Wire Wire Line
	4250 3750 4250 5800
Wire Wire Line
	5100 3750 4250 3750
Wire Wire Line
	4150 5500 5100 5500
Wire Wire Line
	4150 3650 4150 5500
Wire Wire Line
	5100 3650 4150 3650
Wire Wire Line
	7050 4050 7150 4050
Wire Wire Line
	7050 3950 7050 4050
Wire Wire Line
	5850 4250 7150 4250
Wire Wire Line
	5850 4150 7150 4150
Wire Wire Line
	3450 5350 3550 5350
Wire Wire Line
	3550 5350 3550 5450
Wire Wire Line
	3450 5150 4650 5150
Wire Wire Line
	4650 5150 4650 4250
Wire Wire Line
	4650 4250 5100 4250
Wire Wire Line
	3450 5250 4750 5250
Wire Wire Line
	4750 5250 4750 4350
Wire Wire Line
	4750 4350 5100 4350
Text Label 3700 5150 0    40   ~ 0
CON2_TXD
Text Label 3700 5250 0    40   ~ 0
CON2_RXD
$EndSCHEMATC
