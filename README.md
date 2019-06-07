Simple projects to practice my bash skills and take notes.
# Notes on Bash Programming
## Operators
| Operator | Example| Explanation |
|----------|:--------|:------------------------|
| - | ${< var >-< arg >} | Returns arg if var not set |
| :- | ${< var >-< arg >} | Returns arg if var not set OR empty |
| = | ${< var >=< arg >} | Returns arg and sets var if var not set |
| := | ${< var >:=< arg >} | Returns arg and set var if var not set OR var empty |
| + | ${< var >+< arg >} | Returns arg if var is set if not returns nothing |
| ? | ${< var >?< message >} | Crashes process if var is not set |

## Scope
Variables are scoped to process.

`export` will make a variable available to child processes.

## Arithematic
* expr < arg1> < mathematical operator > < arg2> 
* It should be noted that * will be interpreted and expanded.
* Safer way is
* `$(( < arg1> < operator > < arg2> ))` for return value.
* `(( < var > = < arg1> < operator > < arg2> ))` for assignment.

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
* `dest < src` Redirects standard in
* `src > dest` Redirects standard out
* `M>&N` Redirects one stream to other stream

## Processes
command `&` will background command.

wait < pid > will halt execution until process with given pid finishes. If pid is not provided execution will halt until all children process have finished.

## Pattern Matching
* `*` matches any string of any length
* `?` matches any single char
* `[chars]` matches any character in chars.
* `[a-b]` matches the specified range of characters.
* `{< string1>,< string2>}` is a set of strings. If multiple sets are combined it will produce the result of multiplying the sets.

## Control Structures

### If Then Else
```
if < condition >
then
 < block >
fi
```

### Case
```
case < arg > in 
 < pattern1 >)
  < case body >
  ;;
 < pattern2 >)
  < case body >
  ;;
  *)
  < default case body >
 ;;
esac
```

### While
```
while < condition >
do
 < block >
done
```

### Iterating over Elements in Array
```
for < var > in < array >
do
 < block >
done
```

Note to loop through associative array `${array[@]}` will return the values of the array and `${!array[@]}` will return the keys of the array.

## Conditionals
### Test command
#### File Tests
test will perform a conditional check

Test also can be expressed as [ args ]

| Option | Example | True Condition |
|--------|---------|----------------|
| -e | test -e < file > | file/directory exists.
| -f | test -f < file > | file exists and is regular file.
| -d | test -d < file > | file exists and is directory.
| -L | test -L < file > | file exists and is symbolic link.
| -h | test -h < file > | file exists and is symbolic link.
| -r | test -r < file > | file exists and is readable.
| -w | test -w < file > | file exists and is writable.
| -x | test -x < file > | file exists and is executable.
| -s | test -s < file > | file exists and is not empty.
| -nt | test < file1> -nt < file2> | file1 is newer than file2.
| -ot | test < file1> -ot < file2> | file1 is older than file2.
| -ef | test < file1> -ef < file2> | file1 and file2 refrence the same inode. 

#### String Tests
| Option | Example | True Condition |
|--------|---------|----------------|
| -z | test -z < string > | string is empty.
| -n | test -n < string > | string is not empty.
| = | test string1 = string2 | the strings are equal.
| != | test string1 != string2 | string1 is not equal to string2
| < | test string1 < string2 | string1 is lexographically before string2
| >| test string1 > string2  | string1 is lexographically after string2.

(Escape > and < to prevent interpretation.)

(> and < only sort on only pure ASCII.)

#### Numeric Tests
| Option | Example | True Condition |
|--------|---------|----------------|
| -eq | test int1 -eq int2 | int1 == int2
| -ne | test int1 -ne int2 | int1 != int2
| -le | test int1 -le int2 | int1 <= int2
| -lt | test int1 -lt int2 | int1 < int2
| -ge | test int1 -ge int2 | int1 >= int2
| -gt | test int1 -gt int2 | int1 > int2

#### Boolean Operators
| Option | Example | True Condition |
|--------|---------|----------------|
| -a | test test1 -a test2 | test1 AND test2
| -o | test test1 -o test2 | test1 OR test2
| ! | test !test1 | NOT test1
| () | test (test1 -a test2) -o test3 | Groups expressions

#### Option Tests
| Option | Example | True Condition |
|--------|---------|----------------|
| -o | test -o OPT option | shell option is set
| -v | test -v var | var has been set.
| -V | test -V var | var is set and a named variable.

## Functions
Functions have access to parent variables and reference args via $n for the nth argument. 

Can be defined using either

```
function name {
 < function body >
}
```
or 

```
name () {
 < function body >
}
```
