$InputData = Get-Content -Path .\Input.txt

$List1 = @()
$List2 = [System.Collections.ArrayList]::new()

foreach($item in $InputData){
    $a = $item.Split("   ")[0]
    $b = $item.Split("   ")[1]
    $List1.Add([PSCustomObject]@{Value = $a})
    $List2.Add([PSCustomObject]@{Value = $b})
}



$List1 = $List1.Sort()
$List2 = $List2.Sort()
$Part1Solution = 0
for($i = 0; $i -lt $List1.Count; $i++){
   
    if($List1[$i] -le $List2[$i]){
        $calc = $List2[$i] - $List1[$i]
        $Part1Solution += $calc
    }else {
        $calc = $List1[$i] - $List2[$i]
        $Part1Solution += $calc
    }
}
Write-Host $Part1Solution

$Part2Solution = 0

foreach($item in $List1){

    $count = 0
    foreach($item2 in $List2){
        if($item -eq $item2){
            $count++
        }
    }
    $calc = $item * $count
    $Part2Solution += $calc
}

Write-Host $Part2Solution