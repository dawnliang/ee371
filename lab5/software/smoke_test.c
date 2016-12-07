// Smoke Test

#include <stdio.h>
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/unistd.h"

#define IN_SPS  (volatile char *) 0x5070 //parallel input to the processor from sps
#define OUT_SPS (volatile char *) 0x5060 //parallel output from the processor to sps
#define IN_SCANNER (volatile char *) 0x5040 //parallel input to the processor from scanner
#define OUT_SCANNER (volatile char *) 0x5050 //parallel output from the processor to scanner

#define readyToTransfer (volatile char *) 0x5020
#define ctrl_scanner (volatile char *) 0x5030
#define ctrl_sps (volatile char *) 0x5010
#define framing_sps (volatile char *) 0x5000


int main() {
  alt_putstr("SMOKE TEST\n");
  char input = 'a';
  *OUT_SPS = 0x01;

  /* Event loop never exits. */
  while (1) {
	  input = alt_getchar();
	/*  //ctrl_scanner[0] = startScanning;
	 *
	  (*ctrl_scanner & 0x1) ==

	  //ctrl_scanner[1] = transfer;
	  (*ctrl_scanner & 0x2) ==

	  //framing_sps[0] = charReceived;
	 (*framing_sps & 0x1) ==

	  //framing_sps[1] = characterSent;
	 (*framing_sps & 0x2) ==

	  //ctrl_sps[0] = load;
	 (*ctrl_sps & 0x1) ==

	  //ctrl_sps[1] = transmitEnable;
	 (*ctrl_sps & 0x2) == */

	 // if (charSent = 1) transmitEnable = 0
	 // else if(input == 'e') transmitEnable = 1
	 // else transmitEnable


//	  *startScanning = 0;
//	  *readyToTransfer = 0;

	  if ((*framing_sps &= 0x02) == 0b01) {
		  *(*ctrl_sps &= 0b01) = 0; // transmitEnable set to 0
		  usleep(1000000);
	  }
	  if (input == 'e') {
		  *(*ctrl_sps &= 0xb01) = 1; // transmitEnable set to 1
		  usleep(1000000);
	  } else {
		  *(*ctrl_sps &= 0b01) = 0; // transmitEnable set to 0
		  usleep(1000000);
	  }

  	 /* input = alt_getchar();
  	  if(input == 's') {
  		  *startScanning = 1;
  		  alt_putstr("\n start scanning...\n");
  	  	  usleep(1000000);
  	  }
  	  if(input == 't') {
  		  *readyToTransfer = 1;
  		  alt_putstr("\n transferring...\n");
  	  	  usleep(1000000);

  	  }
  }*/
  }
  return 0;
}

