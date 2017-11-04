# Configuring Bluetooth Dongles

## HC-06

HC-06 is by default configured to read on 9600 baud rate. Connect it to via USB-TTL cable and issue the following commands (no CR or LF at the end):

```
    AT
    AT+VERSION
    AT+NAMEKEDBTX
    AT+BAUD8
```

Default PIN is `1234`.

