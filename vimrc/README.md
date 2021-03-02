# Installing my setup for vim.
This is an short overview on how to install my system.
``` BASH
$ ./setup.sh -i       # To itstall the vim system
$ ./setup.sh -c       # To clean the setup from the system
```

Basic overview of the file structure:
```
/
./README.md # This file
./setup.sh  # The install script
./vimrc     # The .vimrc file that is symlikned to the root.
./bytevim   # Al the spesific setups is stored in this directory.
   |--> functions.vim           # Custom functions
   |--> navigation.vim          # Basic navigation kees
   |--> scriptnames.vim         # Provides :Scriptname function for debugging vim
   |--> sets.vim                # Set x stuff
   |--> taglist.vim
   |--> vim-airline_setup.vim   # Vim air line setup
   |--> vimautocmd.vim          # Filetype and auto commands
   |--> vimconfig.vim           # Other vim configs
   |--> vimmappings.vim         # Mapping of the keeyboard in nommal and visual mode.
   |--> vimspector_mapping.vim  # Spsific keymapping for vimspector debugger.
```
## Revisions
2021-03-02
Splinted the files in to smaller parts so that the setup is easier to maintain.
