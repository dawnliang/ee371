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