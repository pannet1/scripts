#!/bin/xonsh
import os
import shutil

lst = ["bin", "include", "lib"]
[shutil.rmtree(folder) for folder in lst if os.path.isdir(folder)]
if os.path.islink("lib64"):
    os.unlink("lib64")


