This program converts any number 0-9 to ASCII and prints it to the screen in assembly.

This assembly code is meant for arm64 MacOS M1 chips

Run this program by first:

1. Assembling

```
as main.s -o main.o
```

2. Linking

```
ld main.o -o main -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path`
```

3. Executing

```
./main
```
