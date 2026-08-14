Foundations of Virtualization & Environnement Setup.

Part 1: Downloading Ubuntu as families of Linux

While servers in production are headless, starting with a desktop environnement allows you to easily copy configurations, read documentation inside the VM. and veryfy settings whyle my terminal skills are still developing.


Part 2: Installation

Restart the computer to enter the BIOS setup. Navigate to the CPU/Security settings and make sure AMD-V is enabled.

Downloading and installing Oracle VM VirtualBox, followed by creating a virtual machine with the following hardware allocation: 4 GB of RAM for the memory and 2 vCPUs.

The virtual machine didn't run well, i had failed and eror message : Out of memory : Killed process and Failed to stard gdm.service - Gnome Display Manager
Following this messages i have shut down the VM, open config setting, move the memory at 8 GB of RAM, i allocate two more processeror 2 to 4. When I restarted everything went well
I chosed normal instalatiion, Erase disk and install Ubuntu as Disk setup.

Part 3 Update

Opening of terminal window, command run 

sudo apt update && sudo apt upgrade -y