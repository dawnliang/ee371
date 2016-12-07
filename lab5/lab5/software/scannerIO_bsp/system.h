/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_qsys_0' in SOPC Builder design 'nios2'
 * SOPC Builder design path: ../../nios2.sopcinfo
 *
 * Generated: Sun Dec 04 22:01:05 PST 2016
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00004820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0xf
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00002020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0xf
#define ALT_CPU_NAME "nios2_qsys_0"
#define ALT_CPU_RESET_ADDR 0x00002000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00004820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0xf
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00002020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0xf
#define NIOS2_RESET_ADDR 0x00002000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_NIOS2_QSYS


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x50b0
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x50b0
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x50b0
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios2"


/*
 * charReceived configuration
 *
 */

#define ALT_MODULE_CLASS_charReceived altera_avalon_pio
#define CHARRECEIVED_BASE 0x5060
#define CHARRECEIVED_BIT_CLEARING_EDGE_REGISTER 0
#define CHARRECEIVED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CHARRECEIVED_CAPTURE 0
#define CHARRECEIVED_DATA_WIDTH 1
#define CHARRECEIVED_DO_TEST_BENCH_WIRING 0
#define CHARRECEIVED_DRIVEN_SIM_VALUE 0
#define CHARRECEIVED_EDGE_TYPE "NONE"
#define CHARRECEIVED_FREQ 50000000
#define CHARRECEIVED_HAS_IN 1
#define CHARRECEIVED_HAS_OUT 0
#define CHARRECEIVED_HAS_TRI 0
#define CHARRECEIVED_IRQ -1
#define CHARRECEIVED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CHARRECEIVED_IRQ_TYPE "NONE"
#define CHARRECEIVED_NAME "/dev/charReceived"
#define CHARRECEIVED_RESET_VALUE 0
#define CHARRECEIVED_SPAN 16
#define CHARRECEIVED_TYPE "altera_avalon_pio"


/*
 * charSent configuration
 *
 */

#define ALT_MODULE_CLASS_charSent altera_avalon_pio
#define CHARSENT_BASE 0x5050
#define CHARSENT_BIT_CLEARING_EDGE_REGISTER 0
#define CHARSENT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CHARSENT_CAPTURE 0
#define CHARSENT_DATA_WIDTH 1
#define CHARSENT_DO_TEST_BENCH_WIRING 0
#define CHARSENT_DRIVEN_SIM_VALUE 0
#define CHARSENT_EDGE_TYPE "NONE"
#define CHARSENT_FREQ 50000000
#define CHARSENT_HAS_IN 1
#define CHARSENT_HAS_OUT 0
#define CHARSENT_HAS_TRI 0
#define CHARSENT_IRQ -1
#define CHARSENT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CHARSENT_IRQ_TYPE "NONE"
#define CHARSENT_NAME "/dev/charSent"
#define CHARSENT_RESET_VALUE 0
#define CHARSENT_SPAN 16
#define CHARSENT_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 4
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * inToScanner configuration
 *
 */

#define ALT_MODULE_CLASS_inToScanner altera_avalon_pio
#define INTOSCANNER_BASE 0x5040
#define INTOSCANNER_BIT_CLEARING_EDGE_REGISTER 0
#define INTOSCANNER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define INTOSCANNER_CAPTURE 0
#define INTOSCANNER_DATA_WIDTH 8
#define INTOSCANNER_DO_TEST_BENCH_WIRING 0
#define INTOSCANNER_DRIVEN_SIM_VALUE 0
#define INTOSCANNER_EDGE_TYPE "NONE"
#define INTOSCANNER_FREQ 50000000
#define INTOSCANNER_HAS_IN 0
#define INTOSCANNER_HAS_OUT 1
#define INTOSCANNER_HAS_TRI 0
#define INTOSCANNER_IRQ -1
#define INTOSCANNER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define INTOSCANNER_IRQ_TYPE "NONE"
#define INTOSCANNER_NAME "/dev/inToScanner"
#define INTOSCANNER_RESET_VALUE 0
#define INTOSCANNER_SPAN 16
#define INTOSCANNER_TYPE "altera_avalon_pio"


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x50b0
#define JTAG_UART_0_IRQ 5
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * load configuration
 *
 */

