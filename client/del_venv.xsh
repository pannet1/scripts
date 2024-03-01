#!/bin/xonsh
import os
import shutil

# remove file pyvenv.cfg if it exists
if os.path.isfile("pyvenv.cfg"):
  print("removing pyvenv.cfg")
  os.remove("pyvenv.cfg")

lst = ["bin", "include", "lib"]
print("removing bin, include, lib")
[shutil.rmtree(folder) for folder in lst if os.path.isdir(folder)]
if os.path.islink("lib64"):
    print("unlinking lib64")
    os.unlink("lib64")


