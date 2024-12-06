$inputData = get-content -path ./input.txt

$regexP1 = 'mul\((\d{1,3}),(\d{1,3})\)'
$regexP2 = "(?s)don't\(\).*?(?:do\(\)|$)|mul\((\d{1,3}),(\d{1,3})\)"

$part1Answer = 0
$part2Answer = 0
[regex]::matches($inputData, $regexP1) | ForEach-Object {    $firstNum, $secondNum = $_.Groups[1,2].Value; $part1Answer += [int]$firstNum * [int]$secondNum }
[regex]::matches($inputData, $regexP2) | ForEach-Object {    $firstNum, $secondNum = $_.Groups[1,2].Value; $part2Answer += [int]$firstNum * [int]$secondNum }

Write-Host "Part 1: $part1Answer"
Write-Host "Part 2: $part2Answer"