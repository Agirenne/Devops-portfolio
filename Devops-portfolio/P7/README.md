ps                # show processes running in the current shell
ps aux            # show all running processes with detailed information
top               # monitor processes, CPU, and memory in real time
htop              # interactive and easier-to-read version of top
pgrep bash        # find the PID of processes matching a name
kill PID          # stop a process using its PID
killall nginx     # stop all processes with a specific name
jobs              # show background jobs started from the current shell
fg                # bring a background job back to the foreground

PID and PPID

PID = Process ID

A PID is a unique number Linux gives to every running process.

foreground      → terminal waits for the process
background &    → terminal remains available
SIGTERM 15      → graceful shutdown
SIGKILL 9       → immediate forced shutdown
nohup           → keep a task running after disconnect