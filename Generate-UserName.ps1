Function Generate-UserName
{
Param
(
    [parameter(Mandatory = $false)]
    [String] $Prefix,

    [parameter(Mandatory = $true)]
    [String] $FirstName,

    [parameter(Mandatory = $true)]
    [String] $LastName,

    [parameter(Mandatory = $false)]
    [Int] $FirstNameLength = 2,

    [parameter(Mandatory = $false)]
    [Int] $LastNameLength = 2
 )

    if($FirstNameLength -gt $FirstName.Length){
        $FirstNameLength = $FirstName.Length
    }
    else{
        #Do nothing
    }
    
    if($LastNameLength -gt $LastName.Length){
        $LastNameLength = $LastName.Length
    }
    else{
        #Do nothing
    }
    
    $UserName = $Prefix + $FirstName.Substring(0,$FirstNameLength) + $LastName.Substring(0,$LastNameLength)
    $UserName = $UserName.ToLower()
    $UserName = Convert-ToLatinCharacters -inputString $UserName
    
    Return $UserName
}

Function Convert-ToLatinCharacters 
{
Param
(
    [parameter(Mandatory = $true)]
    [String] $inputString
)
[Text.Encoding]::ASCII.GetString([Text.Encoding]::GetEncoding("Cyrillic").GetBytes($inputString))
}