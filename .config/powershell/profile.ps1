echo "PowerShell 7 Profile Loaded"
echo ""

$env:Dev = 'C:\Users\Dru\Dropbox\Dev\'
$env:Config = 'C:\Users\Dru\Dropbox\Dev\Experiments\DevBox\dotfiles\.config\'

set-alias ll         get-childitem

function help
{
    get-help $args[0] | out-host -paging
}

function man
{
    get-help $args[0] | out-host -paging
}

& {
    for ($i = 0; $i -lt 26; $i++)
    {
        $funcname = ([System.Char]($i+65)) + ':'
        $str = "function global:$funcname { set-location $funcname } "
        invoke-expression $str
    }
}

<# git_tools setup #>
Remove-Alias -Force -Name  gl
Remove-Alias -Force -Name  gc
$env:Path += ';C:\Users\Dru\Dropbox\Dev\Tools\git_tools\powershell\'
