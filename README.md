Be sure to create a symbolic link at ~/AppData/Local/nvim to ~/.config/nvim

    New-Item -Path ~\AppData\Local\nvim -ItemType SymbolicLink -Value <repo_location>\.config\nvim
