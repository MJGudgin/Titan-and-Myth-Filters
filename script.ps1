#Select-String -Path SSF.filter -Pattern 'CustomAlertSound' -NotMatch -Raw | Out-File Console.filter

$file = "SSF.filter"
rm Console.filter
New-Item Console.filter

rm SSF-Strict.filter
New-Item SSF-Strict.filter

rm Console-Strict.filter
New-Item Console-Strict.filter

rm SSF-Super-Strict.filter
New-Item SSF-Super-Strict.filter

rm Console-Super-Strict.filter
New-Item Console-Super-Strict.filter

$objCount
$StrictOutput = $true
$SuperStrictOutput = $true

foreach ($line in (Get-Content $file))
{
		$a = $line.Split(' ')
		#Replace all custom alerts with built in alerts for Console filter
		if ($line -eq '	CustomAlertSound "dream_orb_pickup.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 6 300"
		}
		if ($line -eq '	CustomAlertSound "bell_hit.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 2 300"
		}
		if ($line -eq '	CustomAlertSound "hero_unsheath.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 1 300"
		}
		if ($line -eq '	CustomAlertSound "bell_rise.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 4 200"
		}
		if ($line -eq '	CustomAlertSound "boss_stun.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 5 200"
		}
		if ($line -eq '	CustomAlertSound "water_cut_01.wav"' -or $line -eq '	CustomAlertSound "pot_death_1.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 3 200"
		}
		if ($line -eq '	CustomAlertSound "buzzer_startle_01.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 7 200"
		}	
		if ($line -eq '	CustomAlertSound "buzzer_startle_02.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 8 200"
		}
		if ($line -eq '	CustomAlertSound "buzzer_startle_03.wav"')
		{
			Add-Content Console.filter "	PlayAlertSound 9 200"
		}
		
		if ($a[0] -ne '	CustomAlertSound')
		{
			Add-Content Console.filter $line
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
			Add-Content SSF-Strict.filter $line
			
			#Replace all custom alerts with built in alerts for Strict Console filter
			if ($line -eq '	CustomAlertSound "dream_orb_pickup.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 6 300"
			}
			if ($line -eq '	CustomAlertSound "bell_hit.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 2 300"
			}
			if ($line -eq '	CustomAlertSound "hero_unsheath.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 1 300"
			}
			if ($line -eq '	CustomAlertSound "bell_rise.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 4 200"
			}
			if ($line -eq '	CustomAlertSound "boss_stun.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 5 200"
			}
			if ($line -eq '	CustomAlertSound "water_cut_01.wav"' -or $line -eq '	CustomAlertSound "pot_death_1.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 3 200"
			}
			if ($line -eq '	CustomAlertSound "buzzer_startle_01.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 7 200"
			}	
			if ($line -eq '	CustomAlertSound "buzzer_startle_02.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 8 200"
			}
			if ($line -eq '	CustomAlertSound "buzzer_startle_03.wav"')
			{
				Add-Content Console-Strict.filter "	PlayAlertSound 9 200"
			}
			if ($a[0] -ne '	CustomAlertSound')
			{
			Add-Content Console-Strict.filter $line
			}
		}
		
		if ($StrictOutput -eq $true  -and $SuperStrictOutput -eq $true)
		{
			Add-Content SSF-Super-Strict.filter $line
			
			#Replace all custom alerts with built in alerts for Strict Console filter
			if ($line -eq '	CustomAlertSound "dream_orb_pickup.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 6 300"
			}
			if ($line -eq '	CustomAlertSound "bell_hit.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 2 300"
			}
			if ($line -eq '	CustomAlertSound "hero_unsheath.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 1 300"
			}
			if ($line -eq '	CustomAlertSound "bell_rise.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 4 200"
			}
			if ($line -eq '	CustomAlertSound "boss_stun.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 5 200"
			}
			if ($line -eq '	CustomAlertSound "water_cut_01.wav"' -or $line -eq '	CustomAlertSound "pot_death_1.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 3 200"
			}
			if ($line -eq '	CustomAlertSound "buzzer_startle_01.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 7 200"
			}	
			if ($line -eq '	CustomAlertSound "buzzer_startle_02.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 8 200"
			}
			if ($line -eq '	CustomAlertSound "buzzer_startle_03.wav"')
			{
				Add-Content Console-Super-Strict.filter "	PlayAlertSound 9 200"
			}
			if ($a[0] -ne '	CustomAlertSound')
			{
			Add-Content Console-Super-Strict.filter $line
			}
		}
		
}

Copy-Item *.filter 'C:\Users\mjgud\OneDrive\Documents\My Games\Path of Exile\'
Copy-Item *.wav 'C:\Users\mjgud\OneDrive\Documents\My Games\Path of Exile\'