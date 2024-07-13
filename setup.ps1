$source = "./"
$destination = "~/.config/dotfiles"

# Expand the destination path
$destination = [System.Environment]::ExpandEnvironmentVariables($destination)
Write-Output $destination

# Check if the destination directory exists, if not, create it
if (!(Test-Path -Path $destination)) {
    New-Item -ItemType Directory -Force -Path $destination
}

# Copy the dotfiles folder to the destination
Copy-Item -Path "$source*" -Destination $destination -Recurse -Force


$dotfilesDirectories = Get-ChildItem -Path $destination -Directory

foreach ($directory in $dotfilesDirectories) {
    if ($dir.Name -notMatch '^\..*') {
        $installScriptPath = Join-Path -Path $directory.FullName -ChildPath "install/install.ps1"

        if (Test-Path -Path $installScriptPath) {
            Write-Output "Running install script for $directory"
            & $installScriptPath $destination
            #            Invoke-Expression -Command $installScriptPath
        }
    }
}
