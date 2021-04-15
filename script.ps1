Select-String -Path SSF.filter -Pattern 'CustomAlertSound' -NotMatch -Raw | Out-File Console.filter
Copy-Item *.filter 'Z:\Documents\my games\Path of Exile\'
Copy-Item *.wav 'Z:\Documents\my games\Path of Exile\'