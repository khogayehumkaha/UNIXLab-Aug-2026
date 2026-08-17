# 💻 UNIX Lab Programs -- 3rd Semester ISE -- 2026

> **UNIX / Shell Scripting / AWK Lab Programs**\
> A clean, student-friendly collection of UNIX laboratory programs with
> source code, execution commands, sample input, and expected output.

------------------------------------------------------------------------

## 📚 Contents

-   [About](#-about)
-   [Requirements](#-requirements)
-   [How to Run](#-how-to-run)
-   [Shell Script Programs](#-shell-script-programs)
    -   [1A -- Maximum File Size](#1a--maximum-file-size)
    -   [1B -- Create Directory Path](#1b--create-directory-path)
    -   [2A -- File Permission
        Comparison](#2a--file-permission-comparison)
    -   [2B -- Login Name and Home
        Directory](#2b--login-name-and-home-directory)
    -   [3A -- File Properties](#3a--file-properties)
    -   [3B -- Terminal Lock](#3b--terminal-lock)
    -   [4A -- Convert Filenames to
        Uppercase](#4a--convert-filenames-to-uppercase)
    -   [4B -- Find Links to a File](#4b--find-links-to-a-file)
    -   [5A -- Display File Creation
        Time](#5a--display-file-creation-time)
    -   [5B -- Current Calendar with Highlighted
        Date](#5b--current-calendar-with-highlighted-date)
    -   [6A -- Find, Display and Copy Matching
        Files](#6a--find-display-and-copy-matching-files)
    -   [6B -- Files with at Least 10
        Characters](#6b--files-with-at-least-10-characters)
    -   [7A -- Greeting Based on Time](#7a--greeting-based-on-time)
    -   [7B -- Word Frequency in Files](#7b--word-frequency-in-files)
    -   [8A -- User Working Time](#8a--user-working-time)
    -   [8B -- Monitor User Login](#8b--monitor-user-login)
    -   [9A -- Display Selected Lines](#9a--display-selected-lines)
    -   [9B -- Fold Long Lines to 40
        Columns](#9b--fold-long-lines-to-40-columns)
-   [AWK Programs](#-awk-programs)
    -   [10A -- Date Validation and
        Formatting](#10a--date-validation-and-formatting)
    -   [10B -- Remove Duplicate Lines](#10b--remove-duplicate-lines)
    -   [11A -- Books Sold by
        Discipline](#11a--books-sold-by-discipline)
    -   [11B -- Gross Salary
        Calculation](#11b--gross-salary-calculation)
-   [🧠 Quick Revision](#-quick-revision)
-   [⚠️ Important Notes](#️-important-notes)

------------------------------------------------------------------------

## 🎯 About

This repository contains the UNIX laboratory programs for **3rd Semester
Information Science & Engineering (ISE)**.

The programs cover:

-   🐚 Shell scripting
-   📁 File and directory operations
-   🔐 File permissions and terminal control
-   👤 User and login information
-   🔎 Searching and text processing
-   📅 Date and calendar operations
-   ⏱️ Time-based scripts
-   📊 AWK associative arrays and calculations

The examples are intentionally kept **simple and practical-oriented**,
making them suitable for lab practice and viva preparation.

------------------------------------------------------------------------

## 🛠️ Requirements

Recommended environment:

``` text
Ubuntu Linux
POSIX Shell / Bash
AWK
GNU core utilities
```

Check your environment:

``` bash
uname -a
bash --version
awk --version
```

Make a script executable:

``` bash
chmod +x filename.sh
```

Run a shell script:

``` bash
./filename.sh
```

or:

``` bash
sh filename.sh
```

Run an AWK script:

``` bash
awk -f filename.awk input.txt
```

------------------------------------------------------------------------

# 🐚 Shell Script Programs

## 1A -- Maximum File Size

### 🎯 Objective

Accept a directory name and recursively search its hierarchy to find the
largest file.

### 🧾 `1a.sh`

``` bash
#!/bin/bash

if [ -d "$1" ]
then
    echo "Large file size is:"
    ls -Rl "$1" | grep "^-" | tr -s ' ' | cut -d ' ' -f 5,9 | sort -n | tail -1
else
    echo "Not a directory"
fi
```

### ▶️ Execution

``` bash
sh 1a.sh .
```

------------------------------------------------------------------------

## 1B -- Create Directory Path

### 🎯 Objective

Create all directory components in a path such as:

``` text
a/b/c/d
```

### 🧾 `1b.sh`

``` bash
#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Enter one path name"
    exit
fi

curdir=$(pwd)

for dir in $(echo "$1" | tr "/" " ")
do
    if [ -d "$dir" ]
    then
        echo "$dir exists under $(pwd)"
    else
        mkdir "$dir"
        echo "$dir created under $(pwd)"
    fi
    cd "$dir"
done

cd "$curdir"
```

### ▶️ Execution

``` bash
sh 1b.sh a/b/c/d
```

------------------------------------------------------------------------

## 2A -- File Permission Comparison

### 🎯 Objective

Compare the permissions of two files. If they are identical, display the
common permissions; otherwise display both permissions.

### 🧾 `2a.sh`

``` bash
#!/bin/sh

if [ $# -ne 2 ]
then
    echo "Enter two filenames"
    exit
fi

p1=$(ls -l "$1" | cut -c 2-10)
p2=$(ls -l "$2" | cut -c 2-10)

if [ "$p1" = "$p2" ]
then
    echo "Common permissions: $p1"
else
    echo "Different permissions:"
    echo "$1 : $p1"
    echo "$2 : $p2"
fi
```

### ▶️ Execution

``` bash
touch file1.txt file2.txt
chmod 644 file1.txt
chmod 644 file2.txt

sh 2a.sh file1.txt file2.txt
```

------------------------------------------------------------------------

## 2B -- Login Name and Home Directory

### 🎯 Objective

Accept login names as arguments and display their corresponding home
directories.

### 🧾 `2b.sh`

``` bash
#!/bin/sh

if [ $# -eq 0 ]
then
    echo "No login names specified"
    exit 1
fi

for user in "$@"
do
    home=$(grep "^$user:" /etc/passwd | cut -d: -f6)

    if [ -n "$home" ]
    then
        echo "$user : $home"
    else
        echo "$user : Invalid login name"
    fi
done
```

### ▶️ Execution

``` bash
sh 2b.sh shree root
```

------------------------------------------------------------------------

## 3A -- File Properties

### 🎯 Objective

Read a filename and display its properties.

### 🧾 `3a.sh`

``` bash
#!/bin/sh

echo "Enter the file name"
read file

if [ -f "$file" ]
then
    set -- `ls -l "$file"`

    echo "File permission : $1"
    echo "Number of links  : $2"
    echo "User name        : $3"
    echo "Group name       : $4"
    echo "File size        : $5 bytes"
    echo "Date of modification : $6 $7"
    echo "Time of modification : $8"
    echo "Name of file     : $9"
else
    echo "File does not exist"
fi
```

### ▶️ Execution

``` bash
sh 3a.sh
```

------------------------------------------------------------------------

## 3B -- Terminal Lock

### 🎯 Objective

Create a terminal lock using a password. The script ignores **Ctrl+C**
and \*\*Ctrl+\*\* and remains locked until the correct password is
entered.

### 🧾 `3b.sh`

``` bash
#!/bin/sh

clear

trap '' 2 3

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

### ▶️ Execution

``` bash
sh 3b.sh
```

------------------------------------------------------------------------

## 4A -- Convert Filenames to Uppercase

### 🎯 Objective

Accept one or more filenames and rename existing files using uppercase
filenames.

### 🧾 `4a.sh`

``` bash
#!/bin/sh

for file in "$@"
do
    if [ -f "$file" ]
    then
        new=$(echo "$file" | tr "a-z" "A-Z")
        mv "$file" "$new"
    else
        echo "$file does not exist"
    fi
done
```

### ▶️ Execution

``` bash
touch hello.txt test.txt
sh 4a.sh hello.txt test.txt
```

------------------------------------------------------------------------

## 4B -- Find Links to a File

### 🎯 Objective

Find all hard links to a specified file. An optional second argument
specifies the directory from which the search begins.

### 🧾 `4b.sh`

``` bash
#!/bin/sh

file=$1

if [ $# -eq 1 ]
then
    dir=.
else
    dir=$2
fi

set -- $(ls -l "$file")
lcnt=$2

if [ $lcnt -eq 1 ]
then
    echo "No other links"
else
    set -- $(ls -i "$file")
    inode=$1
    find "$dir" -xdev -inum "$inode" -print
fi
```

### ▶️ Execution

``` bash
sh 4b.sh file1.txt
```

or:

``` bash
sh 4b.sh file1.txt /home/shree
```

------------------------------------------------------------------------

## 5A -- Display File Creation Time

### 🎯 Objective

Display the creation/birth time of a file if it exists.

### 🧾 `5a.sh`

``` bash
#!/bin/sh

if [ -f "$1" ]
then
    stat "$1" | grep "Birth"
else
    echo "File does not exist"
fi
```

### ▶️ Execution

``` bash
sh 5a.sh file1.txt
```

> **Note:** Modern Linux filesystems may not provide a birth/creation
> time. In that case `stat` may show `Birth: -`.

------------------------------------------------------------------------

## 5B -- Current Calendar with Highlighted Date

### 🎯 Objective

Display the current month's calendar and replace today's date with `*`
for a one-digit date or `**` for a two-digit date.

### 🧾 `5b.sh`

``` bash
#!/bin/sh

set -- $(date)
d=$3

if [ $d -le 9 ]
then
    cal | sed "s/ $d / * /"
else
    cal | sed "s/ $d / ** /"
fi
```

### ▶️ Execution

``` bash
sh 5b.sh
```

------------------------------------------------------------------------

## 6A -- Find, Display and Copy Matching Files

### 🎯 Objective

Find files matching a pattern in the home directory, display their
contents, and copy them to `~/mydir`.

### 🧾 `6a.sh`

``` bash
#!/bin/sh

if [ $# -eq 0 ]
then
    echo "No arguments"
    exit
fi

mkdir -p ~/mydir

for i in $(find ~ -name "$1")
do
    cat "$i"
    cp "$i" ~/mydir
done
```

### ▶️ Execution

``` bash
sh 6a.sh "1*"
```

------------------------------------------------------------------------

## 6B -- Files with at Least 10 Characters

### 🎯 Objective

List files whose filenames contain at least 10 characters. The `expr`
command is used to determine the length.

### 🧾 `6b.sh`

``` bash
#!/bin/sh

for file in *
do
    if [ -f "$file" ]
    then
        len=$(expr length "$file")

        if [ $len -ge 10 ]
        then
            echo "$file"
        fi
    fi
done
```

### ▶️ Execution

``` bash
sh 6b.sh
```

### 📁 For a directory argument

``` bash
#!/bin/sh

for file in "$1"/*
do
    if [ -f "$file" ]
    then
        name=$(basename "$file")
        len=$(expr length "$name")

        if [ $len -ge 10 ]
        then
            echo "$name"
        fi
    fi
done
```

------------------------------------------------------------------------

## 7A -- Greeting Based on Time

### 🎯 Objective

Display **Good Morning**, **Good Afternoon**, **Good Evening**, or
**Good Night** according to the current time.

### 🧾 `7a.sh`

``` bash
#!/bin/sh

hour=`date +%H`

if [ $hour -ge 5 ] && [ $hour -lt 12 ]
then
    echo "Good Morning"
elif [ $hour -lt 17 ]
then
    echo "Good Afternoon"
elif [ $hour -lt 21 ]
then
    echo "Good Evening"
else
    echo "Good Night"
fi
```

### ▶️ Execution

``` bash
sh 7a.sh
```

------------------------------------------------------------------------

## 7B -- Word Frequency in Files

### 🎯 Objective

Take a list of filenames. For every word in the first file, count its
occurrence in the remaining files.

### 🧾 `7b.sh`

``` bash
#!/bin/sh

if [ $# -lt 2 ]
then
    echo "Usage: prgm.sh wordfile.txt file1.txt file2.txt ..."
    exit 1
fi

for word in $(cat "$1")
do
    for file in "$@"
    do
        if [ "$file" != "$1" ]
        then
            count=$(grep -iow "$word" "$file" | wc -l)
            echo "$word : $file : $count"
        fi
    done
done
```

### ▶️ Execution

``` bash
sh 7b.sh words.txt file1.txt file2.txt
```

------------------------------------------------------------------------

## 8A -- User Working Time

### 🎯 Objective

Determine how long a specified user has been logged in.

### 🧾 `8a.sh`

``` bash
#!/bin/sh

echo "Enter login name:"
read user

session=$(loginctl list-sessions --no-legend | grep " $user " | head -n 1)

if [ -z "$session" ]
then
    echo "$user is not logged in"
    exit
fi

sid=$(echo "$session" | cut -d' ' -f1)

login_time=$(loginctl show-session "$sid" -p Timestamp --value)

start=$(date -d "$login_time" +%s)
now=$(date +%s)

diff=$((now - start))

hours=$((diff / 3600))
minutes=$(((diff % 3600) / 60))

echo "$user is working for $hours hours and $minutes minutes"
```

### ▶️ Execution

``` bash
sh 8a.sh
```

> This version uses `loginctl`, which is suitable for modern Ubuntu
> systems where relying on older `who` output may not provide all
> required session information.

------------------------------------------------------------------------

## 8B -- Monitor User Login

### 🎯 Objective

Wait for a specified user to log in during a specified period. If the
user does not log in within that time, terminate the script.

### 🧾 `8b.sh`

``` bash
#!/bin/sh

echo -n "Enter login name: "
read user

echo -n "Enter time in minutes: "
read min

count=0

while ! loginctl list-sessions --no-legend | grep -w "$user" > /dev/null
do
    sleep 5
    count=$(expr $count + 5)

    if [ $count -ge $(expr $min \* 60) ]
    then
        echo "$user has not logged in within $min minutes"
        exit
    fi
done

echo "$user has logged in"
```

### ▶️ Execution

``` bash
sh 8b.sh
```

------------------------------------------------------------------------

## 9A -- Display Selected Lines

### 🎯 Objective

Accept a filename, starting line number, and ending line number and
display the lines between them.

### 🧾 `9a.sh`

``` bash
#!/bin/sh

if [ $# -ne 3 ]
then
    echo "Invalid number of arguments"
    exit
fi

lines=$(wc -l < "$1")

if [ $2 -le 0 ] || [ $3 -le 0 ] || [ $2 -gt $3 ] || [ $3 -gt $lines ]
then
    echo "Invalid input"
    exit
fi

sed -n "$2,$3 p" "$1"
```

### ▶️ Execution

``` bash
sh 9a.sh file.txt 3 7
```

------------------------------------------------------------------------

## 9B -- Fold Long Lines to 40 Columns

### 🎯 Objective

Break lines longer than 40 characters. Each folded portion is followed
by `\` to indicate continuation.

### 🧾 `9b.sh`

``` bash
#!/bin/sh

echo "Enter file name:"
read file

while read line
do
    len=$(expr length "$line")

    while [ $len -gt 40 ]
    do
        echo "$(echo "$line" | cut -c1-40)"'\'
        line=$(echo "$line" | cut -c41-)
        len=$(expr length "$line")
    done

    echo "$line"
done < "$file"
```

### ▶️ Execution

``` bash
sh 9b.sh
```

------------------------------------------------------------------------

# 📊 AWK Programs

## 10A -- Date Validation and Formatting

### 🎯 Objective

Accept a date in the form:

``` text
dd-mm-yy
```

Validate it and display it as:

``` text
Month,Day,Year
```

### 🧾 `10a.awk`

``` awk
{
    split($0, d, "-")

    if (d[1] < 1 || d[1] > 31 || d[2] < 1 || d[2] > 12)
    {
        print "Invalid date"
        exit
    }

    days[1]=31; days[2]=28; days[3]=31; days[4]=30
    days[5]=31; days[6]=30; days[7]=31; days[8]=31
    days[9]=30; days[10]=31; days[11]=30; days[12]=31

    if (d[1] > days[d[2] + 0])
    {
        print "Invalid date"
        exit
    }

    month[1]="January"; month[2]="February"; month[3]="March"
    month[4]="April"; month[5]="May"; month[6]="June"
    month[7]="July"; month[8]="August"; month[9]="September"
    month[10]="October"; month[11]="November"; month[12]="December"

    print month[d[2] + 0] "," d[1] "," d[3]
}
```

### ▶️ Execution

``` bash
echo "17-08-26" | awk -f 10a.awk
```

### Expected Output

``` text
August,17,26
```

Invalid dates such as:

``` text
30-02-26
31-04-26
```

are rejected.

------------------------------------------------------------------------

## 10B -- Remove Duplicate Lines

### 🎯 Objective

Delete duplicated lines while preserving the order of the original
lines.

### 🧾 `10b.awk`

``` awk
{
    if (!seen[$0])
    {
        print $0
        print $0 > "out10b.txt"
        seen[$0] = 1
    }
}
```

### ▶️ Execution

``` bash
awk -f 10b.awk Duplicate.txt
```

### Example Input

``` text
Line 1
Line 2
Line 1
Line 3
Line 2
```

### Output

``` text
Line 1
Line 2
Line 3
```

### 💡 Alternative without an associative `seen` array

``` awk
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
            print line[i]
    }
}
```

------------------------------------------------------------------------

## 11A -- Books Sold by Discipline

### 🎯 Objective

Using an **associative array**, calculate:

1.  Total books sold in each discipline.
2.  Total books sold overall.

### 🧾 `Books.txt`

``` text
Electrical  34
Mechanical  67
Electrical  80
Computer Science    43
Mechanical  65
Civil   98
Computer Science    64
```

### 🧾 `11a.awk`

``` awk
BEGIN {
    print "TOTAL NUMBER OF BOOKS SOLD IN EACH CATEGORY"
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
```

### ▶️ Execution

``` bash
awk -f 11a.awk Books.txt
```

### Expected Result

``` text
Electrical        = 114
Mechanical        = 132
Computer Science  = 107
Civil             = 98
Total Books Sold  = 451
```

> The order of disciplines may vary because AWK associative arrays do
> not guarantee insertion order.

------------------------------------------------------------------------

## 11B -- Gross Salary Calculation

### 🎯 Objective

Compute gross salary using:

  Basic Salary     HRA    DA
  -------------- ----- -----
  `< 10000`        15%   45%
  `>= 10000`       20%   50%

Formula:

``` text
Gross Salary = Basic + HRA + DA
```

### 🧾 `Data.txt`

``` text
1:Shree:Professor:ISE:8000
2:Rahul:Assistant:ISE:12000
```

### 🧾 `11b.awk`

``` awk
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

### ▶️ Execution

``` bash
awk -f 11b.awk Data.txt
```

### Expected Output

``` text
Employee: Shree
Basic Salary: 8000
HRA: 1200
DA: 3600
Gross Salary: 12800
-----------------------------
Employee: Rahul
Basic Salary: 12000
HRA: 2400
DA: 6000
Gross Salary: 20400
-----------------------------
```

------------------------------------------------------------------------

# 🧠 Quick Revision

## Shell Scripting -- Important Commands

  Command      Purpose
  ------------ -----------------------------------------------
  `grep`       Search text/pattern
  `cut`        Extract fields/characters
  `tr`         Translate characters
  `sort`       Sort output
  `tail`       Display end of output
  `find`       Search files/directories
  `sed`        Stream editing
  `expr`       Perform simple calculations/string operations
  `stat`       Display file information
  `chmod`      Change permissions
  `mkdir`      Create directories
  `mv`         Rename/move files
  `cat`        Display file contents
  `loginctl`   Manage/query user sessions

## AWK -- Important Concepts

  AWK            Meaning
  -------------- ------------------------------
  `$0`           Complete current line
  `$1`           First field
  `$2`           Second field
  `$NF`          Last field
  `NF`           Number of fields
  `BEGIN`        Runs before input processing
  `END`          Runs after input processing
  `FS`           Field separator
  `split()`      Split a string into an array
  `length()`     Find string length
  `array[key]`   Associative array element
  `printf`       Formatted output

------------------------------------------------------------------------

# ⚠️ Important Notes

### 1. Give execute permission when required

``` bash
chmod +x 1a.sh
```

Then:

``` bash
./1a.sh .
```

### 2. AWK files do not need execute permission

Run them with:

``` bash
awk -f 10a.awk
```

### 3. `Ctrl+C` and terminal lock

The terminal-lock program intentionally ignores selected signals:

``` bash
trap '' 2 3
```

Use it carefully. To regain control if necessary, close the terminal or
terminate the shell from another terminal.

### 4. File creation time

Linux does not guarantee that every filesystem exposes a creation/birth
timestamp. If:

``` bash
stat file.txt
```

shows:

``` text
Birth: -
```

then the filesystem does not provide the creation time.

### 5. AWK associative arrays

Associative arrays use meaningful keys instead of numeric indexes:

``` awk
books["Electrical"] = 114
books["Mechanical"] = 132
```

This is the key concept demonstrated in **11A**.

------------------------------------------------------------------------

# 📌 Recommended Lab Practice Order

For easier preparation, practice in this order:

``` text
1A → 1B → 2A → 2B
       ↓
3A → 3B → 4A → 4B
       ↓
5A → 5B → 6A → 6B
       ↓
7A → 7B → 8A → 8B
       ↓
9A → 9B
       ↓
10A → 10B → 11A → 11B
```

Focus especially on:

-   `if / elif / else`
-   `for` and `while`
-   `$1`, `$2`, `$@`, `$#`
-   `grep`, `cut`, `find`, `sed`
-   `expr`
-   `loginctl`
-   AWK `BEGIN`, main block, and `END`
-   AWK associative arrays
-   `printf` formatting

------------------------------------------------------------------------

# ⭐ Viva Quick Questions

### What is `$0` in AWK?

The complete current input line.

### What is `$NF`?

The last field of the current line.

### What is `NF`?

The number of fields in the current line.

### What is an associative array?

An array indexed using a key rather than a numeric position.

Example:

``` awk
books["Electrical"] = 114
```

### What does `FS=":"` do?

It tells AWK to use `:` as the field separator.

### What does `trap '' 2 3` do?

It ignores signals 2 and 3, corresponding to `SIGINT` (Ctrl+C) and
`SIGQUIT` (Ctrl+).

### What does `stty -echo` do?

It hides characters typed on the terminal, useful for password input.

------------------------------------------------------------------------

## 👨‍💻 Happy Coding!

**UNIX Lab Programs -- 3rd Semester ISE**

> Practice the logic, understand each command, and type the programs
> yourself at least once before the lab exam. 🚀