#define ALT_MODULE_CLASS_load altera_avalon_pio
#define LOAD_BASE 0x5070
#define LOAD_BIT_CLEARING_EDGE_REGISTER 0
#define LOAD_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LOAD_CAPTURE 0
#define LOAD_DATA_WIDTH 1
#define LOAD_DO_TEST_BENCH_WIRING 0
#define LOAD_DRIVEN_SIM_VALUE 0
#define LOAD_EDGE_TYPE "NONE"
#define LOAD_FREQ 50000000
#define LOAD_HAS_IN 0
#define LOAD_HAS_OUT 1
#define LOAD_HAS_TRI 0
#define LOAD_IRQ -1
#define LOAD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LOAD_IRQ_TYPE "NONE"
#define LOAD_NAME "/dev/load"
#define LOAD_RESET_VALUE 0
#define LOAD_SPAN 16
#define LOAD_TYPE "altera_avalon_pio"


/*
 * onchip_memory2_0 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2_0 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_0_BASE 0x2000
#define ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_0_DUAL_PORT 0
#define ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE "nios2_onchip_memory2_0"
#define ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_0_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_0_IRQ -1
#define ONCHIP_MEMORY2_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_0_NAME "/dev/onchip_memory2_0"
#define ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_0_SIZE_VALUE 8192
#define ONCHIP_MEMORY2_0_SPAN 8192
#define ONCHIP_MEMORY2_0_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_0_WRITABLE 1


/*
 * outOfScanner configuration
 *
 */

#define ALT_MODULE_CLASS_outOfScanner altera_avalon_pio
#define OUTOFSCANNER_BASE 0x5030
#define OUTOFSCANNER_BIT_CLEARING_EDGE_REGISTER 0
#define OUTOFSCANNER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OUTOFSCANNER_CAPTURE 0
#define OUTOFSCANNER_DATA_WIDTH 8
#define OUTOFSCANNER_DO_TEST_BENCH_WIRING 0
#define OUTOFSCANNER_DRIVEN_SIM_VALUE 0
#define OUTOFSCANNER_EDGE_TYPE "NONE"
#define OUTOFSCANNER_FREQ 50000000
#define OUTOFSCANNER_HAS_IN 1
#define OUTOFSCANNER_HAS_OUT 0
#define OUTOFSCANNER_HAS_TRI 0
#define OUTOFSCANNER_IRQ -1
#define OUTOFSCANNER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OUTOFSCANNER_IRQ_TYPE "NONE"
#define OUTOFSCANNER_NAME "/dev/outOfScanner"
#define OUTOFSCANNER_RESET_VALUE 0
#define OUTOFSCANNER_SPAN 16
#define OUTOFSCANNER_TYPE "altera_avalon_pio"


/*
 * pDataIn configuration
 *
 */

#define ALT_MODULE_CLASS_pDataIn altera_avalon_pio
#define PDATAIN_BASE 0x5090
#define PDATAIN_BIT_CLEARING_EDGE_REGISTER 0
#define PDATAIN_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PDATAIN_CAPTURE 0
#define PDATAIN_DATA_WIDTH 8
#define PDATAIN_DO_TEST_BENCH_WIRING 0
#define PDATAIN_DRIVEN_SIM_VALUE 0
#define PDATAIN_EDGE_TYPE "NONE"
#define PDATAIN_FREQ 50000000
#define PDATAIN_HAS_IN 1
#define PDATAIN_HAS_OUT 0
#define PDATAIN_HAS_TRI 0
#define PDATAIN_IRQ -1
#define PDATAIN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PDATAIN_IRQ_TYPE "NONE"
#define PDATAIN_NAME "/dev/pDataIn"
#define PDATAIN_RESET_VALUE 0
#define PDATAIN_SPAN 16
#define PDATAIN_TYPE "altera_avalon_pio"


/*
 * pDataOut configuration
 *
 */

#define ALT_MODULE_CLASS_pDataOut altera_avalon_pio
#define PDATAOUT_BASE 0x50a0
#define PDATAOUT_BIT_CLEARING_EDGE_REGISTER 0
#define PDATAOUT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PDATAOUT_CAPTURE 0
#define PDATAOUT_DATA_WIDTH 8
#define PDATAOUT_DO_TEST_BENCH_WIRING 0
#define PDATAOUT_DRIVEN_SIM_VALUE 0
#define PDATAOUT_EDGE_TYPE "NONE"
#define PDATAOUT_FREQ 50000000
#define PDATAOUT_HAS_IN 0
#define PDATAOUT_HAS_OUT 1
#define PDATAOUT_HAS_TRI 0
#define PDATAOUT_IRQ -1
#define PDATAOUT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PDATAOUT_IRQ_TYPE "NONE"
#define PDATAOUT_NAME "/dev/pDataOut"
#define PDATAOUT_RESET_VALUE 0
#define PDATAOUT_SPAN 16
#define PDATAOUT_TYPE "altera_avalon_pio"


/*
 * readyToTransfer configuration
 *
 */

