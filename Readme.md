# Interactivegitadd

## Installation
Clone the repository:

`git clone git@github.com:syerad/interactiveGitAdd.git`

Make the executable accessible from every path

`sudo ln -s /path/to/repo/build/interactiveGitAdd /usr/local/bin`

or add the `interactiveGitadd/build` folder to your `PATH`

If the binary is not working properly for your system
try to run the `interactiveGitadd.sh` from the src folder instead of using the binary.

## Usage

Use the command `interactiveGitAdd` within a git repository. Then a select box with all files which can be added to the staging area apear.
Select an item by pressing the appropriate number shown in the menu. This will toggle the chosen file. Choosing the option `Done` will finish the the selection and all selected items will be added to the staging area.

## Todo
Mutlilanguage support
Build version for different kind of systems (currently the build is only workin on debian system)
