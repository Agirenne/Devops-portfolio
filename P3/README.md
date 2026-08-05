1. Navigation
pwd                              # Show the full path of the current directory
cd directory                     # Enter a directory
cd P2/labs/app-config            # Enter a directory using a relative path
cd /workspaces/Devops-portfolio  # Enter a directory using an absolute path
cd ..                            # Go back to the parent directory
cd ../..                         # Go back two parent directories
Absolute and relative paths
cd /workspaces/Devops-portfolio/P2  # Absolute path: starts from the Linux root /
cd P2/labs/app-config                # Relative path: starts from your current location

A path beginning with / works regardless of your current location. A relative path only works when the requested directory exists inside your current location.

2. Listing files and directories
ls                               # List files and directories
ls -l                            # List files with detailed information
ls -la                           # Include hidden files and detailed information
ls -ld directory                 # Show information about the directory itself

Example output:

-rw-r--r-- 1 codespace codespace 0 Aug 5 09:00 app.py
-rw-r--r--                       # File permissions
codespace                        # File owner
codespace                        # File group
0                                # File size in bytes
Aug 5 09:00                      # Last modification date
app.py                           # File name
3. Creating directories
mkdir P3                         # Create one directory
mkdir P3 logs backup             # Create several directories
mkdir -p P3/labs/config          # Create the full directory structure
mkdir -v P3                      # Display the directory being created
mkdir -pv P3/labs/config         # Create parents and display each operation
mkdir -m 700 private-directory   # Create a directory with specific permissions

-p means parents. It creates any missing parent directories and does not produce an error if the directories already exist.

4. Creating files
touch app.py                     # Create an empty file
touch server.conf database.env   # Create several empty files
touch app.py                     # Update the modification time if the file exists

Example:

touch server.conf database.env app.py

This creates three empty files in the current directory.

5. Displaying file contents
cat file                         # Display the complete content of a file
cat logs/sample.log              # Display the complete log file

Be careful with large files: cat displays everything at once.

6. Finding files and directories
find P2                          # Show everything inside P2
find P2 -type d                  # Show directories only
find P2 -type f                  # Show files only

Example:

find P2 -type d

Possible result:

P2
P2/labs
P2/labs/app-config
7. Copying files and directories with cp
cp source destination            # Copy a file
cp app.py app-backup.py          # Copy and rename a file
cp app.py backup/                # Copy a file into another directory
cp file1 file2 backup/           # Copy several files into one directory
cp -r labs labs-backup           # Copy a directory and all its contents
cp -v app.py backup/             # Display the copy operation
cp -i app.py backup/             # Ask before overwriting an existing file
cp -n app.py backup/             # Do not overwrite an existing file
cp -rv labs labs-backup          # Copy recursively and display operations
cp -rnv labs/ labs-backup/       # Recursive, no overwrite, verbose

Important difference:

cp app.py backup/                # The original file remains in place

For directories, cp normally requires -r, meaning recursive.

8. Moving and renaming with mv
mv old-name new-name             # Rename a file or directory
mv app.py application.py         # Rename a file
mv app.py backup/                # Move a file into a directory
mv app.py backup/application.py  # Move and rename a file
mv file1 file2 backup/           # Move several files
mv labs exercises                # Rename a directory
mv labs backup/                  # Move a directory and all its contents
mv -v app.py backup/             # Display the operation
mv -i app.py backup/             # Ask before overwriting
mv -n app.py backup/             # Never overwrite an existing file
mv -iv app.py backup/            # Interactive and verbose

Important difference:

cp app.py backup/                # Copy: the original remains
mv app.py backup/                # Move: the original disappears from its old location

Unlike cp, mv does not need -r to move a directory.

9. Creating number sequences with seq
seq 1 50                         # Display the numbers from 1 to 50
seq 5 10                         # Display the numbers from 5 to 10
seq 1 2 10                       # Count from 1 to 10 with a step of 2

Example:

seq 1 2 10

Result:

1
3
5
7
9
10. Output redirection
command > file                   # Write output into a file and replace its content
command >> file                  # Add output to the end of a file

Examples:

