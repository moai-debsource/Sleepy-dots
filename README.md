<img src="https://github.com/archlinux/archinstall/raw/master/docs/logo.png" alt="Archinstall logo" width="200"/>

# Arch Installer (With dotfiles)

[![Install ▾](https://img.shields.io/badge/Install-▾-blue?style=for-the-badge&logo=download&logoColor=white)](https://github.com/NoSleepKid/archinstall-dotfiles#readme)

### A fork of [archinstall](https://github.com/archlinux/archinstall) that provides options to automatically install dotfiles from a repository, file, or our library.

## Installationd

Installing is pretty straight forward.  
Assuming you already have internet set up, installing Git is the first thing you need to do.

```bash
sudo pacman -S git
```
This installs Git using pacman for Arch.

Then, clone the repository:

```bash
git clone https://github.com/NoSleepKid/archinstall-dotfiles
```
This uses Git to download the contents of the package.

Then, cd into the folder:

```bash
cd archinstall-dotfiles
```
This changes your working directory to the folder.

Finally, run the command to install it, then run the guided installer:

```bash
makepkg -si
```
This copies the files to where they need to be so you can run it easily.

```bash
archinstall-dotfiles
```
This executes the guided installer.

And now from there, it is pretty simple to install Arch Linux.

## Making your own dotfile setup

To make your own dotfile that is able to be installed with the guided installer, you need to install the installer on an already existing install of Arch Linux.  
So if you have not installed archinstall-dotfiles, follow the installation guide just a couple sections up.

You should already have the files set up in a configuration. Just like this:

![Preview](Preview/prev_make1.png)

#### Make sure the `/home/[USER]` directory has `user` as the actual user directory. Just like this:

![Preview](Preview/prev_make2.png)

Use the `archinstall-dotfiles` command to make the file:

```bash
archinstall-dotfiles --make [PATH]
```
This makes use of the installed installer to make the file.

#### Make sure you replace `[PATH]` with your actual path of the folder, in this case, it is `/home/sleep/Documents/My Awesome Dotfile Configuration`.

Once the command has run, and the returned output said it completed successfully, this is what the directory should look like:

#### Inside of `origin` should be the original files the file was made with. And a `.installdot` file should be named. This is your completed file.

![Preview](Preview/prev_make3.png)

Now you are done, you can now publish that, or use it as is.

## Publishing your dotfile configuration to the library

Now you have made your file to publish, you actually need to publish your file to the dotfile library for other people to download and apply to their system.

1. First, **Fork** the `archinstall-dotfile-library` repository using [GitHub](https://github.com).

   Go to the repository:  
   [https://github.com/NoSleepKid/archinstall-dotfile-library](https://github.com/NoSleepKid/archinstall-dotfile-library)  
   and fork the repository.

   ![Preview](Preview/prev_pub1.png)  
   ![Preview](Preview/prev_pub2.png)

2. Then, clone your newly forked repository:

   ```bash
   git clone https://github.com/YOURUSERNAME/REPOSITORYNAME.git
   ```
   Replace `YOURUSERNAME` and `REPOSITORYNAME` with the real thing.

   ```bash
   cd REPOSITORYNAME
   ```
   Replace `REPOSITORYNAME` with your repository name.

3. Now, you can add your file to it using the publish TUI:

   ```bash
   archinstall-dotfiles --publish [PATH]
   ```
   Replace `[PATH]` with the path of your `.installdot` file.

4. Now, provide the info you want to place on the entry.  
   Provide the dotfiles name, maker display name, etc.

5. After your dotfile has been added to the library, issue a **pull request** to the library from your fork.

Within a couple days, or hours (it depends), your request should be accepted and your dotfile should appear in the library!
