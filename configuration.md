# Configuring

# Tracker settings


## Tracker
Tracker is configured using $POGNS NMEA sentence

```
$POGNS,ACFTT,ADDRT,ADDR,RFT,TXPW,FQCORR,
```

Where:

  * `ACFTT` -- [0..15] aircraft-type: 1=glider, 2=towa plane, 3=helicopter, ...
  * `ADDRT` -- [0..3] addr-type: 1=ICAO, 2=FLARM, 3=OGN
  * `ADDR` -- [HHHHHH] Address (ID): 6 hex digits, 24-bit
  * `RFT` -- [0..1] RFM69HW (up to +20dBm) or W (up to +13dBm)
  * `TXPW` -- [dBm] Tx power, from -10 to 20
  * `FQCORR` -- [Hz] Tx/Rx frequency correction

Examples:

Set high transmission power:
```
$POGNS,,,,,20,
```

## Bluetooth Dongles

### HC-06

HC-06 is by default configured to read on 9600 baud rate. Connect it to via
USB-TTL cable and issue the following commands (no CR or LF at the end):

```
    AT
    AT+VERSION
    AT+NAMEKEDBTX
    AT+BAUD8
```

Default PIN is `1234`.


### HC-10 Bluetooth LE

HC-06 is by default configured to read on 9600 baud rate. It accepts commands
with CR+LF endings. To configure, use these commands:

```
    AT+VERSION
    AT+NAMEKEDBTX
    AT+BAUD8
```