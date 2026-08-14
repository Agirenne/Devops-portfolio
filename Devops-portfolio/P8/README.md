Command	Purpose	Important details
df -h	Shows disk space usage for mounted filesystems.	-h means human-readable. It displays sizes in KB, MB, GB instead of raw blocks.
du -sh	Shows the total disk space used by a file or directory.	-s = summary only, -h = human-readable. Useful to find large folders.
free -m	Shows RAM and swap memory usage.	-m displays values in MB. Pay attention to available memory, not only free.
lsblk	Lists block devices such as disks and partitions.	Shows disks, partitions, sizes, types, and mount points. Very useful before mounting or formatting disks.
uptime	Shows how long the system has been running and its load average.	Also shows the number of logged-in users and CPU load over 1, 5, and 15 minutes.
nproc	Shows the number of CPU processing units available.	Usually corresponds to the number of logical CPU cores available to the system/container.


df = filesystem usage
du = file/directory usage
free = RAM and swap
lsblk = disks and partitions
uptime = uptime + system load
nproc = available logical CPUs