"""
    This is a 1bpp RLE compression scheme based on nybbles.
    
    0000 - 4 literal bits (ignores last), followed by opposite of last one
    0001~1101 - 1-13 bits, followed by opposite of last one
    1110 - 13 bits, followed by same as last one
    1111 - """; LONG_RUN=31; """ bits, followed by same as last one
"""

USE_XOR = False # worse

import math

long_runs = {}

prev = None

#for LONG_RUN in range(28, 34):
if True:

    # Total: 64523 nybbles (32261 bytes)


    import sys
    import os
    import zlib

    arg = sys.argv[1]
    files = []
    if os.path.isdir(arg):
        for f in sorted(os.listdir(arg)):
    #        if f[-4:] != '.pgm':
            files.append(os.path.join(arg, f))
    else:
        files = [arg]

    v = False
    if len(files) == 1:
        v = True
    
    #v = True
    
    cframes = []
    cfiles = {}

    zlibs = 0

    for fname in files:
        print fname
        with open(fname, 'rb') as f:
            bytes = f.read()
            
            bits = []
            
            cnt = 0
            
            orig = len(bytes)
            bytes_zlib = zlib.compress(bytes, 9)
            
            for i, byte in enumerate(bytes):
                
                if USE_XOR and prev:
                    byte = chr(ord(prev[i]) ^ ord(byte))
                
                for i in range(8):
                    bits.append( (ord(byte) >> 7-i) & 1)
            
                if v:
                    print "{:08b}".format(ord(byte)),
                    cnt += 1
                    if cnt == 6:
                        cnt = 0
                        print
                    #print bin(ord(byte))

        #bits = list(int(i) for i in "100000000000000011111111000010101")
        bits.append(-1) # internal end marker

        rle = [] # contains all "runs"

        curbit = None
        cnt = 0


        bit = bits.pop(0)
        cnt = 1

        # feeds the runs into the rle list
        while True:
            curbit = bit
            cnt = 1
            if curbit == -1: break
            while True:
                bit = bits.pop(0)
                if bit == curbit:
                    cnt += 1
                else: break
            rle.append((curbit, cnt))

        if v: print rle

        compressed = [] # contains nibbles

        pos = 0
        follows = 0
        skip = 0
        literal = None
        lossy = 0

        for bit, cnt in rle:
            if skip:
                skip -= 1
            else:
                next = rle[pos+1:pos+4]
                #if bit != follows:
                #    print('Wrong bit, forcing me to use literals...')
                #    compressed.append(0b0000)
                #    while 
                # try literal
                if len(next) == 3:
                    cnt0, cnt1, cnt2, cnt3 = cnt, next[0][1], next[1][1], next[2][1]
                    literal = None
                    skip = 0
                    if cnt0+cnt1 == 4:
                        literal = int(str(bit)*cnt0+str(next[0][0])*cnt1, 2)
                        skip = 1
                    elif cnt0+cnt1+cnt2 == 4:
                        literal = int(str(bit)*cnt0+str(next[0][0])*cnt1+str(next[1][0])*cnt2, 2)
                        skip = 2
                    elif cnt0+cnt1+cnt2+cnt3 == 4:
                        literal = int(str(bit)*cnt0+str(next[0][0])*cnt1+str(next[1][0])*cnt2+str(next[2][0])*cnt3, 2)
                        skip = 3
                    if literal:
                        if v: print "chose literal {:04b}, skipping {}, bit={}*{}, next={}".format(literal, skip, bit, cnt, next)
                        compressed.append(0b0000)
                        compressed.append(literal)
                        follows = int(not (literal & 1))
                if not skip:
                    if bit != follows:
                        if v: print('ERR - WRONG BIT')
                        compressed.append(0b0001)
                        cnt -= 1
                        lossy += 1
                    #    compressed.append(0b1111)
                    while cnt > LONG_RUN:
                        compressed.append(0b1111)
                        cnt -= LONG_RUN
                    while cnt > 13:
                        compressed.append(0b1110)
                        cnt -= 13
                    if cnt > 0:
                        compressed.append(cnt)
                    follows = not bit
            pos += 1
            

        #print(compressed)
        if v:
            for nybble in compressed:
                print "{:04b}".format(nybble),
            print
        b = []
        #if len(compressed) % 1:
        #    compressed.append(1)
        prev = None
        for nybble in compressed:
            if prev != None:
                b.append((prev<<4)+nybble)
                prev = None
            else:
                prev = nybble
        if prev:
            b.append((prev<<4)+1)
        cbytes = b
        if v:
            for byte in b:
                print "${:02x},".format(byte),
            print
            

        new = len(compressed)/2

        if v: 
            print
            print
            print "Original size: {:04x} bytes".format(orig)
            print "New size:      {:04x} bytes (lost {} bits)".format(new, lossy)
            print "Saved:         {:03}%".format((float(orig-new)/orig)*100)
            print "zlib size:     {:04x} bytes".format(len(bytes_zlib))
            print
            print "Decompressing..."

        cfiles[fname] = compressed
        cframes.append(cbytes)
        zlibs += (len(bytes_zlib)+1)*2
        if v: 
            bits = []
            literal = False
            follows = 0
            for nybble in compressed:
                if literal:
                    bits += [int(b) for b in "{:04b}".format(nybble)]
                    follows = not bits[-1]
                    literal = False
                else:
                    if nybble == 0:
                        literal = True
                    elif nybble == 0b1110:
                        bits += [follows]*13
                    elif nybble == 0b1111:
                        bits += [follows]*LONG_RUN
                    else:
                        bits += [follows]*nybble
                        follows = not follows
                
            for line in range(32):
                print "".join(str(int(b)) for b in bits[line*48:line*48+48])
            

        prev = bytes
        #0101

        #0001 0001 0001 0001

    print "Worst cases:"

    for fname, l in list(reversed(sorted(cfiles.items(), key=lambda x: len(x[1]))))[0:10]:
        print fname, len(l), "nybbles"

    total = 0
    total_orig = (orig * len(cfiles)) * 2
    for fname, l in cfiles.items():
        total += len(l)
        total += 2 # length
    long_runs[LONG_RUN] = total

    print "Original: {} nybbles ({} bytes - {} KiB)".format(total_orig, total_orig/2, total_orig/2/1024)
    print "Total: {} nybbles ({} bytes - {} KiB)".format(total, total/2, total/2/1024)
    print "Saved: {:03}%".format((float(total_orig-total)/total_orig)*100)
    print "zlib total: {} nybbles ({} bytes - {} KiB)".format(zlibs, zlibs/2, zlibs/2/1024)
    print "zlib saved: {:03}%".format((float(total_orig-zlibs)/total_orig)*100)
    

print "Long run roundup:"

for LONG_RUN in sorted(long_runs.keys()):
    print LONG_RUN, long_runs[LONG_RUN]

f = open('frames.asm', 'w')

for i, frame in enumerate(cframes):
    frame.insert(0, len(frame))
    f.write("frame{:03}: .byte ".format(i)+",".join("${:x}".format(byte) for byte in frame))
    f.write("\n")
