# Notes on Bash Programming
## Operators
* - ${< var >-< arg >} Returns arg if var not set
* :- ${< var >-< arg >} Returns arg if var not set OR empty
* = ${< var >=< arg >} Returns arg and sets var if var not set
* := ${< var >:=< arg >} Returns arg and set var if var not set OR var empty
* + ${< var >+< arg >} Returns arg if var is set if not returns nothing
* ? ${< var >?< message >} Crashes process if var is not set

## Scope
Variables are scoped to process.

`export` will make a variable available to child processes.

## Arithematic
* expr < arg1> < mathematical operator > < arg2> 
* It should be noted that * will be interpreted and expanded.
* Safer way is
* $(( < arg1> < operator > < arg2> )) for return value.
* (( < var > = < arg1> < operator > < arg2> )) for assignment.

## Declare
Declare allows us to declare a bash variable, and type.
* declare -g < var > Makes var global
* declare -a < var > Types var to array
* declare -A < var > Types var to associatve array
* declare -i < var > Types var to integar, if set to arithematic string will evaluate string
* declare -l < var > Types var to all lowercase string
* declare -u < var > Types var to all uppercase string
* declare -r < var > Makes the var readonly and cannot be unset
* declare +x < var > Makes var available to child process

## Output Redirect
* 0 STDIN - Standard In
* 1 STDOUT - Standard Out
* 2 STDERR - Standard Error
* dest < src Redirects standard in
* src > dest Redirects standard out
* M>&N Redirects one stream to other stream

## Processes
command & will background command.

wait < pid > will halt execution until process with given pid finishes. If pid is not provided execution will halt until all children process have finished.

## Pattern Matching
* * matches any string of any length
* ? matches any single char
* [chars] matches any character in chars.
* [a-b] matches the specified range of characters.
* {< string1>,< string2>} is a set of strings. If multiple sets are combined it will produce the result of multiplying the sets.

## Control Structures

### If Then Else
if < condition >
then
 < block >
fi

### Case
case < arg > in 
< pattern1 >)
 < case body >
 ;;
< pattern2 >)
 < case body >
 ;;
 < default case body >
;;
esac

### While
while < condition >
do
 < block >
done

### Iterating over Elements in Array
for < var > in < array >
do
 < block >
done

Note to loop through associative array ${array[@]} will return the values of the array and ${!array[@]} will return the keys of the array.

## Conditionals
### Test command

#### File Tests
test will perform a conditional check

Test also can be expressed as [ args ]

* test -e < file > true if file/directory exists.
* test -f < file > true if file exists and is regular file.
* test -d < file > true if file exists and is directory.
* test -L < file > true if file exists and is symbolic link.
* test -h < file > true if file exists and is symbolic link.
* test -r < file > true if file exists and is readable.
* test -w < file > true if file exists and is writable.
* test -x < file > true if file exists and is executable.
* test -s < file > true if file exists and is not empty.
* test < file1> -nt < file2> true if file1 is newer than file2.
* test < file1> -ot < file2> true if file1 is older than file2.
* test < file1> -ef < file2> true if file1 and file2 refrence the same inode.

#### String Tests
test -z < string > true if string is empty.
test -n < string > true if string is not empty.
test string1 = string2 true if the strings are equal.
test string1 != string2 true if string1 is not equal to string2
test string1 < string2 true if string1 is lexographically before string2
test string1 > string2 true if string1 is lexographically after string2.
(Escape > and < to prevent interpretation.)
(> and < only sort on only pure ASCII.)

#### Numeric Tests
test int1 -eq int2 ==
test int1 -ne int2 !=
test int1 -le int2 <=
test int1 -lt int2 <
test int1 -ge int2 >=
test int1 -gt int2 >

#### Boolean Operators
test test1 -a test2 Boolean AND
test test1 -o test2 Boolean OR
test !test1 Boolen NEGATION
test (test1 -a test2) -o test3 GROUPING

#### Option Tests
test -o OPT option true if shell option is set.
test -v var true if var has been set.
test -V var true if var is set and a named variable;

## Functions
Functions have access to parent variables and reference args via $n for the nth argument. 
Can be defined as
function name {
 < function body >
}
or 
name () {
 < function body >
}
