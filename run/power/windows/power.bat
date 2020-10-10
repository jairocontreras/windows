@echo off
set /a "time=%1*60"
shutdown /s /t %time%
timeout 1
set /a "delay=%time%-1"
timeout %delay%