seq 1 50 > logs/sample.log       # Replace the file with numbers from 1 to 50
seq 51 100 >> logs/sample.log    # Add numbers from 51 to 100
echo "New line" >> sample.log    # Add one line of text

Important:

>                                # Replaces existing content
>>                               # Keeps existing content and adds new content

The destination directory must already exist:

mkdir -p logs
seq 1 50 > logs/sample.log
11. Reading the beginning and end of a file
head file                        # Display the first 10 lines
head -n 5 file                   # Display the first 5 lines
head -5 file                     # Short form: display the first 5 lines
head -c 20 file                  # Display the first 20 bytes
tail file                        # Display the last 10 lines
tail -n 5 file                   # Display the last 5 lines
tail -5 file                     # Short form: display the last 5 lines
tail -n +20 file                 # Display everything starting from line 20
tail -c 20 file                  # Display the last 20 bytes
tail -f file                     # Follow new lines added to the file in real time

To stop tail -f:

Ctrl + C                         # Stop the running command

tail -f is especially useful in DevOps for monitoring application and server logs.

12. Counting lines
wc -l file                       # Count the number of lines
wc -w file                       # Count the number of words
wc -c file                       # Count the number of bytes

Example:

wc -l logs/sample.log

Possible result:

50 logs/sample.log
13. Using a pipe
command1 | command2              # Send the output of command1 to command2

Examples:

ls -l | head -n 5                # Show only the first 5 lines of ls -l
git log | head -n 10             # Show only the first 10 lines of Git history
cat sample.log | tail -n 5       # Show the last 5 lines of the file

The symbol | is called a pipe.

Git Commands
14. Checking the repository status
git status                       # Show modified, staged and untracked files

Possible states:

Untracked files                  # New files that Git is not tracking yet
Changes not staged               # Modified files not added to staging
Changes to be committed          # Files ready for the next commit
Working tree clean               # No uncommitted changes
15. Adding files to staging
git add file                     # Stage one file
git add P2/                      # Stage everything inside P2
git add .                        # Stage changes from the current directory downward
git add README.md app.py         # Stage several specific files

The meaning of . depends on your current location:

cd /workspaces/Devops-portfolio/P2
git add .                        # Stage changes inside P2
cd /workspaces/Devops-portfolio
git add .                        # Stage changes in the entire repository

Git tracks files, not empty directories. An empty directory will not appear on GitHub unless it contains a file such as .gitkeep.

16. Creating a commit
git commit -m "message"          # Create a local commit with a message

Example:

git commit -m "docs: complete P2 Linux filesystem navigation lab"

Useful commit prefixes:

docs:                            # Documentation changes
feat:                            # New feature
fix:                             # Bug fix
refactor:                        # Code restructuring
test:                            # Tests
chore:                           # Maintenance or configuration

A commit is a local snapshot of the staged changes.

17. Sending commits to GitHub
git push                         # Push to the configured remote branch
git push origin main             # Push the local main branch to origin

Meaning:

git push                         # Send commits
origin                           # Name of the remote GitHub repository
main                             # Name of the branch

Before git push, the commit exists only in your local Git environment. After the push, it is available on GitHub.

18. Viewing remote repository information
git remote -v                    # Display remote repository addresses
git remote get-url origin        # Display the URL of origin
gh repo view --web               # Open the current GitHub repository in a browser

Be careful:

gh repo view --web               # Correct: GitHub CLI command
git repo view --web              # Incorrect: repo is not a Git command
19. Typical Git workflow
git status                       # Check current changes
git add .                        # Stage the changes
git status                       # Verify what will be committed
git commit -m "docs: add lab"    # Create the local commit
git push origin main             # Send the commit to GitHub
git status                       # Confirm that everything is synchronized
Important reminders
Bash                             # Usually a code-block label, not a command to type
/                                # Linux root directory
.                                # Current directory
..                               # Parent directory
../..                            # Two parent directories above
~                                # Current user's home directory

Always check your current location before using relative paths:

pwd                              # Where am I?
ls                               # What is here?

A safe habit before copying, moving, deleting or staging files is:

pwd
ls -la
git status