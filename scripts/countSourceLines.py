#!/usr/bin/env python3

import os
import sys

def countSourceLines(src, lineCounts, filesCounted):
    '''Counts lines of source code in a directory'''
    def __c(f):
        ext = os.path.splitext(f)[1][1:]
        if ext in lineCounts:
            try:
                fil = open(f, 'r', encoding='utf-8', errors='ignore')
                lineCounts[ext][0] += 1
                line_count = sum(1 for line in fil)
                lineCounts[ext][1] += line_count
                fil.close()
                filesCounted.append(f)
            except Exception as e:
                # Skip files that can't be processed
                pass

    if os.path.isdir(src):
        for root, dirs, files in os.walk(src):
            for name in files:
                __c(os.path.join(root, name))
    else:
        __c(src)

if __name__ == "__main__":
    filetypes = ["lhs", "hs", "c", "cc", "cpp", "h", "hpp", "py", "java", "sh", "go", "html", "htm", "xml", "php", "js", "jsx", "t", "tu", "frag", "vert", "hs", "scala", "tex", "ts", "tsx"]
    lineCounts = {}
    filesCounted = []
    for ft in filetypes:
        lineCounts[ft] = [0, 0]

    src_dirs = sys.argv[1:]
    for s in src_dirs:
        countSourceLines(s, lineCounts, filesCounted)
    print("\nCounted source code lines for:\n" + '\n'.join(filesCounted))
    totalf = 0
    totall = 0
    for k, v in iter(lineCounts.items()):
        if v[0] > 0:
            totalf += v[0]
            totall += v[1]
            print(("." + k + ":").ljust(8) + "files:" + str(v[0]).rjust(8) + "  lines:" + str(v[1]).rjust(10))
    print("Total source files: %d" % totalf)
    print("Total lines in all source files: %d" % totall)