#define ALT_MODULE_CLASS_readyToTransfer altera_avalon_pio
#define READYTOTRANSFER_BASE 0x5000
#define READYTOTRANSFER_BIT_CLEARING_EDGE_REGISTER 0
#define READYTOTRANSFER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define READYTOTRANSFER_CAPTURE 0
#define READYTOTRANSFER_DATA_WIDTH 1
#define READYTOTRANSFER_DO_TEST_BENCH_WIRING 0
#define READYTOTRANSFER_DRIVEN_SIM_VALUE 0
#define READYTOTRANSFER_EDGE_TYPE "NONE"
#define READYTOTRANSFER_FREQ 50000000
#define READYTOTRANSFER_HAS_IN 1
#define READYTOTRANSFER_HAS_OUT 0
#define READYTOTRANSFER_HAS_TRI 0
#define READYTOTRANSFER_IRQ -1
#define READYTOTRANSFER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define READYTOTRANSFER_IRQ_TYPE "NONE"
#define READYTOTRANSFER_NAME "/dev/readyToTransfer"
#define READYTOTRANSFER_RESET_VALUE 0
#define READYTOTRANSFER_SPAN 16
#define READYTOTRANSFER_TYPE "altera_avalon_pio"


/*
 * startscanning configuration
 *
 */

#define ALT_MODULE_CLASS_startscanning altera_avalon_pio
#define STARTSCANNING_BASE 0x5020
#define STARTSCANNING_BIT_CLEARING_EDGE_REGISTER 0
#define STARTSCANNING_BIT_MODIFYING_OUTPUT_REGISTER 0
#define STARTSCANNING_CAPTURE 0
#define STARTSCANNING_DATA_WIDTH 1
#define STARTSCANNING_DO_TEST_BENCH_WIRING 0
#define STARTSCANNING_DRIVEN_SIM_VALUE 0
#define STARTSCANNING_EDGE_TYPE "NONE"
#define STARTSCANNING_FREQ 50000000
#define STARTSCANNING_HAS_IN 0
#define STARTSCANNING_HAS_OUT 1
#define STARTSCANNING_HAS_TRI 0
#define STARTSCANNING_IRQ -1
#define STARTSCANNING_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STARTSCANNING_IRQ_TYPE "NONE"
#define STARTSCANNING_NAME "/dev/startscanning"
#define STARTSCANNING_RESET_VALUE 0
#define STARTSCANNING_SPAN 16
#define STARTSCANNING_TYPE "altera_avalon_pio"


/*
 * transfer configuration
 *
 */

#define ALT_MODULE_CLASS_transfer altera_avalon_pio
#define TRANSFER_BASE 0x5010
#define TRANSFER_BIT_CLEARING_EDGE_REGISTER 0
#define TRANSFER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TRANSFER_CAPTURE 0
#define TRANSFER_DATA_WIDTH 1
#define TRANSFER_DO_TEST_BENCH_WIRING 0
#define TRANSFER_DRIVEN_SIM_VALUE 0
#define TRANSFER_EDGE_TYPE "NONE"
#define TRANSFER_FREQ 50000000
#define TRANSFER_HAS_IN 0
#define TRANSFER_HAS_OUT 1
#define TRANSFER_HAS_TRI 0
#define TRANSFER_IRQ -1
#define TRANSFER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TRANSFER_IRQ_TYPE "NONE"
#define TRANSFER_NAME "/dev/transfer"
#define TRANSFER_RESET_VALUE 0
#define TRANSFER_SPAN 16
#define TRANSFER_TYPE "altera_avalon_pio"


/*
 * transmitEnable configuration
 *
 */

#define ALT_MODULE_CLASS_transmitEnable altera_avalon_pio
#define TRANSMITENABLE_BASE 0x5080
#define TRANSMITENABLE_BIT_CLEARING_EDGE_REGISTER 0
#define TRANSMITENABLE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TRANSMITENABLE_CAPTURE 0
#define TRANSMITENABLE_DATA_WIDTH 1
#define TRANSMITENABLE_DO_TEST_BENCH_WIRING 0
#define TRANSMITENABLE_DRIVEN_SIM_VALUE 0
#define TRANSMITENABLE_EDGE_TYPE "NONE"
#define TRANSMITENABLE_FREQ 50000000
#define TRANSMITENABLE_HAS_IN 0
#define TRANSMITENABLE_HAS_OUT 1
#define TRANSMITENABLE_HAS_TRI 0
#define TRANSMITENABLE_IRQ -1
#define TRANSMITENABLE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TRANSMITENABLE_IRQ_TYPE "NONE"
#define TRANSMITENABLE_NAME "/dev/transmitEnable"
#define TRANSMITENABLE_RESET_VALUE 0
#define TRANSMITENABLE_SPAN 16
#define TRANSMITENABLE_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
