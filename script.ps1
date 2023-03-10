#Select-String -Path SSF.filter -Pattern 'CustomAlertSound' -NotMatch -Raw | Out-File Console.filter

$file = "SSF.filter"
rm Console.filter
New-Item Console.filter

rm SSF-Strict.filter
New-Item SSF-Strict.filter

$objCount
$StrictOutput = $true

foreach ($line in (Get-Content $file))
{
		$a = $line.Split(' ')
		if ($a[0] -ne '	CustomAlertSound')
		{
			Add-Content Console.filter $line
		}
		if ($a[0] -eq '#StrictIgnore')
		{
			$StrictOutput = $false
		}
		if ($a[0] -eq '#EndStrictIgnore')
		{
			$StrictOutput = $true
		}
		elseif ($StrictOutput -eq $true)
		{
			Add-Content SSF-Strict.filter $line
		}
}

Copy-Item *.filter 'C:\Users\mjgud\OneDrive\Documents\My Games\Path of Exile\'
Copy-Item *.wav 'C:\Users\mjgud\OneDrive\Documents\My Games\Path of Exile\'