oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/capr4n.omp.json" | Invoke-Expression

# Remove "dir" command powershell directory background-color
$PSStyle.FileInfo.Directory = "`e[38;2;255;255;255m"

# Alias

Set-Alias v nvim
Set-Alias vi nvim
Set-Alias vim nvim

Set-Alias ll dir

function CompanyProject { set-location "D:/Company" }
Set-Alias comp CompanyProject

function NvimConfig { set-location "C:\Users\fheld\AppData\Local\nvim" }
Set-Alias nvimconf NvimConfig

# Ctrl + F를 fzf로 바인딩
Set-PSReadLineKeyHandler -Chord Ctrl+f -ScriptBlock {
  $result = Invoke-Expression "fzf"
    if ($result) {
      [Microsoft.PowerShell.PSConsoleReadLine]::Insert($result)
    }
}

# which
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
