# KernelSU - Hosts

**Adds a hosts file to block advertisements, trackers, etc.**

## Install
- Download **[latest release](https://github.com/SchweGELBin/hosts_kernelsu/releases/latest/download/KSU-Hosts.zip)**
- Flash via KernelSU Manager

## Apply
There are 2 options, how you can manage your hosts file:
### Uphosts
- Install a Terminal app like **[termux](https://github.com/termux/termux-app/releases/latest)**
- Run the command "uphosts"
- Choose your options to manage your hosts file:
```
# General
Help  - Show this message
Empty - Clear Hosts / Disable Hosts

Basic - StevenBlack's Unified hosts
Spark - StevenBlack's Unified hosts
        with all extensions except social
Full  - StevenBlack's Unified hosts
        with all extensions

Custom  - Customize hosts
Cleanup - Cleanup Hosts
Cancel  - Cancel this script
```
- Customize your hosts file
```
# Custom
Help   - Show this message
Single - Add a single host

Addon - Append to hosts file
Hosts - Replace hosts file

Cancel - Cancel this script
```
### App
- Install an App like **[AdAway](https://github.com/AdAway/AdAway/releases/latest)**
- Give that App root access via the KernelSU Manager
- Manage your hosts file with that app

## [Changelog](https://github.com/SchweGELBin/hosts_kernelsu/blob/master/CHANGELOG.md)

## Build
- Fork this repository
- Run Action "CI Build"

## Thanks / Credits
- **[AdAway](https://github.com/AdAway)** for **[AdAway](https://github.com/AdAway/AdAway)**
- **[symbuzzer](https://github.com/symbuzzer)** for the **[base](https://github.com/symbuzzer/systemless-hosts-KernelSU-module)**
- **[StevenBlack](https://github.com/StevenBlack)** for his **[hosts](https://github.com/StevenBlack/hosts)**
- **[termux](https://github.com/termux)** for its **[termux-app](https://github.com/termux/termux-app)**
- **[tiann](https://github.com/tiann)** for **[KernelSU](https://github.com/tiann/kernelsu)** and its Manager
