Select-String -Path SSF.filter -Pattern 'CustomAlertSound' -NotMatch -Raw | Out-File Console.filter
Copy-Item *.filter 'C:\Users\mjgud\OneDrive\Documents\My Games\Path of Exile\'
Copy-Item *.wav 'C:\Users\mjgud\OneDrive\Documents\My Games\Path of Exile\'