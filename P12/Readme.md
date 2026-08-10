LINUX USERS & SUDO – SUMMARY

Principle of Least Privilege:
Users should have only the permissions they need to perform their tasks. Running everything as root is dangerous because a mistake or malicious command can modify or delete critical system files.

su vs sudo:
- su → switches to another user and starts a new shell. Usually requires the target user's password.
- sudo → runs a specific command with another user's privileges, usually root. It is safer because privileges can be limited to specific commands.

Sudoers rule syntax:
USER HOST=(RUNAS) OPTIONS: COMMANDS

Example:
deployer ALL=(ALL) NOPASSWD: /usr/bin/apt update

Meaning:
- deployer → user
- ALL → allowed on all hosts
- (ALL) → can run as any user
- NOPASSWD → no password required
- /usr/bin/apt update → allowed command

visudo:
visudo is used to safely edit sudoers configuration. It checks the syntax before saving, helping prevent errors that could break sudo access.

/etc/sudoers.d/:
This directory contains separate "drop-in" sudoers files for custom rules. It keeps custom permissions isolated instead of modifying the main /etc/sudoers file.

Useful commands:
whoami → displays the current username.
id → displays the user's UID, GID, and group memberships.
sudo -l → lists the current user's sudo privileges.
sudo visudo → safely edits the main sudoers file.
sudo -u user COMMAND → runs a command as another user.

Examples:
whoami
id
sudo -l
sudo visudo
sudo -u deployer whoami
