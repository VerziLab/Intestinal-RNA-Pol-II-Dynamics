import sys
import os

linecount = 0
with open(sys.argv[1]) as f:
    f1 = open(os.path.splitext(sys.argv[1])[0]+"_filtered_greaterthan1000.saf","w")
    line = f.readline()
    while line:
        lineparts = line.split('\t')
        if int(lineparts[3]) - int(lineparts[2]) < 1000:
            print("Skipping {0}".format(line))
            line = f.readline()
            continue
        f1.write(line)
        linecount = linecount + 1
        line = f.readline()
print('Wrote {0} lines'.format(linecount))
