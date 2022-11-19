#!/bin/sh


journalctl --vacuum-time=4weeks
paccache -ruk0
pacman -Rns $(pacman -Qdtq)
