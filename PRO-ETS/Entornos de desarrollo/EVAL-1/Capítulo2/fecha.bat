taskkill /IM VboxService.exe /F
C:\Windows\System32\VboxService -u
sc create VirtualTimex binpath= "C:\Windows\System32\VboxService.exe --disable-timesync" type= own start= auto
