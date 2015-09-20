#!/usr/bin/python
f=file("/dev/stdin","r")
b=[]
i=0

while True:
    line=f.readline()
    if line=='': break
    i=i+1
    b.append(line[0:line.index('\n')])

while i>0:
    i=i-1
    print b[i]

