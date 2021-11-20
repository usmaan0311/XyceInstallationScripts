# To install Xyce in parallel

step i) run the script xyce_install.sh

step ii) Install ADMS for Verilog A to work, run the script ADMS_install.sh

Now add following to ~/.bashrc file (do in both sudo ode and normal):

export PATH=$PATH:/opt/xyce/xyce_parallel/bin (have xyce binary)

export PATH=$PATH:/opt/ADMS/bin (contain admsXml binary-> used to convert verilog A file to .c file and .h file )


export PATH=$PATH:/opt/ADMS/include/adms (contains constants.vams  disciplines.vams files generally used in verilog file)

export LIBDIR=$LIBDIR:/opt/ADMS/lib (contains adms libraries)

export PATH=$PATH:/opt/ADMS/share/man/man1 (contain admsCheck.1  admsXml.1)# optional step

export XYCE_ADMSDIR=/opt/xyce/xyce_parallel/share/xml (variable name must be XYCE_ADMSDIR, and write in this format ony, and write in ~/.bashrc file in sudo mode only (important step))


*********** all for installation **************

To run a spice file:

Xyce filename

to plot use python or any other plotting program


************ Verilog A script**************

Verilog A is used to create a model e.g for a mosfet, resistor or any element

we want our model to put in xyce device list so that we can use it in our spice file (spice files are also called netlist)

************ procedure to add model written in verilog to xyce****************************

step 1: write a verilog code for the desired model device.

to convert it into C code i.e .c and .h file use script:

step 2: run script veri_config.sh (note: change the RLC.va with <your verilog file name> )

it will generate .c and .h files (if its name is file.va then it will generate N_DEV_ADMSfile.c and ||y .h)

step 3:cd /home/usman/Xyce/src/DeviceModelPKG/ADMS
and a) paste your .c and .h file there
b) also make entry of your .c and .h file in N_DEV_RegisterADMSDevices.C file e.g like:

#include <N_DEV_ADMSfile.c> in c files
and

#include <N_DEV_ADMSrlc.h> in h files 

also come to last in void() function and made entry like:

ADMSfile::registerDevice(deviceMap, levelSet);

now we have copied our files and made entry now we have to register in xyce so that it will be recognized device model

step 4: copy the script Configure.sh in /home/usman/Xyce directory

step 5:run the script Configure.sh (here we are recompiling the Xyce and rebuilding (reinstalling) it so that the changes done are witten in Xyce) # In this step make sure you have enough memory ptherwise it will give memory overflow error as signal 9 killed.

after step 4 its done now,

step 5: now we can use our device model in spice file (Netlist).

to run it use: Xyce spice_file (spice file have generally .cir extension)

it will generate output file with spice_file.prn name

now plot it using any software e.g python




 
