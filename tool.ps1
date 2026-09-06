<##
.SYNOPSIS
	Copies an AFCL license to a destination directory.

.EXAMPLE
	.\license_tool.ps1 -Path .\licenses -Format markdown -o

.EXAMPLE
	.\license_tool.ps1 -Path C:\Projects\MyApp -Format text -r
##>
[CmdletBinding()]
param(
	[Parameter(Mandatory = $true)]
	[string]$Path,

	[ValidateSet('text', 'markdown')]
	[string]$Format = 'markdown',

	[Parameter(Mandatory = $true, ParameterSetName = 'OpenSource')]
	[Alias('o')]
	[switch]$OpenSource,

	[Parameter(Mandatory = $true, ParameterSetName = 'ClosedSource')]
	[Alias('c')]
	[switch]$ClosedSource,

	[Parameter(Mandatory = $true, ParameterSetName = 'AvailableSource')]
	[Alias('a')]
	[switch]$AvailableSource,

	[Parameter(Mandatory = $true, ParameterSetName = 'RootLicense')]
	[Alias('r')]
	[switch]$RootLicense
)

$repositoryRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$extension = if ($Format -eq 'markdown') { '.md' } else { '.txt' }

switch ($PSCmdlet.ParameterSetName) {
	'OpenSource' {
		$sourceDirectory = 'subLicenses'
		$licenseName = 'AFCLv1-O'
	}
	'ClosedSource' {
		$sourceDirectory = 'subLicenses'
		$licenseName = 'AFCLv1-C'
	}
	'AvailableSource' {
		$sourceDirectory = 'subLicenses'
		$licenseName = 'AFCLv1-A'
	}
	'RootLicense' {
		$sourceDirectory = 'mainLicense'
		$licenseName = if ($Format -eq 'markdown') {
			'AFCLv1'
		} else {
			'AFCLv1'
		}
	}
	default {
		throw 'Select one license type: -o, -c, -a, or -r.'
	}
}

$sourcePath = Join-Path $repositoryRoot "$sourceDirectory\$licenseName$extension"
if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
	throw "License file was not found: $sourcePath"
}

$destinationDirectory = New-Item -ItemType Directory -Path $Path -Force
$destinationPath = Join-Path $destinationDirectory.FullName 'LICENSE'
if (Test-Path -LiteralPath $destinationPath -PathType Leaf) {
	throw "A license already exists in this directory: $destinationPath"
}

Copy-Item -LiteralPath $sourcePath -Destination $destinationPath -Force

Write-Output "License copied to: $destinationPath"
