Param(
    [Parameter(Mandatory = $True)]
    [string]$prTitle
)

$Regex="^(fix|feat):"

if ($prTitle -match $Regex) {
  Write-Host "The commit message complies with conventional commits. $prTitle"
}
else {
  Throw "Error : Invalid commit message! $prTitle"
}
