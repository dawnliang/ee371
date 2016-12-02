# ee371
University of Washington ee371 Autumn 2016

*Contributors (lab group): @dawnliang, @junp2, William Li*

*Taught by Jim Peckol*

## Lab 1: Introduction
- Refamiliarise ourselves with verilog, Quartus
- Introduce us to iverilog & gtkwave and Signal Tap II
- Introduce to the C programming language in CodeBlocks

VHDL: Implemented four counters at various levels of abstraction: gate-level, dataflow, behavioural, and using Quartus' schematic entry. Compiled & simulated with iverilog and gtkwave, then downloaded to hardware through Quartus and probed using Signal Tap II.

C: Wrote a simple program that took inputs and output to the console.

## Lab 2: Canal Lock Control System
- Build a simple time-dependent system
- Introduce us to pointers in C

VHDL: Designed & built system for controlling canal locks. Main components involved overall system management (I/O's, control signals, overall state), with submodules for gate control (combinational) and inner water level control (enable-counter). Compiled & simulated with iverilog and gtkwave, then downloaded to hardware through Quartus and probed using Signal Tap II.

C: Wrote a program that does computations through pointers instead of variables.

## Lab 3: Digital Scanning System
- Build a basic real-world system using FSMs and HDL
- Exercise basic concepts in time-bases and intra-system timing
- Practice C programming data types and variable manipulation

VHDL: Built a 2-scanner system that constantly scans by trading-off. The scanners monitor their buffer to determine when to wake the other scanner/prompt it to start scanning, and to transfer to a home base, otherwise flush out buffer data. Each scanner used an FSM to determine operating state, then modeled buffer using a min/max counter runinng on different clocks to model speed. Compiled & simulated with iverilog and gtkwave, then downloaded to hardware through Quartus and probed using Signal Tap II.

C: Wrote programs that manipulate various data types of variables. One program converts temperature units, the other calculates total gate delay based on the number and type of gates.

## Lab 4: Intro to NIOS II processors
- Build simple NIOS II processors using QSys in Quartus
- Run simple programs on our processors

VHDL: Used QSys to generate Verilog to instantiate the Nios II processors on our FPGAs. Processors included a clock, cpu, memory, pio's, and jtag transfer.

C: Wrote programs in Eclipse that ran on our processor, such as count_binary, lights_and_switches, and modified lights_and_switches

## Lab 5: Scanner communication system
- Build a serial-parallel-serial interface for communicating between FPGAs

VHDL: Wrote a SPS-interface for taking serial input and converting it to parallel output for a Nios II processor; taking parallel input from a Nios II processor and outputting it serially for communication. Built using shift registers and bit/bsc timing control.