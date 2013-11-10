# 48x32  6x4 tiles

import png
import sys
import os

arg = sys.argv[1]
files = []
if os.path.isdir(arg):
    for f in sorted(os.listdir(arg)):
#        if f[-4:] != '.pgm':
        files.append(os.path.join(arg, f))
else:
    files = [arg]

for f in files:

    r= png.Reader(file=open(f))
    pixels = r.asDirect()[2]
    
    bytes = []
    
    curbyte = []
    for row in pixels:
        for pixel in row[::3]:
            pixel = bool(pixel)
            curbyte.append(pixel)
            if len(curbyte) == 8:
                b = 0
                for i in range(8):
                    b |= curbyte[i] << 7-i
                curbyte = []
                bytes.append(b)
    
    with open(f[:-4]+".1bpp", 'wb') as f:
        for byte in bytes:
            f.write(chr(byte))


