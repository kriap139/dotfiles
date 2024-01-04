#!/usr/bin/python

import re
import os
import sys

def find_file_version(folder: str, fName: str) -> int:
    nums = []
    for fn in os.listdir(folder):
        if fName in fn:
            nums.extend(re.findall(r'(\d+)', fn))
    
    if len(nums):
        nums.sort(reverse=True)
        return int(nums[0]) + 1
    else:
        return None


def main():
    if len(sys.argv) == 2:
        fp = sys.argv[1]
    else:
        exit(0)
    
    if not os.path.exists(fp):
        exit(0)

    Dir, fName = os.path.split(fp)
    versions = re.findall(r'(\d+)', fName)

    if len(versions):
        cleaned = re.sub(r'[(\d+)]', '', fName)
        cleaned = cleaned.strip()
        ver = int(versions[0]) + 1
    else:
        cleaned = fName
        ver = 1

    if fName.count('.') > 1:
        newName = f"{cleaned} ({ver})"
        if os.path.exists(newName):
            ver = find_file_version(Dir, cleaned)
            newName = f"{cleaned} ({ver})"
        
    else:
        name, ext = os.path.splitext(cleaned)
        name = name.strip()
        newName = f"{name} ({ver}){ext}"
        if os.path.exists(newName):
            ver = find_file_version(Dir, name)
            newName = f"{name} ({ver}){ext}"
    
    os.popen(f"cp '{fp}' '{os.path.join(Dir, newName)}'") 

if __name__ == "__main__":
    main()
