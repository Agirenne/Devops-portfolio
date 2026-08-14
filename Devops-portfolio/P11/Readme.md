ARCHIVING, COMPRESSION & FILE TRANSFER – SUMMARY

Archiving vs Compression:
- tar = archives multiple files/directories into one file. It does NOT compress by itself.
- gzip = compresses data to reduce its size.
- tar + gzip = creates a compressed archive, usually with .tar.gz or .tgz.

Common tar flags:
-c = create an archive
-x = extract an archive
-z = use gzip compression
-v = verbose, show files being processed
-f = specify the archive filename
-C = change to a specific directory before performing the operation

Common commands:
tar -cvzf archive.tar.gz folder/
→ Create a gzip-compressed archive.

tar -xzvf archive.tar.gz
→ Extract a gzip-compressed archive.

tar -tzvf archive.tar.gz
→ List the contents without extracting them.

zip file.zip folder/
→ Create a ZIP archive and compress it.

unzip file.zip
→ Extract a ZIP archive.

SCP vs RSYNC:
- scp = securely copies files/directories between machines. Simple, but usually copies the data again.
- rsync = synchronizes directories efficiently by transferring only changed data.

rsync -avz:
-a = archive mode; preserves permissions, ownership, timestamps, etc.
-v = verbose output
-z = compress data during transfer

rsync -avz --delete source/ destination/
→ Synchronizes the destination with the source.
→ Only changed/new files are transferred.
→ --delete removes files from the destination that no longer exist in the source.
→ This creates an exact mirror of the source directory.

Important commands:
scp file user@host:/path/
→ Securely copy a file to another machine.

rsync -avz source/ user@host:/path/
→ Efficiently synchronize a directory with a remote machine.

Key idea:
tar = archive
gzip = compress
zip = archive + compress
scp = copy
rsync = synchronize efficiently
