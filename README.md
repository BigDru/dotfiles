Windows:
Be sure to create a symbolic link at ~/AppData/Local/nvim to ~/.config/nvim

    New-Item -Path ~\AppData\Local\nvim -ItemType SymbolicLink -Value <repo_location>\.config\nvim

Linux: 

    ln -s ~/git/dotfiles/.config/nvim ~/.config/nvim


Support for packer is required:
Windows:
    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

Linux:

    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
