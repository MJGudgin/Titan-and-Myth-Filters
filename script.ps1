#Select-String -Path Titan.filter -Pattern 'CustomAlertSound' -NotMatch -Raw | Out-File Myth.filter

$file = "BaseFilter.filter"

rm Titan.filter
New-Item Titan.filter

rm Myth.filter
New-Item Myth.filter

rm Titan-Strict.filter
New-Item Titan-Strict.filter

rm Myth-Strict.filter
New-Item Myth-Strict.filter

rm Titan-Super-Strict.filter
New-Item Titan-Super-Strict.filter

rm Myth-Super-Strict.filter
New-Item Myth-Super-Strict.filter

$objCount
$StrictOutput = $true
$SuperStrictOutput = $true
$lineCount = 0

foreach ($line in (Get-Content $file))
{
		$lineCount++
		if ($lineCount -eq 2)
		{
			Add-Content Titan.filter "#		   	 	Titan  	 	 		#"
			Add-Content Titan-Strict.filter "#		   	 	Titan  	 	 		#"
			Add-Content Titan-Super-Strict.filter "#		   	 	Titan  	 	 		#"
			Add-Content Myth.filter "#		   	 	Myth  	 	 		#"
			Add-Content Myth-Strict.filter "#		   	 	Myth  	 	 		#"
			Add-Content Myth-Super-Strict.filter "#		   	 	Myth  	 	 		#"
		}

		if ($lineCount -eq 3)
		{
			Add-Content Titan-Strict.filter "#			   Strict				#"
			Add-Content Myth-Strict.filter "#			   Strict				#"
			Add-Content Titan-Super-Strict.filter "#			Super Strict			#"
			Add-Content Myth-Super-Strict.filter "#			Super Strict			#"
		}
		
		if ($lineCount -eq 3)
		{
			Add-Content Titan.filter "#			 Custom Audio			#"
			Add-Content Titan-Strict.filter "#			 Custom Audio			#"
			Add-Content Titan-Super-Strict.filter "#			 Custom Audio			#"
			Add-Content Myth.filter "#			Native Audio			#"
			Add-Content Myth-Strict.filter "#			Native Audio			#"
			Add-Content Myth-Super-Strict.filter "#			Native Audio			#"			
		}
		
		if ($line -ne '#StrictIgnore' -and $line -ne '#SuperStrictIgnore' -and $line -ne '#EndStrictIgnore' -and $line -ne '#EndSuperStrictIgnore')
		{
			Add-Content Titan.filter $line
		}
		
		$a = $line.Split(' ')
		#Replace all custom alerts with built in alerts for Myth filter
		if ($line -eq '	CustomAlertSound "herocreation.wav"')
		{
			Add-Content Myth.filter "	PlayAlertSound 6 300"
		}
		if ($line -eq '	CustomAlertSound "error.wav"')
		{
			Add-Content Myth.filter "	PlayAlertSound 2 300"
		}
		if ($line -eq '	CustomAlertSound "god_power_end.wav"')
		{
			Add-Content Myth.filter "	PlayAlertSound 2 300"
		}
		if ($line -eq '	CustomAlertSound "find.wav"')
		{
			Add-Content Myth.filter "	PlayAlertSound 1 300"
		}
		if ($line -eq '	CustomAlertSound "hitpointsmax.wav"')
		{
			Add-Content Myth.filter "	PlayAlertSound 4 200"
		}
		if ($line -eq '	CustomAlertSound "Titancreate.wav"')
		{
			Add-Content Myth.filter "	PlayAlertSound 5 200"
		}
		if ($line -eq '	CustomAlertSound "popcaphit.wav"')
		{
			Add-Content Myth.filter "	PlayAlertSound 3 200"
		}
		if ($line -eq '	CustomAlertSound "repeatoff.wav"')
		{
			Add-Content Myth.filter "	PlayAlertSound 7 200"
		}
		
		if ($a[0] -ne '	CustomAlertSound' -and $line -ne '#StrictIgnore' -and $line -ne '#SuperStrictIgnore' -and $line -ne '#EndStrictIgnore' -and $line -ne '#EndSuperStrictIgnore')
		{
			Add-Content Myth.filter $line
		}
		if ($a[0] -eq '#StrictIgnore')
		{
			$StrictOutput = $false
			$SuperStrictOutput = $false
		}
		if ($a[0] -eq '#EndStrictIgnore')
		{
			$StrictOutput = $true
			$SuperStrictOutput = $true
		}
		if ($a[0] -eq '#SuperStrictIgnore')
		{
			$SuperStrictOutput = $false
		}
		if ($a[0] -eq '#EndSuperStrictIgnore')
		{
			$SuperStrictOutput = $true
		}
		
		if ($StrictOutput -eq $true)
		{
			#if ($line -ne ('#EndStrictIgnore' -or '#EndSuperStrictIgnore'))
			if ($line -ne '#StrictIgnore' -and $line -ne '#SuperStrictIgnore' -and $line -ne '#EndStrictIgnore' -and $line -ne '#EndSuperStrictIgnore')
			{
				Add-Content Titan-Strict.filter $line
			}
			
			#Replace all custom alerts with built in alerts for Strict Myth filter
			if ($line -eq '	CustomAlertSound "herocreation.wav"')
			{
				Add-Content Myth-Strict.filter "	PlayAlertSound 6 300"
			}
			if ($line -eq '	CustomAlertSound "error.wav"')
			{
				Add-Content Myth.filter "	PlayAlertSound 2 300"
			}
			if ($line -eq '	CustomAlertSound "god_power_end.wav"')
			{
				Add-Content Myth-Strict.filter "	PlayAlertSound 2 300"
			}
			if ($line -eq '	CustomAlertSound "find.wav"')
			{
				Add-Content Myth-Strict.filter "	PlayAlertSound 1 300"
			}
			if ($line -eq '	CustomAlertSound "hitpointsmax.wav"')
			{
				Add-Content Myth-Strict.filter "	PlayAlertSound 4 200"
			}
			if ($line -eq '	CustomAlertSound "Titancreate.wav"')
			{
				Add-Content Myth-Strict.filter "	PlayAlertSound 5 200"
			}
			if ($line -eq '	CustomAlertSound "water_cut_01.wav"' -or $line -eq '	CustomAlertSound "popcaphit.wav"')
			{
				Add-Content Myth-Strict.filter "	PlayAlertSound 3 200"
			}
			if ($line -eq '	CustomAlertSound "repeatoff.wav"')
			{
				Add-Content Myth-Strict.filter "	PlayAlertSound 7 200"
			}	
			if ($a[0] -ne '	CustomAlertSound' -and $line -ne '#StrictIgnore' -and $line -ne '#SuperStrictIgnore' -and $line -ne '#EndStrictIgnore' -and $line -ne '#EndSuperStrictIgnore')
			{
				Add-Content Myth-Strict.filter $line
			}
		}
		
		if ($StrictOutput -eq $true  -and $SuperStrictOutput -eq $true)
		{
			if ($line -ne '#StrictIgnore' -and $line -ne '#SuperStrictIgnore' -and $line -ne '#EndStrictIgnore' -and $line -ne '#EndSuperStrictIgnore')
			{
				Add-Content Titan-Super-Strict.filter $line
			}
			
			#Replace all custom alerts with built in alerts for Strict Myth filter
			if ($line -eq '	CustomAlertSound "herocreation.wav"')
			{
				Add-Content Myth-Super-Strict.filter "	PlayAlertSound 6 300"
			}
			if ($line -eq '	CustomAlertSound "error.wav"')
			{
				Add-Content Myth.filter "	PlayAlertSound 2 300"
			}
			if ($line -eq '	CustomAlertSound "god_power_end.wav"')
			{
				Add-Content Myth-Super-Strict.filter "	PlayAlertSound 2 300"
			}
			if ($line -eq '	CustomAlertSound "find.wav"')
			{
				Add-Content Myth-Super-Strict.filter "	PlayAlertSound 1 300"
			}
			if ($line -eq '	CustomAlertSound "hitpointsmax.wav"')
			{
				Add-Content Myth-Super-Strict.filter "	PlayAlertSound 4 200"
			}
			if ($line -eq '	CustomAlertSound "Titancreate.wav"')
			{
				Add-Content Myth-Super-Strict.filter "	PlayAlertSound 5 200"
			}
			if ($line -eq '	CustomAlertSound "water_cut_01.wav"' -or $line -eq '	CustomAlertSound "popcaphit.wav"')
			{
				Add-Content Myth-Super-Strict.filter "	PlayAlertSound 3 200"
			}
			if ($line -eq '	CustomAlertSound "repeatoff.wav"')
			{
				Add-Content Myth-Super-Strict.filter "	PlayAlertSound 7 200"
			}	
			if ($a[0] -ne '	CustomAlertSound' -and $line -ne '#StrictIgnore' -and $line -ne '#SuperStrictIgnore' -and $line -ne '#EndStrictIgnore' -and $line -ne '#EndSuperStrictIgnore')
			{
				Add-Content Myth-Super-Strict.filter $line
			}
		}
		
}

Copy-Item *.filter 'C:\Users\mjgud\OneDrive\Documents\My Games\Path of Exile\'
Copy-Item *.wav 'C:\Users\mjgud\OneDrive\Documents\My Games\Path of Exile\'