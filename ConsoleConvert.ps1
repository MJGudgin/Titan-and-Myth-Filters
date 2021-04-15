$file = $args[0]
rm Console.filter
New-Item Console.filter

$objCount

foreach ($line in (Get-Content $file))
{
		$a = $line.Split(' ')
		if ($a[0] -ne '	CustomAlertSound')
		{
			Add-Content Console.filter $line
		}
		
}
