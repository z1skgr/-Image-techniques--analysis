# Digital Image Processing
 matlab image processing

# LAB 1 Content <br />
**COLOR MODELS** <br />
1)RGB model. <br />
2)Pictures in Shades of Grey. <br />	
3)HSI model. <br />
4)White balance. <br />

# LAB 2 Content <br />
**SIMPLE TECHNICALS IN IMAGE PROCESSING** <br />
1)Histogram. <br />
2)Spatial filters. <br />
3)Smoothing filters. <br />
4)Sharpening filters. <br />

# LAB3 Content <br />
**2-D FOURIER TRANSFORMATION IN IMAGE** <br />
1)Discrete Fourier transformation. <br />
2)Fourier transformation presentation as image. <br />

# LAB4 Content <br />
**Image Restoration Techniques** <br />
1)Wiener Filter(Least Mean Square Filter). <br />
2)Constrained Least Squares Restoration. <br />


# How to run
Run scripts in matlab. Photos have been used in random. They are chosen essential for the purpose of the projects. New pictures can be chosen if wanted

# memory structure
> Μemory management at programming levels (high-> mid -> low (Assembly)) 

 ## Table of contents
* [Labs](#labs)
   * [1](#1)
   * [2](#2)
   * [3](#3)
   * [4](#4)
   * [5](#5)
   * [6](#6) 
* [How to run](#how-to-run)
* [Acknowledgments](#acknowledgments)

## Labs

### _1_
Memory management and data structures
* Hexadeced representation. 
* Ordering elements in memory using pointers and arrays. 
* Structs declaration
   * 2 structs with different variable content
* Dynamic memory allocation 
* Μemory use map

<br><br><br><br><br>


### _2_
Structure management in memory using linked data list operations.
#### C
Menu for the options 
* Create List
* Insert Element
    * (id, value)
* Delete First
* Print 
    * Address/Value element
    * List count
    * List address
    * Address element field
    * List size (bytes)
    * Element size (bytes)

<br><br>

#### CLang
* Create List
* Insert Element
    * (id, value)
* Delete First
* Print element value
<br><br><br><br><br>

### _3_
Deepening the understanding of memory function in Clang/understanding of Assembly
#### C
New operation
 * Print function address
 * Calculate list size to bytes from addresses that occupy items

<br><br>

#### CLang
Conversion of all the variables used in c
Menu for the options using standards (reference registers, etc)
* Create List
* Insert Element
    * (id, value)
* Delete First
* Print 
    * Address/Value element
    * List count
    * List address
    * Address element field
    * List size (bytes)
    * Element size (bytes)

<br><br>

#### Assembly
Menu options (no functionality)
<br><br><br><br><br>

### _4_ 
Deepening the understanding of Clang/Assembly
#### CLang
Modification from previous implementation
* Create finite list
* Delete Last
* Print element with minimum value

<br><br>
#### Assembly
* 100 nodes on list (static array)
* Correctness of assembly contracts (register contracts)
* Menu functionality (#3)
* Jal commands for call functions
<br><br><br><br><br>

### _5_
#### Assembly
Modification from previous implementation
* Ascending sort using ***recursive*** Merge sort [^1]
    * Stack emerged
* Convert values from type int -> short

<br><br><br><br><br>

### _6_
#### Assembly
Management of input/output devices, using the memory display of the units I/O
##### Polling
Checking peripheral devices if they are ready to accept/export data without syscall (*write_ch,read_ch*).



| Functions | |
| :---: | :---: | 
| write_ch | Reads register Transmission control (TC) / Check device (crosscheck instruction and LSB) |
| read_ch | Waiting for new registration |
| print_str | Candidate for printing char per char  |

<br><br>


##### Interrupts
| Menu | 
| :---: | 
| Choice #1 |
| Choice #2 |
| Exit |

<br>

Menu options for keyboard using interrupts
    * cflag, cdata for handler
<br>
> Choice 1 for 1 <br>
> Choice 2 for 2 <br>
> Exit for space. <br>
> Message appears <br>





<br><br><br><br><br>
## How to run 
### C/CLang

1. Instal cygwin compiler for your operation system
```
https://www.cygwin.com/install.html
```
* Create folder Cygwin
* Open installer 
* Install from internet
* Select your path folder
* Select `+` and install compiler and debugger
* Find `gcc-core, gcc-g++, gdb, make`
<br><br>

2. Configure `PATH` variable
* Go to System and Security in Control Panel
* Advanced System Settings
* Environmental Variables
* Add to path variable the path ``cygwin-directory\bin`` of your cygwin folder
<br><br>

3. Install Apache NetBeans (or any other C IDE)
```
https://netbeans.apache.org/download/index.html
```
4. Instal NetBeans plugins
5. Import .c files to your workspace or Create a new C project
6. Run your .c source files

<br><br>
### Assembly
1. Install Spim from website
```
http://spimsimulator.sourceforge.net/
```
2. Install Notepad [^2]  software (or mipster [^3]) 
3. File->Reinitialize->Load File [^4][^5] -> Run

<br><br>

For (#6), necessery modifications on file
* Exception file
```
lui $k1 0xFFFF
lw  $k0 4($k1)

la $t1, cdata
sw $k0,0($t1)
la $t1, cflag
addi $k0, $zero,1
sw $k0,0($t1)
```

## Acknowledgments
Projects were created for the requirements of the lesson Digital Computers












[^1]: https://en.wikipedia.org/wiki/Merge_sort#:~:text=In%20computer%20science%2C%20merge%20sort%20%28also%20commonly%20spelled,was%20invented%20by%20John%20von%20Neumann%20in%201945.
[^2]: MIPS simulator recognizes programs written in text editors
[^3]: https://mipster.software.informer.com/
[^4]: Reinitialize and load every time you run the program
[^5]: Extension .asm to run files on SPIM
