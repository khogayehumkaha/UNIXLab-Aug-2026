<div align="center">

# 🐧 ISE – UNIX LAB PROGRAMS
### Shell Scripting & AWK &nbsp;|&nbsp; Programs **1a → 11b**

![Shell](https://img.shields.io/badge/Shell-POSIX%20sh%20%2F%20bash-4EAA25?logo=gnubash&logoColor=white)
![AWK](https://img.shields.io/badge/AWK-Text%20Processing-1f6feb)
![Platform](https://img.shields.io/badge/Platform-Ubuntu%20%2F%20Linux-E95420?logo=ubuntu&logoColor=white)
![Programs](https://img.shields.io/badge/Programs-22%20%2B%205%20alternates-success)

**Every program comes with: 📝 Problem statement · 🧾 Source code · ▶️ Run command · ✅ Sample output · 💡 How it works**

</div>

---

> 💡 **Simpler / alternate codes:** wherever you see a file such as `1aa.sh`, `6bb.sh`, `7aa.sh`, `10bb.awk` or `11aa.awk`, it is an **alternate solution** to the program with the single-letter name (`1a.sh`, `6b.sh`, `7a.sh`, `10b.awk`, `11a.awk`). They are shown in a collapsible **🔁 Alternate version** box under the main program.

## 📚 Program Index

| # | Aim (short) | Script | Alternate | Key concepts |
|---|-------------|--------|-----------|--------------|
| [1a](#p1a) | Largest file in a directory tree | `1a.sh` | `1aa.sh` | `ls -R`, `grep`, `cut`, `sort`, `$@` |
| [1b](#p1b) | Create every directory in a path (`a/b/c/d`) | `1b.sh` | – | `tr`, `mkdir`, `cd`, `for` |
| [2a](#p2a) | Compare permissions of two files | `2a.sh` | – | `ls -l`, `cut -c`, `[ = ]` |
| [2b](#p2b) | Home directory of given login names | `2b.sh` | – | `/etc/passwd`, `grep`, `cut -d` |
| [3a](#p3a) | Show file properties | `3a.sh` | – | `read`, `set --`, positional params, `file` |
| [3b](#p3b) | Terminal lock (like `lock`) | `3b.sh` | – | `stty -echo`, `trap`, `while` |
| [4a](#p4a) | Rename files to UPPERCASE | `4a.sh` | – | `tr`, `mv`, `-f` |
| [4b](#p4b) | Find all (hard) links of a file | `4b.sh` | – | inode, `ls -i`, `find -inum` |
| [5a](#p5a) | File creation (birth) time | `5a.sh` | – | `stat`, `grep`, `cut` |
| [5b](#p5b) | Calendar with today marked `*` / `**` | `5b.sh` | – | `date`, `cal`, `sed` |
| [6a](#p6a) | Find files by pattern, show & copy to `~/mydir` | `6a.sh` | – | `find`, `while read`, `cp` |
| [6b](#p6b) | Files whose name has ≥ 10 characters | `6b.sh` | `6bb.sh` | `expr length`, `basename`, `${var%.*}` |
| [7a](#p7a) | Greeting based on time of day | `7a.sh` | `7aa.sh` | `date +%H`, `if/elif`, `case` |
| [7b](#p7b) | Count words of file-1 in other files | `7b.sh` | – | nested `for`, `grep -iow`, `wc -l` |
| [8a](#p8a) | How long has a user been logged in | `8a.sh` | – | `loginctl`, `date -d`, `expr` |
| [8b](#p8b) | Wait for a user to log in (with timeout) | `8b.sh` | – | `sleep`, `while !`, `loginctl` |
| [9a](#p9a) | Display lines *m* to *n* of a file | `9a.sh` | – | `sed -n 'm,n p'`, `wc -l` |
| [9b](#p9b) | Fold long lines at 40 columns with `\` | `9b.sh` | – | `cut -c`, `expr length`, `while read` |
| [10a](#p10a) | Date `dd-mm-yyyy` → `Month,day,year` (with validation) | `10a.awk` | – | `split`, arrays, `exit` |
| [10b](#p10b) | Delete duplicate lines (keep order) | `10b.awk` | `10bb.awk` | arrays, `END`, `seen[$0]` |
| [11a](#p11a) | Books sold per discipline + grand total | `11a.awk` | `11aa.awk` | associative array, `printf` |
| [11b](#p11b) | Gross salary (Basic + HRA + DA) | `11b.awk` | – | `FS`, `BEGIN`, conditionals |

> 🎁 **Bonus demo scripts:** [`AAAA.sh`](#bonus) (`$@` vs `$*` and `-eq` vs `=`) and [`zzz.sh`](#bonus) (`$#`, `$@`, `$*`).

---

## ⚙️ Setup & How to Run


### 1️⃣  Run any program

Shell programs are run with `sh` (or `bash`) and AWK programs with `awk -f`:

```bash
sh   1a.sh  /home/student/Documents      # shell script + arguments
awk -f 11b.awk data.txt                  # awk script + input file
```

### 2️⃣ (Optional) make a script directly executable

```bash
chmod +x 1a.sh
./1a.sh /home/student/Documents
```

### 🧰 Requirements

| Requirement | Needed by | Notes |
|-------------|-----------|-------|
| Linux (Ubuntu recommended) or WSL | all | Lab outputs were recorded on Ubuntu (`student@student:~/Unix$`) |
| `sh` / `bash` | 1a – 9b | On Ubuntu `sh` is **dash**; the scripts are written to work in both |
| `awk` (`gawk` or `mawk`) | 10a – 11b | `sudo apt install gawk` |
| `cal`, `stat`, `file`, `find`, `sed` | 3a, 5a, 5b, 6a, … | Standard on most distros (`sudo apt install bsdmainutils` if `cal` is missing) |
| `systemd` / `loginctl` | 8a, 8b | Present on modern Ubuntu/Debian/Fedora. Not available on plain WSL1 / macOS |
| GNU `expr length` | 6b, 9b | Works on Linux (GNU coreutils). macOS/BSD `expr` has no `length` |

### 🗂️ Repository Structure

```text
.
├── README.md
│
├── 1a.sh   1aa.sh   1b.sh          # Program 1  (alt: 1aa)
├── 2a.sh   2b.sh                   # Program 2
├── 3a.sh   3b.sh                   # Program 3
├── 4a.sh   4b.sh                   # Program 4
├── 5a.sh   5b.sh                   # Program 5
├── 6a.sh   6b.sh   6bb.sh          # Program 6  (alt: 6bb)
├── 7a.sh   7aa.sh  7b.sh           # Program 7  (alt: 7aa)
├── 8a.sh   8b.sh                   # Program 8
├── 9a.sh   9b.sh                   # Program 9
├── 10a.awk 10b.awk 10bb.awk        # Program 10 (alt: 10bb)
├── 11a.awk 11aa.awk 11b.awk        # Program 11 (alt: 11aa)
│
├── AAAA.sh zzz.sh                  # bonus concept demos
└── words.txt file1.txt file2.txt test.txt duplicate.txt
    Books.txt Books1.txt data.txt aaa.txt ...   # sample input files
```

> ⚠️ Each script has its **usage / test commands as `#` comments on the first lines** — handy for quick revision before the lab exam.

---

<a id="p1a"></a>
# 🔐 Problem 1a:
Write a shell script that takes a valid directory name as an argument and recursively descends all the sub-directories, finds the maximum length of any file in that hierarchy and writes this maximum value to the standard output.

---

## 🧾 1a.sh  *(multiple directories as arguments)*

```bash
# Multiple Arguments
# sh 1a.sh /home/student/Downloads /home/student/Documents

for i in "$@"
do
    if [ -d "$i" ]
        then
            echo "Large file size is:"
            ls -Rl "$i" | grep "^-" | tr -s ' ' | cut -d ' ' -f 5,9 | sort -n | tail -1
        else
            echo "Not a directory"
        fi
done
```

## ▶️ : Run the Script

```bash
sh 1a.sh /home/student/Downloads /home/student/Documents
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 1a.sh /home/student/Downloads /home/student/Documents
Large file size is:
373575296 DesktopEditors_x64.exe
Large file size is:
16024 Student_List.txt
```

## 💡 How it works

- `for i in "$@"` – loops over **every** argument, so many directories can be checked in one run.
- `ls -Rl` – long listing, **R**ecursively; `grep "^-"` keeps only regular files (lines starting with `-`).
- `tr -s ' '` squeezes repeated spaces so `cut -d ' ' -f 5,9` picks the **size (field 5)** and **name (field 9)**.
- `sort -n | tail -1` – numeric sort, the last line is the largest file.

<details>
<summary><b>🔁 Alternate version: <code>1aa.sh</code> — single directory argument</summary>

Same logic, but only the first argument (`$1`) is checked.

```bash
# Single Argument
# sh 1aa.sh ~/Downloads

if [ -d "$1" ]
then
        echo "Large file size is:"
        ls -Rl "$1" | grep "^-" | tr -s ' ' | cut -d ' ' -f 5,9 | sort -n | tail -1
else
    echo "Not a directory"
fi
```

**▶️ Run:**

```bash
sh 1aa.sh /home/student/Downloads
```

**✅ Output:**

```text
student@student:~/Unix$ sh 1aa.sh /home/student/Downloads
Large file size is:
373575296 DesktopEditors_x64.exe
```

</details>

---
---

<a id="p1b"></a>
# 🔐 Problem 1b:
Write a shell script that accepts a path name and creates all the components in that path name as directories. For example, if the script is named `mpc`, then the command `mpc a/b/c/d` should create directories `a`, `a/b`, `a/b/c`, `a/b/c/d`.

---

## 🧾 1b.sh

```bash
# sh 1b.sh a/b
# sh 1b.sh a/b/c/d

if [ $# -eq 0 ]
then
    echo "No arguments"
else
curdir=`pwd`

for dir in `echo $1 | tr '/' ' '`
do
    if [ -d $dir ]
    then
            echo "$dir exists under `pwd`"
    else
            mkdir $dir
            echo "$dir created under `pwd`"
    fi
    cd $dir
done
cd $curdir
fi
```

## ▶️ : Run the Script

```bash
sh 1b.sh a/b
sh 1b.sh a/b/c/d
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 1b.sh a/b
a created under /home/student/Unix
b created under /home/student/Unix/a

student@student:~/Unix$ sh 1b.sh a/b/c/d
a exists under /home/student/Unix
b exists under /home/student/Unix/a
c created under /home/student/Unix/a/b
d created under /home/student/Unix/a/b/c
```

## 💡 How it works

- `tr '/' ' '` turns `a/b/c/d` into `a b c d` so the `for` loop gets one directory name at a time.
- For each name: **create it if it does not exist**, then `cd` into it so the next one is created *inside* it.
- `` curdir=`pwd` `` remembers the starting directory and `cd $curdir` brings you back at the end.

> ⚠️ Uses unquoted `$dir`, so directory names containing spaces are not supported.


---
---

<a id="p2a"></a>
# 🔐 Problem 2a:
Write a shell script that accepts two filenames as arguments, checks if the permissions for these files are identical and if the permissions are identical, output common permissions and otherwise output each filename followed by its permissions.

---

## 🧾 2a.sh

```bash
# touch a1 a2
# sh 2a.sh a1 a2
# chmod 755 a1
# chmod u+x a2
# sh 2a.sh a1 a2

if [ $# -ne 2 ]
then
    echo "Enter two filenames"
else
    p1=`ls -l "$1" | cut -c 2-10`
    p2=`ls -l "$2" | cut -c 2-10`

    if [ "$p1" = "$p2" ]
    then
        echo "Common permissions: "
    else
        echo "Different permissions:"
    fi
    echo "$1 : $p1"
    echo "$2 : $p2"
fi
```

## ▶️ : Run the Script

```bash
touch a1 a2
sh 2a.sh a1 a2        # same permissions
chmod 755 a1
chmod u+x a2
sh 2a.sh a1 a2        # different permissions
```

## ✅ Sample Output

```text
student@student:~/Unix$ touch a1 a2
student@student:~/Unix$ sh 2a.sh a1 a2
Common permissions:
a1 : rw-rw-r--
a2 : rw-rw-r--

student@student:~/Unix$ chmod 755 a1
student@student:~/Unix$ chmod u+x a2
student@student:~/Unix$ sh 2a.sh a1 a2
Different permissions:
a1 : rwxr-xr-x
a2 : rwxrw-r--
```

## 💡 How it works

- `$#` is the number of arguments – the script insists on exactly **2**.
- `ls -l file | cut -c 2-10` extracts characters 2–10 of the listing = the 9 permission characters (`rwxrwxrwx`), skipping the file-type character.
- `=` is used for **string** comparison of the two permission strings.


---
---

<a id="p2b"></a>
# 🔐 Problem 2b:
Write a shell script which accepts valid log-in names as arguments and prints their corresponding home directories, if no arguments are specified, print a suitable error message.

---

## 🧾 2b.sh

```bash
# sh 2b.sh student nmamit shree root

if [ $# -eq 0 ]
then
    echo "No login names specified"
    exit
fi

for user in "$@"
do
    home=`grep "^$user:" /etc/passwd  |  cut -d : -f 6`

    if [  "$home" != "" ]
        then
            echo "$user : $home"
        else
            echo "$user : Invalid login name"
        fi
done
```

## ▶️ : Run the Script

```bash
sh 2b.sh student nmamit shree root
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 2b.sh student nmamit shree root
student : /home/student
nmamit : /home/nmamit
shree : Invalid login name
root : /root
```

## 💡 How it works

- User information lives in `/etc/passwd` as `login:x:UID:GID:comment:home:shell`.
- `grep "^$user:"` matches the line that **starts with** the login name, and `cut -d : -f 6` picks the **6th field = home directory**.
- If `grep` finds nothing, `$home` is empty → "Invalid login name".


---
---

<a id="p3a"></a>
# 🔐 Problem 3a:
Create a script file called `file-properties` that reads a filename entered and outputs its properties.

---

## 🧾 3a.sh

```bash
# sh 3a.sh

echo "Enter the file name"
read file

if [ -f "$file" ]
then
    set -- ` ls -l "$file" `

    echo "File permission : $1"
    echo "Number of links  : $2"
    echo "User name        : $3"
    echo "Group name       : $4"
    echo "File size        : $5 bytes"
    echo "Date of modification : $6 $7"
    echo "Time of modification : $8"
    echo "Name of file     : $9"
    echo "Type : `file -b "$file"`"
    ls -l "$file"
else
    echo "File does not exist"
fi
```

## ▶️ : Run the Script

```bash
sh 3a.sh
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 3a.sh
Enter the file name
2b.sh
File permission : -rw-rw-r--
Number of links  : 1
User name        : student
Group name       : student
File size        : 279 bytes
Date of modification : Aug 25
Time of modification : 20:27
Name of file     : 2b.sh
Type : ASCII text
-rw-rw-r-- 1 student student 279 Aug 25 20:27 2b.sh
```

## 💡 How it works

- `` set -- `ls -l "$file"` `` splits the long listing into the **positional parameters** `$1 … $9`:

| Param | Meaning | Param | Meaning |
|-------|---------|-------|---------|
| `$1` | permissions | `$6 $7` | month & day |
| `$2` | link count | `$8` | time |
| `$3` | owner | `$9` | file name |
| `$4` | group | `file -b` | file type |
| `$5` | size in bytes | | |


---
---

<a id="p3b"></a>
# 🔐 Problem 3b:
Write a shell script to implement terminal locking (similar to the `lock` command). It should prompt the user for a password. After accepting the password entered by the user, it must prompt again for the matching password as confirmation and if a match occurs, it must lock the keyboard until a matching password is entered again by the user. Note that the script must be written to disregard BREAK, Control-D. No time limit needs to be implemented for the lock duration.

---

## 🧾 3b.sh

```bash
# sh 3b.sh

clear

echo "Enter password:"
stty -echo
read pass1
stty echo

echo "Confirm password:"
stty -echo
read pass2
stty echo

while [ "$pass1" != "$pass2" ]
do
       echo "Password does not match"
        echo "Confirm password again:"
        stty -echo
        read pass2
        stty echo
done

trap '' 2 3
echo "Terminal is locked"
echo "Enter password to unlock:"

stty -echo
read pass3
stty echo

while [ "$pass3" != "$pass1" ]
do
        echo
        echo "Invalid password"
        echo "Enter password again:"
        stty -echo
        read pass3
        stty echo
done

echo
echo "Terminal unlocked"
```

## ▶️ : Run the Script

```bash
sh 3b.sh
```

## ✅ Sample Output

> The passwords you type are **not displayed** on screen (`stty -echo`).

```text
student@student:~/Unix$ sh 3b.sh
Enter password:
Confirm password:
Terminal is locked
Enter password to unlock:

Invalid password
Enter password again:

Terminal unlocked
```

## 💡 How it works

- `stty -echo` hides typed characters; `stty echo` turns echo back on.
- The `while [ "$pass1" != "$pass2" ]` loop repeats the confirmation until both passwords match.
- `trap '' 2 3` **ignores signals 2 (SIGINT – Ctrl+C) and 3 (SIGQUIT – Ctrl+\\)**, so the lock cannot be broken with BREAK.
- Ctrl+D just gives an empty password, which never equals the real one, so the loop keeps asking.
- The terminal only gets "unlocked" when `pass3` equals `pass1`.


---
---

<a id="p4a"></a>
# 🔐 Problem 4a:
Write a shell script that accepts one or more file names as arguments and converts all of them to uppercase, provided they exist in the current directory.

---

## 🧾 4a.sh

```bash
# touch aa bb
# ls
# sh 4a.sh aa bb cc
# ls

for file in "$@"
do
    if [ -f $file ]
    then
            ufile=`echo "$file" | tr "a-z" "A-Z"`
            if [ -f $ufile ]
            then
              echo "$ufile exists"
            else
              mv $file $ufile
            fi
    else
            echo "$file does not exist"
    fi
done
```

## ▶️ : Run the Script

```bash
touch aa bb
ls
sh 4a.sh aa bb cc
ls
```

## ✅ Sample Output

```text
student@student:~/Unix$ touch a b
student@student:~/Unix$ sh 4a.sh a b c
c does not exist                    # a → A and b → B were renamed silently

student@student:~/Unix$ touch a b   # create them again while A and B already exist
student@student:~/Unix$ sh 4a.sh a b c
A exists
B exists
c does not exist
```

## 💡 How it works

- `tr "a-z" "A-Z"` converts the file name to upper case.
- If the upper-case name is **already taken**, the script prints "`... exists`" instead of overwriting it; otherwise `mv` renames the file.
- Names that are not existing regular files print "`... does not exist`".


---
---

<a id="p4b"></a>
# 🔐 Problem 4b:
Write a shell script that displays all the links to a file specified as the first argument to the script. The second argument, which is optional, can be used to specify in which the search is to begin. If this second argument is not present, the search is to begin in the current working directory. In either case, the starting directory as well as all its subdirectories at all levels must be searched. The script need not include any error checking.

---

## 🧾 4b.sh

```bash
# touch a.txt
# sh 4b.sh a.txt
# ln a.txt b.txt
# sh 4b.sh a.txt
# sh 4b.sh a.txt /home/student


file="$1"

if [ $# -eq 1 ]
then
        dir=.
else
        dir="$2"
fi

if [ -f "$file" ]
then
    set -- `ls -l "$file"`
    lcount="$2"

    if [ "$lcount" -eq 1 ]
    then
            echo "No other links"
    else
            set -- `ls -i "$file"`
            inode="$1"
            find "$dir" -xdev -inum "$inode" -print
    fi
else
        echo "File does not exist"
fi
```

## ▶️ : Run the Script

```bash
echo "This is a test file" > a.txt
sh 4b.sh a.txt                      # only one link
ln a.txt /home/student/aa.txt       # create a hard link
sh 4b.sh a.txt /home/student        # search from /home/student
```

## ✅ Sample Output

```text
student@student:~/Unix$ echo "This is a test file" > a.txt
student@student:~/Unix$ sh 4b.sh a.txt
No other links
student@student:~/Unix$ ln a.txt /home/student/aa.txt
student@student:~/Unix$ sh 4b.sh a.txt /home/student
/home/student/Unix/a.txt
/home/student/aa.txt
```

## 💡 How it works

- The **2nd field of `ls -l`** is the *link count*. If it is `1`, nothing else points to the file.
- Hard links share the **same inode number**, which `ls -i` prints.
- `find "$dir" -xdev -inum "$inode" -print` walks the directory tree and lists every path with that inode (`-xdev` stays on one file-system, since inodes are only unique per file-system).


---
---

<a id="p5a"></a>
# 🔐 Problem 5a:
Write a shell script that accepts the filename as argument and displays its creation time if the file exists and if it does not send an output error message.

---

## 🧾 5a.sh

```bash
#!/bin/sh
# sh 5a.sh 4b.sh

if [ -f "$1" ]
then
    echo "File Name : $1"
        echo "Creation Time : `stat "$1" | grep "Birth" | cut -d ' ' -f 3,4,5`"
else
    echo "File does not exist"
fi
```

## ▶️ : Run the Script

```bash
sh 5a.sh 4b.sh
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 5a.sh 4b.sh
File Name : 4b.sh
Creation Time : 2026-08-25 21:02:34.325449913 +0530

student@student:~/Unix$ sh 5a.sh nofile.txt
File does not exist
```

## 💡 How it works

- `stat file` prints a `Birth:` line containing the creation time; `grep "Birth"` selects it and `cut -d ' ' -f 3,4,5` keeps the date, time and time-zone.
- Requires a recent `stat` (coreutils ≥ 8.31) and a file-system that stores birth time (e.g. ext4). Otherwise it shows `Birth: -`.


---
---

<a id="p5b"></a>
# 🔐 Problem 5b:
Write a shell script to display the calendar for the current month with the current date replaced by `*` or `**` depending on whether the date has one digit or two digits.

---

## 🧾 5b.sh

```bash
#!/bin/sh
# sh 5b.sh

set -- `date`
day="$3"

if [ $day -le 9 ]
then
    cal | sed "s/ $day / * /"
else
    cal | sed "s/ $day / ** /"
fi
```

## ▶️ : Run the Script

```bash
sh 5b.sh
```

## ✅ Sample Output

*(run on 25-Aug-2026)*

```text
student@student:~/Unix$ sh 5b.sh
    August 2026
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 ** 26 27 28 29
30 31
```

## 💡 How it works

- `` set -- `date` `` splits the output of `date` (`Tue Aug 25 …`) into parameters, so **`$3` is the day of month**.
- One-digit day (`-le 9`) → replaced by `*`, two-digit day → replaced by `**` (the replacement has the same width as the date, so the calendar stays aligned).
- `sed "s/ $day / * /"` needs a space on both sides of the date to avoid touching other numbers (such as the year).

> ⚠️ **Known limitation:** because the pattern needs a trailing space, a date that is the *last item on a line* (a Saturday) may not be replaced if your `cal` does not pad lines with trailing spaces.


---
---

<a id="p6a"></a>
# 🔐 Problem 6a:
Write a shell script to find file/s that match a pattern given as command line argument in the home directory, display the contents of the file and copy the file into the directory `~/mydir`.

---

## 🧾 6a.sh

```bash
#!/bin/sh
# cat > ISE3.txt
# sh 6a.sh ISE3.txt
# ls ~/mydir/


pattern="$1"
dest="$HOME/mydir"

if [ ! -d "$dest" ]
then
    mkdir -p "$dest"
fi

find "$HOME" -type f -name "$pattern" -print | while read file
do
    echo "File found: $file"
    echo "-------------------------"

    cat "$file"

    echo "-------------------------"
    cp "$file" "$dest"

    echo "$file copied to $dest"
done
```

## ▶️ : Run the Script

```bash
echo "Hello NMAMIT" > /home/student/wordzz.txt
sh 6a.sh "wordzz.txt"
ls ~/mydir/
```

## ✅ Sample Output

```text
student@student:~/Unix$ echo "Hello NMAMIT" > /home/student/wordzz.txt
student@student:~/Unix$ sh 6a.sh "wordzz.txt"
File found: /home/student/wordzz.txt
-------------------------
Hello NMAMIT
-------------------------
/home/student/wordzz.txt copied to /home/student/mydir
```

## 💡 How it works

- `mkdir -p` creates `~/mydir` only if it is missing.
- `find "$HOME" -type f -name "$pattern"` searches the **whole home tree** for regular files matching the pattern; the result is piped to `while read file`.
- For each match: print its name, `cat` the contents, then `cp` it into `~/mydir`.
- Pass wildcard patterns **in quotes** (`sh 6a.sh "*.txt"`) so the shell doesn't expand them before the script sees them.


---
---

<a id="p6b"></a>
# 🔐 Problem 6b:
Write a shell script to list all the files in a directory whose filename is at least 10 characters. (use `expr` command to check the length)

---

## 🧾 6b.sh

```bash
#!/bin/sh
# checks present directory
# touch 10characterfile.txt
# sh 6b.sh .



if [ -d "$1" ]
then
    for file in "$1"/*
    do
        if [ -f "$file" ]
        then
            bname=`basename "$file"`
            name="${bname%.*}"
            len=`expr length "$name"`

            if [ "$len" -ge 10 ]
            then
                echo "$bname"
            fi
        fi
    done
else
    echo "Directory does not exist"
fi
```

## ▶️ : Run the Script

```bash
touch 10characterfile.txt
sh 6b.sh .                       # present directory
sh 6b.sh /home/student
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 6b.sh /home/student
10characterfile.txt
duplicatedata.txt
```

## 💡 How it works

- `${bname%.*}` removes the extension – so only the **name part** is measured:

| Part | Meaning |
|------|---------|
| `${bname ... }` | look at the value stored in `$bname` (e.g. `document.txt`) |
| `%` | cut matching text from the **right** (the end) of the string |
| `.*` | the pattern: a literal dot followed by anything |

- `expr length "$name"` gives the number of characters; `-ge 10` keeps names with **10 or more**.

<details>
<summary><b>🔁 Alternate version: <code>6bb.sh</code> — same logic, with explanatory comments</summary>

Identical to `6b.sh`, but the directory is passed as an argument and every step is commented.

```bash
#!/bin/sh
#pass folder as argument
# sh 6bb.sh /home/student/Documents

if [ -d "$1" ]
then
    for file in "$1"/*
    do
        if [ -f "$file" ]
        then
            # Extract filename, then strip the extension
            bname=`basename "$file"`
            name="${bname%.*}"

            # Get the length of the name without extension
            len=`expr length "$name"`

            if [ "$len" -ge 10 ]
            then
                echo "$bname"
            fi
        fi
    done
else
    echo "Directory does not exist"
fi
```

**▶️ Run:**

```bash
sh 6bb.sh /home/student/Documents
```

</details>

---
---

<a id="p7a"></a>
# 🔐 Problem 7a:
Write a shell script that gets executed and displays the message either "Good Morning" or "Good Afternoon" or "Good Evening" or "Good Night" depending upon the time at which the user logs in.

---

## 🧾 7a.sh

```bash
#!/bin/sh
# sh 7a.sh


hour=` date +%H `

if [ $hour -ge 0 ] && [ $hour -lt 12 ]
then
        echo "Good Morning $LOGNAME"
elif [ $hour -ge 12 ] && [ $hour -lt 17 ]
then
        echo "Good Afternoon $LOGNAME"
elif [ $hour -ge 17 ] && [ $hour -lt 20 ]
then
        echo "Good Evening $LOGNAME"
else
        echo "Good Night $LOGNAME"
fi
```

## ▶️ : Run the Script

```bash
sh 7a.sh
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 7a.sh
Good Night student
```

## 💡 How it works

| Hour (24h) | Message |
|-----------|---------|
| 00 – 11 | Good Morning |
| 12 – 16 | Good Afternoon |
| 17 – 19 | Good Evening |
| 20 – 23 | Good Night |

- `date +%H` returns the current hour; `$LOGNAME` is the logged-in user.
- `[ cond1 ] && [ cond2 ]` combines two tests.
- 💡 *To greet automatically at every login, add `sh /path/to/7a.sh` to `~/.profile`.*

<details>
<summary><b>🔁 Alternate version: <code>7aa.sh</code> — using <code>case</code></summary>

Same program written with a `case` statement and hour patterns.

```bash
#!/bin/bash
# sh 7aa.sh

hour=` date +%H `

case $hour in
    0[0-9]|1[0-1])
        echo "Good Morning $LOGNAME"
        ;;
    1[2-6])
        echo "Good Afternoon $LOGNAME"
        ;;
    1[789])
        echo "Good Evening $LOGNAME"
        ;;
    2[0-3])
        echo "Good Night $LOGNAME"
        ;;
esac


# 0[0-9]|1[0-1] → 00–09 or 10–11
# 1[2-6] → 12–16
```

**▶️ Run:**

```bash
sh 7aa.sh
```

**✅ Output:**

```text
student@student:~/Unix$ sh 7aa.sh
Good Night student
```

`0[0-9]|1[0-1]` → 00–11 &nbsp;|&nbsp; `1[2-6]` → 12–16 &nbsp;|&nbsp; `1[789]` → 17–19 &nbsp;|&nbsp; `2[0-3]` → 20–23

</details>

---
---

<a id="p7b"></a>
# 🔐 Problem 7b:
Write a shell script that accepts a list of filenames as its argument, count and report occurrence of each word that is present in the first argument file on other argument files.

---

## 🧾 7b.sh

```bash
#!/bin/sh
# sh 7b.sh words.txt file1.txt file2.txt

if [ $# -lt 2 ]
then
    echo "Usage: 7b.sh wordfile.txt file1.txt file2.txt ..."
else
    for word in `cat "$1"`
    do
            for file in "$@"
            do
                if [ "$file" != "$1" ]
                then
                        count=`grep -iow "$word" "$file" | wc -l`
                        echo "$word : $file : $count"
                fi
            done
    done
fi
```

## 🧾 Input files

```bash
cat > words.txt        # hello / world / linux  (one word per line)
cat > file1.txt
cat > file2.txt
```

| `words.txt` | `file1.txt` | `file2.txt` |
|-------------|-------------|-------------|
| `hello` | `Hello world welcome to unix` | `hello students` |
| `world` | | `lets start the linux executions, starting with hello world` |
| `linux` | | |

## ▶️ : Run the Script

```bash
sh 7b.sh words.txt file1.txt file2.txt
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 7b.sh words.txt file1.txt file2.txt
hello : file1.txt : 1
hello : file2.txt : 2
world : file1.txt : 1
world : file2.txt : 1
linux : file1.txt : 0
linux : file2.txt : 1
```

## 💡 How it works

- Outer loop: each **word** of the first file (`` for word in `cat "$1"` ``).
- Inner loop: every argument except the first file itself.
- `grep -iow "$word" file` → `-i` ignore case, `-o` print **each match on its own line**, `-w` whole words only; `wc -l` counts those lines.


---
---

<a id="p8a"></a>
# 🔐 Problem 8a:
Write a shell script that determines the period for which a specified user is working on the system and display appropriate messages.

---

## 🧾 8a.sh

```bash
#!/bin/sh
# sh 8a.sh


echo "Enter login name:"
read user

session=`loginctl list-sessions --no-legend | grep " $user " | head -n 1`

if [ -z "$session" ]
then
        echo "$user is not logged in"
else

    sid=`echo "$session" | cut -d ' ' -f 1`

    login_time=`loginctl show-session "$sid" -p Timestamp --value`

    start=`date -d "$login_time" +%s`
    now=`date +%s`
    diff=`expr $now - $start`
    hours=`expr $diff / 3600`
    minutes=`expr \( $diff % 3600 \) / 60`
    echo "$user is working for $hours hours and $minutes minutes"
fi
```

## ▶️ : Run the Script

```bash
sh 8a.sh
```

## ✅ Sample Output

```text
student@student:~/Unix$ sh 8a.sh
Enter login name:
student
student is working for 1 hours and 38 minutes

student@student:~/Unix$ sh 8a.sh
Enter login name:
shree
shree is not logged in
```

## 💡 How it works

- `loginctl list-sessions` lists active login sessions; `grep " $user "` finds the user's session and `cut -d ' ' -f 1` takes the **session id**.
- `loginctl show-session <id> -p Timestamp --value` gives the login time.
- Login time and `date +%s` are converted to **seconds since 1970**; their difference is split into hours (`/ 3600`) and minutes (`% 3600 / 60`) with `expr`.

> ℹ️ Needs `systemd` (`loginctl`). 


---
---

<a id="p8b"></a>
# 🔐 Problem 8b:
Write a shell script that reports the logging in of a specified user within one minute after he/she logs in. The script automatically terminates if the specified user does not log in during a specified period of time.

---

## 🧾 8b.sh

```bash
#!/bin/sh
# sh 8b.sh


echo -n "Enter login name: "
read user

echo -n "Enter time in minutes: "
read min

count=0
seconds=`expr $min \* 60`

while ! loginctl list-sessions --no-legend | grep -w "$user" > /dev/null
do
sleep 5
count=`expr $count + 5`
echo "Waiting $user to login . . ."

    if [ $count -ge $seconds ]
        then
            echo "$user has not logged in within $min minutes"
        exit
    fi
done

echo "$user has logged in"
```

## ▶️ : Run the Script

```bash
sh 8b.sh
```

## ✅ Sample Output

**Case 1 – user is already logged in**

```text
student@student:~/Unix$ sh 8b.sh
Enter login name: student
Enter time in minutes: 1
student has logged in
```

**Case 2 – user logs in while the script is waiting** *(open another terminal and run `su test`)*

```text
student@student:~/Unix$ sh 8b.sh
Enter login name: test
Enter time in minutes: 1
Waiting test to login . . .
Waiting test to login . . .
test has logged in
```

**Case 3 – user never logs in** → the script gives up after the specified time

```text
Waiting test to login . . .
...
test has not logged in within 1 minutes
```

## 💡 How it works

- The `while ! loginctl list-sessions ... | grep -w "$user"` loop keeps running **as long as the user is not logged in**.
- Every pass sleeps 5 seconds and adds 5 to `count`. When `count` reaches `min × 60` seconds the script prints a time-out message and `exit`s.


---
---

<a id="p9a"></a>
# 🔐 Problem 9a:
Write a shell script that accepts the filename, starting and ending line number as an argument and displays all the lines between the given line numbers.

---

## 🧾 9a.sh

```bash
#!/bin/sh
# sh 9a.sh test.txt 3 5

if [ $# -ne 3 ]
then
    echo "Invalid number of arguments"
    exit
fi

lines=`cat "$1" | wc -l `

if [ $2 -le 0 ] || [ $3 -le 0 ] || [ $2 -gt $3 ] ||
[ $3 -gt $lines ]
then
    echo "Invalid input"
    exit
fi

sed -n "$2,$3 p" "$1"
```

## ▶️ : Run the Script

```bash
cat > test.txt          # Line 1 ... Line 7 (press Ctrl+D to save)
sh 9a.sh test.txt 3 5
```

## ✅ Sample Output

```text
student@student:~/Unix$ cat test.txt
Line 1
Line 2
Line 3
Line 4
Line 5
Line 6
Line 7
student@student:~/Unix$ sh 9a.sh test.txt 3 5
Line 3
Line 4
Line 5

student@student:~/Unix$ sh 9a.sh test.txt 5 3
Invalid input
```

## 💡 How it works

- Validates: exactly **3 arguments**, both line numbers > 0, start ≤ end, and end ≤ total lines (`wc -l`).
- `sed -n "$2,$3 p"` prints (`p`) only lines in the range and suppresses everything else (`-n`).


---
---

<a id="p9b"></a>
# 🔐 Problem 9b:
Write a shell script that folds long lines into 40 columns. Thus any line that exceeds 40 characters must be broken after the 40th, a `\` is to be appended as the indication of folding and the processing is to be continued with the residue. The input is to be supplied through a text file created by the user.

---

## 🧾 9b.sh

```bash
#!/bin/sh
# sh 9b.sh

echo "Enter file name:"
read file

while read line
do
    len=`expr length "$line"`
    while [ $len -gt 40 ]
        do
            echo "`echo "$line" | cut -c 1-40 ` "'\'
            line=`echo "$line" | cut -c 41-`
            len=`expr length "$line"`
        done
        echo "$line"

done < "$file"
```

## ▶️ : Run the Script

```bash
cat > file2.txt
sh 9b.sh
```

## ✅ Sample Output

```text
student@student:~/Unix$ cat file2.txt
hello students
lets start the linux executions, starting with hello world
student@student:~/Unix$ sh 9b.sh
Enter file name:
file2.txt
hello students
lets start the linux executions, startin \
g with hello world
```

## 💡 How it works

- Reads the file **line by line** (`while read line … done < "$file"`).
- While the remaining text is longer than 40 characters: print the first 40 (`cut -c 1-40`) followed by `\`, then keep the rest (`cut -c 41-`).
- The final part (≤ 40 characters) is printed as it is.
- 🧪 `aaa.txt` in this repo contains very long lines – good for testing: enter `aaa.txt` when prompted.


---
---

<a id="p10a"></a>
# 🔐 Problem 10a:
Write an awk script that accepts date arguments in the form of dd-mm-yy and displays it in the form month, day and year. The script should check the validity of the argument and in the case of error, display a suitable message.

---

## 🧾 10a.awk

```awk
# echo "18-08-2026" | awk -f 10a.awk
# or   awk -f 10a.awk
# 18-08-2026

{
    split($0, d, "-")

    if (d[1] < 1 || d[1] > 31 || d[2] < 1 || d[2] > 12)
    {
        print "Invalid date"
        exit
    }

    days[1]=31; days[2]=28;  days[3]=31;  days[4]=30;
    days[5]=31; days[6]=30;  days[7]=31;  days[8]=31;
    days[9]=30; days[10]=31; days[11]=30; days[12]=31;

    if (d[1] > days[d[2]+0])
    {
        print "Invalid date"
        exit
    }

    month[1]="January"; month[2]="February"; month[3]="March";
    month[4]="April";   month[5]="May";      month[6]="June";
    month[7]="July";    month[8]="August";   month[9]="September";
    month[10]="October"; month[11]="November"; month[12]="December";

    print month[d[2]+0] "," d[1] "," d[3]
    exit
}
```

## ▶️ : Run the Script

```bash
echo "18-08-2026" | awk -f 10a.awk
# or type the date interactively
awk -f 10a.awk
```

## ✅ Sample Output

```text
student@student:~/Unix$ echo "30-02-2026" | awk -f 10a.awk
Invalid date
student@student:~/Unix$ echo "18-08-2026" | awk -f 10a.awk
August,18,2026
student@student:~/Unix$ awk -f 10a.awk
18-09-2026
September,18,2026
```

## 💡 How it works

- `split($0, d, "-")` breaks the input into `d[1]=day`, `d[2]=month`, `d[3]=year`.
- First check: day in 1–31 and month in 1–12. Second check: day ≤ number of days in that month (`days[]` array).
- `month[]` maps the month number to its name; `d[2]+0` converts `"08"` to the number `8`.

> ⚠️ February is fixed at 28 days, so leap-year dates such as `29-02-2028` are reported invalid.


---
---

<a id="p10b"></a>
# 🔐 Problem 10b:
Write an awk script to delete duplicated lines from a text file. The order of the original lines must remain unchanged.

---

## 🧾 10b.awk

```awk
# awk -f 10b.awk duplicate.txt

{
    line[++n] = $0
}

END {
    for (i = 1; i <= n; i++)
    {
        flag = 1
        for (j = 1; j < i; j++)
        {
            if (line[i] == line[j])
                flag = 0
        }

        if (flag == 1)
        {
            print line[i]
            print line[i] > "out10b.txt"
        }
    }
}
```

## ▶️ : Run the Script

```bash
cat > duplicate.txt
awk -f 10b.awk duplicate.txt
cat out10b.txt
```

## ✅ Sample Output

```text
student@student:~/Unix$ cat duplicate.txt
Line 1
Line 2
Line 1
Line 3
Line 2
student@student:~/Unix$ awk -f 10b.awk duplicate.txt
Line 1
Line 2
Line 3
student@student:~/Unix$ cat out10b.txt
Line 1
Line 2
Line 3
```

## 💡 How it works

- Main block stores every line in `line[1..n]`.
- `END` block: a line is printed only if **no earlier line** (`j < i`) is equal to it – so the first occurrence stays and order is preserved. Unique lines also go to `out10b.txt`.

<details>
<summary><b>🔁 Alternate version: <code>10bb.awk</code> — faster, using an associative array</summary>

Remembers each line in `seen[]`; a line is printed only the first time it is seen (one pass, no nested loops).

```awk
# awk -f 10b.awk duplicate.txt

{
    if (!seen[$0])
    {
        print $0
        print $0 > "out10b.txt"
        seen[$0] = 1
    }
}
```

**▶️ Run:**

```bash
awk -f 10bb.awk duplicate.txt
```

> 🧠 One-liner equivalent: `awk '!seen[$0]++' duplicate.txt`

</details>

---
---

<a id="p11a"></a>
# 🔐 Problem 11a:
Write an awk script to find out the total number of books sold in each discipline as well as total books sold using an associative array for the table given below.

| Books1.txt |
|------------|
| Electrical 34 |
| Mechanical 67 |
| Electrical 80 |
| Computer_Science 43 |
| Mechanical 65 |
| Civil 98 |
| Computer_Science 64 |

---

## 🧾 11a.awk

```awk
# awk -f 11a.awk Books1.txt
# awk -f 11aa.awk Books1.txt | sort

BEGIN {
    print"TOTAL NUMBER OF BOOKS SOLD IN EACH CATEGORY"
}

{
    books [$1]+=$2
}

END {
    for(item in books)
    {
        printf("\t%-17s %1s %-5d\n", item, "=",books[item])
        total+=books[item]
    }
    printf("%-17s %1s %-5s\n", "Total Books Sold","=", total)
}
```

## ▶️ : Run the Script

```bash
awk -f 11a.awk Books1.txt
```

## ✅ Sample Output

```text
student@student:~/Unix$ cat Books1.txt
Electrical 34
Mechanical 67
Electrical 80
Computer_Science 43
Mechanical 65
Civil 98
Computer_Science 64
student@student:~/Unix$ awk -f 11a.awk Books1.txt
TOTAL NUMBER OF BOOKS SOLD IN EACH CATEGORY
    Civil             = 98
    Mechanical        = 132
    Electrical        = 114
    Computer_Science  = 107
Total Books Sold  = 451
```

## 💡 How it works

- `BEGIN` runs **once before** any input is read → prints the heading.
- `books[$1] += $2` – the **associative array** is indexed by the discipline (field 1) and accumulates the count (field 2).
- `END` runs **once after** all input → loops with `for (item in books)`, prints with `printf` (`%-17s` = left-aligned in 17 columns) and adds up `total`.
- The order of `for (item in books)` is **not** the file order – awk stores keys in a hash table.

> ⚠️ This version needs the discipline to be **one word** (`Computer_Science`). With a space (`Computer Science`) it would treat `Science` as the number – use the alternate below.

<details>
<summary><b>🔁 Alternate version: <code>11aa.awk</code> — handles multi-word disciplines (e.g. <code>Computer Science</code>)</summary>

The last field (`$NF`) is the count; everything before it is joined to form the discipline name.

```awk
# awk -f 11aa.awk Books.txt
# awk -f 11aa.awk Books.txt | sort

BEGIN {
    print("TOTAL NUMBER OF BOOKS SOLD IN EACH CATEGORY")
}

{
    item = $1
    for (i = 2; i < NF; i++)
        item = item " " $i

    books[item] += $NF
}

END {
    for (item in books)
    {
        printf("\t%-17s = %-5d\n", item, books[item])
        total += books[item]
    }

    printf("\t%-17s = %-5d\n", "Total Books Sold", total)
}





# The BEGIN block runs exactly once before any data rows from Books.txt are read.

# • item = $1: It starts by assigning the first field (word) of the line to a variable called item.
# • for (i = 2; i < NF; i++):
#   This loop handles multi-word category names (like "Computer Science").
#   It iterates from the second field up to the second-to-last field
#   (NF stands for Number of Fields, and NF - 1 is the upper limit since i < NF).
#   It appends these intermediate words to item separated by a space.
#   • books[item] += $NF: $NF represents the very last field on the line, which contains the numerical count of books sold.
#   This value is added to an associative array called books, using the category name (item) as the unique key.

#  •  block runs exactly once after the entire input file has been processed.
#  • for (item in books): Loops through each unique book category stored in the books array.
#  • printf("\t%-17s = %-5d\n", item, books[item]): Prints the category name left-aligned to 17 spaces (%-17s) and its respective sum right-aligned to 5 spaces (%-5d), preceded by a tab character (\t).
#  • total += books[item]: Dynamically tracks and updates the grand total of all books sold across all categories.
#  • The final printf statement outputs the cumulative Total Books Sold metric matching the table alignment.
```

**▶️ Run:**

```bash
awk -f 11aa.awk Books.txt
awk -f 11aa.awk Books.txt | sort      # sorted by discipline
```

**✅ Output:**

```text
student@student:~/Unix$ cat Books.txt
Electrical 34
Mechanical 67
Electrical 80
Computer Science 43
Mechanical 65
Civil 98
Computer Science 64
student@student:~/Unix$ awk -f 11aa.awk Books.txt
TOTAL NUMBER OF BOOKS SOLD IN EACH CATEGORY
    Civil             = 98
    Mechanical        = 132
    Electrical        = 114
    Computer Science  = 107
    Total Books Sold  = 451
```

- `item = $1; for (i = 2; i < NF; i++) item = item " " $i` → builds the multi-word key.
- `books[item] += $NF` → adds the **last field** (the count).
- `for (item in books)` does not sort the keys (hash table order) – pipe through `sort` to get them in alphabetical order.

</details>

---
---

<a id="p11b"></a>
# 🔐 Problem 11b:
Write an awk script to compute the gross salary of an employee according to the rule given below.

- If basic salary is `< 10000` then **HRA = 15%** of basic & **DA = 45%** of basic.
- If basic salary is `>= 10000` then **HRA = 20%** of basic & **DA = 50%** of basic.

---

## 🧾 11b.awk

```awk
# awk -f 11b.awk data.txt

BEGIN {
    FS=":"
}

{
    basic = $5
    if (basic < 10000)
    {
        hra = basic * 0.15
        da = basic * 0.45
    }
    else
    {
        hra = basic * 0.20
        da = basic * 0.50
    }
    gross = basic + hra + da

    print "Employee:", $2
    print "Basic Salary:", basic
    print "HRA:", hra
    print "DA:", da
    print "Gross Salary:", gross
    print "-----------------------------"
}
```

## 🧾 data.txt  *(format `id:name:designation:department:basic`)*

```text
1:Shree:Programmer:ISE:8000
2:Ramesh:Professor:ISE:12000
```

## ▶️ : Run the Script

```bash
awk -f 11b.awk data.txt
```

## ✅ Sample Output

```text
student@student:~/Unix$ awk -f 11b.awk data.txt
Employee: Shree
Basic Salary: 8000
HRA: 1200
DA: 3600
Gross Salary: 12800
-----------------------------
Employee: Ramesh
Basic Salary: 12000
HRA: 2400
DA: 6000
Gross Salary: 20400
-----------------------------
```

## 💡 How it works

- `BEGIN { FS=":" }` sets the **field separator** to `:` before reading the file → `$2` = name, `$5` = basic salary.
- Rule applied per line: `Gross = Basic + HRA + DA`.
  - Shree: 8000 + 15% (1200) + 45% (3600) = **12800**
  - Ramesh: 12000 + 20% (2400) + 50% (6000) = **20400**


---
---

<a id="bonus"></a>
# 🎁 Bonus: Concept Demo Scripts

### 🧾 AAAA.sh — `$@` vs `$*`, and `-eq` vs `=`

```bash
echo "with $ @ : \n"
for a in $@
do
    echo $a
done


echo "\n \n with $ @ quotes : \n"
for a in "$@"
do
    echo $a
done


echo "\n \n with $ *  : \n"
for a in $*
do
    echo $a
done


echo "\n \n with $ *  quotes : \n"
for a in "$*"
do
    echo $a
done


# sh AAAA.sh apple "banana grape" orange

#   $*   "apple" "banana" "grape" "orange"
#   $@   "apple" "banana" "grape" "orange"
#  "$*"  "apple banana grape orange"
#  "$@"  "apple" "banana grape" "orange"

b=2
c=2
d=3

s1="hello"
s2="hello"
s3="hello1"

if [ $b = $c ]
then
    echo "a b integer same"
else
    echo "a b are diff"
fi

if [ $b -eq $c ]
then
    echo "a b integer same"
else
    echo "a b are diff"
fi


if [ $s1 = $s2 ]
then
    echo "s1 s2 text same"
else
    echo "s1 s2 text are diff"
fi

if [ $s1 -eq $s2 ]
then
    echo "s1 s2 text  same"
else
    echo "s1 s2 text are diff"
fi
```

```bash
sh AAAA.sh apple "banana grape" orange
```

| Expression | What the loop receives |
|-----------|------------------------|
| `$*` | `apple` `banana` `grape` `orange` *(re-split on spaces)* |
| `$@` | `apple` `banana` `grape` `orange` *(re-split on spaces)* |
| `"$*"` | `apple banana grape orange` *(ONE single word)* |
| `"$@"` | `apple` `banana grape` `orange` *(each argument kept intact)* ✅ |

> ✅ **Rule of thumb:** use **`"$@"`** to loop over arguments – it is the only form that keeps arguments containing spaces intact (that is why `1a.sh`, `2b.sh` and `4a.sh` use it).

| Test | Used for | Example |
|------|----------|---------|
| `-eq -ne -lt -le -gt -ge` | **numbers** | `[ $b -eq $c ]` |
| `=` `!=` | **strings** (also works on digits) | `[ "$s1" = "$s2" ]` |

Using `-eq` on text such as `hello` gives an *"integer expression expected"* error and the `else` branch runs – the last block of `AAAA.sh` demonstrates this.

### 🧾 zzz.sh — special parameters

```bash
echo $#
echo $@
echo $*
```

```bash
sh zzz.sh a "b c"
```
```text
2          # $#  → number of arguments
a b c      # $@  → all arguments
a b c      # $*  → all arguments
```

---

## 🗃️ Sample Input Files in this Repo

| File(s) | Used by | Contents / purpose |
|---------|---------|--------------------|
| `a1`, `a2` | 2a | empty files to compare permissions |
| `AA`, `BB` | 4a | files created by running `4a.sh` (already upper-case) |
| `a.txt`, `b.txt` | 4b | `b.txt` is a hard link of `a.txt` |
| `10characterfile.txt` | 6b | empty file with a 15-character name |
| `a/b/c/d/` | 1b | directory tree created by `1b.sh` |
| `words.txt`, `file1.txt`, `file2.txt` | 7b, 9b | word list and two text files |
| `test.txt` | 9a | `Line 1` … `Line 7` |
| `aaa.txt` | 9b | very long lines to test 40-column folding |
| `duplicate.txt`, `out10b.txt` | 10b | input with repeated lines / de-duplicated output |
| `Books1.txt` | 11a | `Computer_Science` (one-word names) |
| `Books.txt` | 11aa | `Computer Science` (multi-word names) |
| `data.txt` | 11b | `id:name:designation:dept:basic` records |

---

## 🛠️ Troubleshooting

| Problem | Fix |
|---------|-----|
| `Permission denied` when running `./1a.sh` | Run with `sh 1a.sh`, or `chmod +x 1a.sh` first |
| `Syntax error: "(" unexpected` / `[[: not found` | You ran a bash script with `sh` – use `bash scriptname.sh` |
| `awk: command not found` | `sudo apt install gawk` |
| `loginctl: command not found` (8a/8b) | Your system does not use `systemd` – run on Ubuntu/Debian or a full Linux VM |
| 5a shows `Birth: -` or empty time | Your file-system/`stat` doesn't record creation time – try on ext4 with a recent Ubuntu |
| Script fails on file names with spaces | Several lab scripts keep things simple and don't quote every variable – rename the file |

---

## 🎯 Quick Revision Cheat-Sheet

| Command | Purpose | Programs |
|---------|---------|----------|
| `$#`, `$@`, `$*`, `$1…` | argument count / all args / positional | 1a, 2a, 4a, 7b, 9a |
| `read var` | read input | 3a, 3b, 8a, 8b, 9b |
| `` set -- `cmd` `` | split a command's output into `$1,$2,…` | 3a, 4b, 5b |
| `cut -d -f / -c` | pick fields / characters | 1a, 2a, 2b, 5a, 9b |
| `tr` | translate / squeeze characters | 1a, 1b, 4a |
| `grep`, `sed` | search / stream edit | 2b, 5b, 7b, 9a |
| `find` | search file tree | 4b, 6a |
| `expr` | arithmetic & string length | 6b, 8a, 8b, 9b |
| `stty -echo`, `trap` | hide input / ignore signals | 3b |
| `loginctl`, `date` | session & time info | 7a, 8a, 8b |
| `awk` arrays, `BEGIN/END`, `FS`, `printf` | text processing | 10a – 11b |

---

<div align="center">

### ⭐ If this repo helped you in your lab, give it a star!

Made with ❤️ for **ISE – UNIX Lab** &nbsp;|&nbsp; Happy Scripting 🐧

</div>
