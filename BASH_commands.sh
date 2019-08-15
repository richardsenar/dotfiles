# ===================
# WHere to store BASH scripts
# Yourself only - $HOME/bin
# You and other local users - /usr/local/bin
# root only - /usr/local/sbin
# export PATH=$HOME/bin:$PATH
# ===================
#!/usr/local/bin/bash # installed via homebrew
#!/bin/bash

# MacOS Dock
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

printenv # Print evenvironment
# ===================
# Brace expression
echo {1..10} # 1 2 3 4 5 6 7 8 9 10
echo {01..10} # 01 02 03 04 05 06 07 08 09 10
echo {01..10..2} # 01 03 05 07 09
echo {01..10..3} # 01 04 07 10
echo {a..z} # a b c d e f g h i j k l m n o p q r s t u v w x y z
echo {A..z} # A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [  ] ^ _ ` a b c d e f g h i j k l m n o p q r s t u v w x y z
echo {w..d..2} # w u s q o m k i g e
touch {apple,bannana,cherry}_{01..03}{a..c}
ls | wc -l # 36
ls | less
# apple_01a
# apple_01b
# apple_01c
# apple_02a
# apple_02b
# apple_02c
# ...
cp -v * ../otherfolder 1>../success.txt 2>../error.txt # 1> output to stdout , 2> output to stderr
cp -v * ../otherfolder &> ../log.txt # &> redirects to both stdout & stderr 
ls > dev/null # redirects to nowhere
# ===================
grep --color=auto # enable color options
# ===================
# Using Grep & Cut
ping -c 1 www.google.com
# PING www.google.com (172.217.14.100): 56 data bytes
# 64 bytes from 172.217.14.100: icmp_seq=0 ttl=54 time=22.835 ms
# --- www.google.com ping statistics ---
# 1 packets transmitted, 1 packets received, 0.0% packet loss
# round-trip min/avg/max/stddev = 22.835/22.835/22.835/0.000 ms
ping -c 1 www.google.com | grep "bytes from"
# 64 bytes from 172.217.14.100: icmp_seq=0 ttl=54 time=21.151 ms
ping -c 1 www.google.com | grep "bytes from" | cut -d= -f4
# 20.480 ms
# ===================
chmod +x <name>.sh # makes script executable = ./my.sh
chmod -R +rw <name> # recursive permissions 
#===================
#Evaluating No Quotes, Single Quotes, Double Quotes
greeting="hello"
echo $greeting, world \(planet\)! # hello, world (planet)! -- special chars need to ne escaped with
echo '$greeting, world (planet)!' # $greeting, world (planet)! -- literal interpretation of text
echo "$greeting, world (planet)!" # hello, world (planet)! -- will evaluate variables inside ""
# ===================
# Variables
a=Hello
b="Good Morning"
c=16
echo $a
echo $b
echo $c
echo "$a $b! I have $c Apples"
# ===================
# Adding attributes to variables
declare -i d=123        # d is an integer
declare -r e=456        # e is read-only
declare -l f="LOLCats"  # f is lolcats
declare -u g="LOLCats"  # g os LOLCATS
# ===================
# Built-in Variables
echo $HOME
echo $PWD
echo $MACHTYPE
echo $HOSTNAME
echo $BASH_VERSION
echo $SECONDS
echo $0 # prnts name of the script
# Arithmetic Operations
$a ** $b # Exponetiation
$a * $b # Multiplication
$a / $b # Division
$a % $b # Modulo
$a + $b # Addition
$a - $b # Subtraction
# Comparison Operations
[[$a < $b]] # Less Than 
[[$a > $b]] # Greater Than
[[$a <= $b]] # Less Than Equal To
[[$a >= $b]] # Greater Than Equal To
[[$a == $b]] # Equal
[[$a != $b]] # Not Equal
# Comparison Operations (Numeric)
[[$a -lt $b]] # Less Than 
[[$a -gt $b]] # Greater Than
[[$a -le $b]] # Less Than Equal To
[[$a -ge $b]] # Greater Than Equal To
[[$a -eq $b]] # Equal
[[$a -ne $b]] # Not Equal
# Logic Operations
[[$a && $b]] # Logical AND
[[$a || $b]] # Logical OR
[[ ! $a ]] # Logical NOT
# String NULL Value
[[ -z $a ]] # is Null?
[[ -n $a ]] # is not Null?
# ===================
# Command Substitution
x=$(pwd)
echo $x # /Users/richardsenar/desktop
y=pwd # without () value is just pwd
echo $y # pwd
x=$(ping -c 1 www.google.com | grep 'bytes from' | cut -d= -f4)
echo "The ping was $x" # The ping was 21.955 ms
# ===================
# Arithnetic Operartor
val=$(( expression ))
d=2
e=$((d+2))
echo $e # 4
((e++))
echo $e # 5
((e--))
echo $e # 4
((e+=5))
echo $e
((e*=3))
echo $e
((e/=3))
echo $e
((e-=5))
echo $e
# ===================
# Comparison Operartions
val=$[[expression]]  # 1: FALSE , 0: TRUE
[[ "cat" == "cat" ]]
echo $? # 0 True
[[ "cat" = "dog" ]]
echo $? # 1 False
[[ 20 > 100 ]]
echo $? # 0 True -- because its comparing strings and 2 is greater than 1
[[ 20 -gt 100 ]]
echo $? # 1 False
# ===================
# String Manipulation
a=Hello
b=World
echo $a$b # HelloWorld
echo $a $b # Hello World
c=$a$b
echo $c # HelloWorld
echo ${c} # HelloWorld
echo ${#c} # get string length 10
echo ${#a} # get string length 5
echo ${c:2} # string slice lloWorld
echo ${c:2:4} # lloW
echo ${c: -4} # orld
echo ${c: -4:2} # or
# ===================
# String Replace
fruit="apple banana banana cherry"
echo ${fruit/banana/durian} # apple durian banana cherry -- replaced 1st instance banana with durian
echo ${fruit//banana/durian} # apple durian durian cherry -- replaced all instances of banana with durian
echo ${fruit/#apple/durian} # durian banana banana cherry -- replaced apple if its the 1st the beginning
echo ${fruit/#banana/durian} # apple banana banana cherry -- no change
echo ${fruit/%cherry/durian} # apple banana banana durian -- replaced cherry if its the 1st the end
echo ${fruit/%banana/durian} # apple banana banana cherry -- no change
echo ${fruit/c*/durian} # you can also use regex -- apple banana banana durian
# ===================
# Date & Time
today=$(date +"%d-%m-%Y")
time=$(date +"%H:%M:%S")
printf -v d "Current Users:\t%s\nDate:\t\t%s @ %s\n" $USER $today $time
echo "$d"
# Current Users:	richardsenar
# Date:		14-01-2018 @ 16:05:20
# ====================
a=() # Arrays
b=(Apple Bannana Cherry)
echo ${b[2]} # Third Elements of the array (Cherry)
b[5]="Kiwi" # popluate by location on arrays
echo ${b[@]} # print contents of arrays (Apple Bannana Cherry Kiwi)
b+=(Mango) # add to end of array
echo ${b[@]: -1} # Grab last element of array (Mango)
echo ${b[@]} # print contents of arrays (Apple Bannana Cherry Kiwi Mango)
echo ${#b[@]} # number of elements in the array (5)
# ====================
# Assocaiative Arrays (Bash 4.0+ only)
declare -A myarray
myarray[color]=blue
myarray["Office Building"]="HQ West"
echo ${myarray["Office Building"]} is ${myarray[color]} # HQ West is blue
# ====================
# working with files
echo "some text" > file.txt # add text to file.txt
> file.txt # delete contents of file
echo "some more text" >> file.txt # append text to end of file
# ====================
# While loop
i=1
while read f; do
  echo "Line $i: $f"
  ((i++))
done < file.txt
#====================
# Creating an instructions file
ftp -n < ftp.txt
#====================
# Here Document
# adding the - will strip out any tabs
cat <<- EndofFile 
  This is
  a multiline
  text string
EndofFile
#====================
ftp -n <<- EndofFile
  open mirror.xmission.com
  user anonymous nothinghere
  ascii
  cd gutenberg
  get GUTINDEX.01
  bye
EndofFile
#====================

#====================
grep -vI * # Show conent of many files
grep -vI "\x00" -- * # To show content of all files in the current folder, try
grep -vIr "\x00" -- . # and similar, but recursively
#====================
find | grep | xargs ls -lh # view what you are going to delete first
find | grep | xargs rm -rf # run the real command by removing ls -lh, replace it with the rm -fr
rm -rf $(find . | grep) # alternative
#====================
# Move a list of files with find and grep
ls | grep | xargs -I {} mv {} <path>
#====================
ls -d */ # List directories only:
ls -d $PWD/* # List files and directories with full path
#====================
rm -r <dir> # Remove directory in Linux/Unix
#====================
ls -p | grep -v / # This command lists everything that isn't a directory (files, links, device files, etc.)
#====================
ls -d "$PWD"/* # List File/Folder Paths
#====================
find * -type f # Find Regular Files with FilePaths
#====================
curl wttr.in/~corona # 3 Day Weather Report
#====================
pbcopy # Copy to clipboard
pbpaste # Paste to clipboard
#====================
awk '{$1=$1;print}' # Trim Trailing White Spaces
awk '{$1=$1};1' # Trim Trailing White Spaces (shorter version)
#====================
sed 's/find/replace/' filename # Replace the first occurrence of a string in a file, and print the result
sed -e 's/find/replace/' -e 's/find/replace/' filename # Apply multiple find-replace expressions to a file
sed -E 's/regex/replace/g' filename # Replace all occurrences of an extended regular expression in a file
sed -i '' 's/find/replace/g' filename # Replace all occurrences of a string in a file, overwriting the file (i.e. in-place)
sed '/line_pattern/s/find/replace/' filename # Replace only on lines matching the line pattern
#====================
sed 's/ //g' # remove spaces
#====================
tr find_characters replace_characters < filename # Replace all occurrences of a character in a file, and print the result
tr 'abcd' 'jkmn' < filename # Map each character of the first set second set
tr -d 'input_characters' # Delete all occurrences of the specified set of characters from the input
tr -s '\n' # Compress a series of identical characters to a single character
tr -d ' ' # remove spaces
tr "[:lower:]" "[:upper:]" < filename # Translate the contents of the file to upper#case and print result
tr -cd "[:print:]" < filename # Strip out non-printable characters from the file and print result
ls | grep files | xargs rm # remove multiple files

find * -delete # remove multiple files that have spaces in their names
find * -type f -print0 | xargs -0 rm # remove multiple files that have spaces

for f in *; do mv "$f" "${f// /_}"; done # replace spaces in file names with _
for f in *; do mv "$f" "${f// /}"; done # remove spaces in file names

for x in $(ls -p | grep -v /); do d=${x%.*}; d=${d#IMG_}; echo mv $x $d/.; done # parameter replacement & string manipulation

ls -d -1 $PWD/** # find all dir with abs path
ls -d -1 $PWD/*.* # find all files with abs path
ls -d -1 $PWD/**/* # find all files & folders with abs path

# Protocol Buffers
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}

syntax = "proto3";
package internal;
message Customer {
    string Fname = 1;
    string Lname = 2;
}

protoc --go_out=. internal.proto

# Split CSV output to columns
column -s"," -t

# remove null characters
sed -i 's/\x0//g' file.txt


cat <file> | tr '[:upper:]' '[:lower:]' | sort | uniq > <output>

#Setup ZSH
zsh --version
echo $SHELL

Homebrew
Install with:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

iTerm2
Install with:
brew cask install iterm2

Zsh
Install with:
brew install zsh
Check the version of zsh: zsh --version Make zsh default shell: chsh -s /bin/zsh Check the shell you're using: echo $SHELL

Oh My Zsh
Install with:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

owerlevel9k
Install with:
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
Edit ~/.zshrc and set as default theme:
ZSH_THEME="powerlevel9k/powerlevel9k"

export FCEDIT=nano