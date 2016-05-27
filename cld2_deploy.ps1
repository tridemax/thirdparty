$inputFiles = @(
	".\cld2\internal\integral_types.h",
	".\cld2\internal\generated_ulscript.h",
	".\cld2\internal\generated_language.h",
	".\cld2\internal\lang_script.h",

	".\cld2\public\compact_lang_det.h",
	".\cld2\public\encodings.h"
)

$outputFile = "..\_dist\include\cld2.h"

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
