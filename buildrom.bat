@echo off
rmdir /s /q temp
rmdir /s /q bin
start make clear && make
gbdk\bin\romusage.exe bin/MiJuego.gb
pause