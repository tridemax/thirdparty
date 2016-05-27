$inputFiles = @(
	".\lemmagen\header\RdrLemmatizer.h"
)

$outputFile = "..\_dist\include\lemmagen.h"

#Extract file names from pathes

$patternList = @(Split-Path $inputFiles -Leaf)

for ($patternIndex = 0; $patternIndex -ne $patternList.length; ++$patternIndex)
{
	$fileName = $patternList[$patternIndex]
	$patternList[$patternIndex] = "`#\s*include.*$fileName"
}

#Create output file and merge into them all the input files

New-Item -ItemType file $outputFile –force

foreach ($file in $inputFiles)
{
	Get-Content $file | Select-String -Pattern $patternList -NotMatch | Add-Content $outputFile
}

#Add WinApi dependencies
