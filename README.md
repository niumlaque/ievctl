## Usage
### Read mouse events
```
./ievctl /dev/input/event0
{1510534949 563606}, EV_ABS(0x0003), ABS_X(0x0000), 35856
{1510534949 563606}, EV_ABS(0x0003), ABS_Y(0x0001), 50273
{1510534949 563606}, EV_SYN(0x0000), SYN_REPORT(0x0000), 0
{1510534950 156155}, EV_KEY(0x0001), BTN_MOUSE|BTN_LEFT(0x0110), 1
{1510534950 156155}, EV_SYN(0x0000), SYN_REPORT(0x0000), 0
{1510534950 283802}, EV_KEY(0x0001), BTN_MOUSE|BTN_LEFT(0x0110), 0
{1510534950 283802}, EV_SYN(0x0000), SYN_REPORT(0x0000), 0
```

### Read touch events
```
./ievctl /dev/input/event0
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_SLOT(0x002f), 0
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_TRACKING_ID(0x0039), 14
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_POSITION_X(0x0035), 1282
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_POSITION_Y(0x0036), 541
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_PRESSURE(0x003a), 173
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_SLOT(0x002f), 1
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_TRACKING_ID(0x0039), 15
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_POSITION_X(0x0035), 1558
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_POSITION_Y(0x0036), 692
{1293930415 972473}, EV_ABS(0x0003), ABS_MT_PRESSURE(0x003a), 194
{1293930415 972473}, EV_SYN(0x0000), SYN_REPORT(0x0000), 0
{1293930416 35053}, EV_ABS(0x0003), ABS_MT_SLOT(0x002f), 0
{1293930416 35053}, EV_ABS(0x0003), ABS_MT_TRACKING_ID(0x0039), -1
{1293930416 35053}, EV_ABS(0x0003), ABS_MT_SLOT(0x002f), 1
{1293930416 35053}, EV_ABS(0x0003), ABS_MT_TRACKING_ID(0x0039), -1
{1293930416 35053}, EV_SYN(0x0000), SYN_REPORT(0x0000), 0
```

### Send key events
```
# Send F1 key press event
./ievctl /dev/input/event1 0x1 0x3b 1
./ievctl /dev/input/event1 0x0 0x0 0

# Send F1 key release event
./ievctl /dev/input/event1 0x1 0x3b 0
./ievctl /dev/input/event1 0x0 0x0 0
```

### Send touch events
```
# Touch down 1
./ievctl /dev/input/event0 0x3 0x2f 0
./ievctl /dev/input/event0 0x3 0x39 3804
./ievctl /dev/input/event0 0x3 0x35 400
./ievctl /dev/input/event0 0x3 0x36 200
./ievctl /dev/input/event0 0x3 0x30 7
./ievctl /dev/input/event0 0x3 0x3a 132
./ievctl /dev/input/event0 0x0 0x0 0

# Touch down 2
./ievctl /dev/input/event0 0x3 0x2f 1
./ievctl /dev/input/event0 0x3 0x39 3805
./ievctl /dev/input/event0 0x3 0x35 500
./ievctl /dev/input/event0 0x3 0x36 200
./ievctl /dev/input/event0 0x3 0x30 7
./ievctl /dev/input/event0 0x3 0x3a 150
./ievctl /dev/input/event0 0x0 0x0 0

# Touch release 2
./ievctl /dev/input/event0 0x3 0x2f 1
./ievctl /dev/input/event0 0x3 0x39 0xffffffff 
./ievctl /dev/input/event0 0x0 0x0 0

# Touch release 1
./ievctl /dev/input/event0 0x3 0x2f 0
./ievctl /dev/input/event0 0x3 0x39 0xffffffff 
./ievctl /dev/input/event0 0x0 0x0 0
```
