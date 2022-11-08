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


Patched fonts are needed to see icons:
Clone to separate folder then run install.sh or install.ps1

    git clone https://github.com/ryanoasis/nerd-fonts


If running on windows be sure to update to the lastest powershell (7+)


    winget search powershell
    winget install powershell -v <version> -s <source>


Then create a symbolic link at the $PROFILE location (just type $profile or use Get-Variable)


To get telescope live_grep to work be sure to add a the location of your downloaded ripgrep binary to your Path
    See github.com\BurntSushi\ripgrep\releases


.profile sets up some environmental variables for texlive... be sure to install it


TODO:
    - Fix nvim-tree close if last window open in tab. (Currently using keymaps for ZZ and ZQ)
    - Create a shortkey for vim-bbye's Bdelete
        - <leader> b d
            - buffer delete
    - Add autocmd for resetting indentexpr for .tex files
