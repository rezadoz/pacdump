# pacdump

### Script Description

This Bash script generates a list of explicitly installed packages on an Arch-based system. It prompts the user for confirmation, collects the package list via `pacman -Qe`, strips version numbers, and outputs the package names into a single-line formatted `.pacdump` file. The output file is named using the current user, hostname, and date.

### README

#### pacdump.sh

A utility script to capture a list of explicitly installed packages on your Arch Linux system.

##### Usage

```bash
bash pacdump.sh
```

##### What it does:

* Prompts for user confirmation
* Creates a file named `<user>_<hostname>_<date>.pacdump`
* Saves all explicitly installed package names (no versions) on a single line
* Provides instructions to reinstall them using `pacman` or an AUR helper like `yay`

##### Output example:

```
user_thinkpad_2025-05-30.pacdump
```

##### Note

If the package list includes AUR packages, use an AUR helper such as `yay` to reinstall them:

```bash
yay -Syu <contents of file>
```

![image](https://github.com/user-attachments/assets/f53132fb-5b17-41a1-871b-94ca4584090f)
