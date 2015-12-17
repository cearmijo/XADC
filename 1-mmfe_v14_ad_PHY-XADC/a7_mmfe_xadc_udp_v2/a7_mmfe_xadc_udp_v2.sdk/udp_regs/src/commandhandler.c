/*
 * commandhandler.c
 *
 *  Date: Mar 5, 2015
 *  Author: adowd
 *  Description:  This handled a complete UDP packet of information and returns a response
 */
#include <stdio.h>
#include <string.h>
#include "xparameters.h"

#include "Configure.h"

#include "lwip/err.h"
#include "lwip/tcp.h"
#ifdef __arm__
#include "xil_printf.h"
#endif

// XADC registers
#define XADC_AMUX_CON  ((volatile u32 *)(XPAR_EXT_AXI_BASEADDR + 0x200))

#define XADC_VALUE_ITEMP  ((volatile u32 *)(XPAR_XADC_WIZ_0_BASEADDR + 0x200))
#define XADC_VALUE_VCCINT  ((volatile u32 *)(XPAR_XADC_WIZ_0_BASEADDR + 0x204))
#define XADC_VALUE_VCCAUX  ((volatile u32 *)(XPAR_XADC_WIZ_0_BASEADDR + 0x208))
#define XADC_VALUE_VCCBRAM ((volatile u32 *)(XPAR_XADC_WIZ_0_BASEADDR + 0x218))
#define XADC_VALUE_VPVN ((volatile u32 *)(XPAR_XADC_WIZ_0_BASEADDR + 0x20C))
#define XADC_VALUE_VREFP ((volatile u32 *)(XPAR_XADC_WIZ_0_BASEADDR + 0x210))
#define XADC_VALUE_VREFN ((volatile u32 *)(XPAR_XADC_WIZ_0_BASEADDR + 0x214))

#define XADC_VALUE_VAUXP(X) ((volatile u32 *)(XPAR_XADC_WIZ_0_BASEADDR + 0x240 + 4*X))



// Only accept read/write values within these ranges (inclusive)
const u32_t valid_addr_range1[2] = {XPAR_EXT_AXI_BASEADDR,XPAR_EXT_AXI_HIGHADDR};
const u32_t valid_addr_range2[2] = {0x00000000,0x000003FC};
char response[128];

u32_t uaddr_mb;   //  Address in Microblaze space
u32_t uaddr_udp;  //  Address in UDP space

const char resp_ok[] = "OK\n";
//const char resp_err[] = "!Err\n";
const char ws_chars[] = " ,\t";

char *cmdEAddr(char * c);
int cmdWWrite(char *);
int cmdRRead(char *);
int cmdPPoke(char *);
int cmdKPeek(char *);

// Returns number of characters in response (or null if error)
u16_t command_handler(char *cptr,char **rptrptr)
{
	char *dptr;
	int   ntransactions;

	switch(cptr[0]) {
	case 'w': // Write
	case 'W':
		if( (dptr = cmdEAddr(cptr+1)) == NULL) return 0;
		ntransactions = cmdWWrite(dptr);
		if(ntransactions != 0) {
			*rptrptr = resp_ok;
			return sizeof(resp_ok)-1;
		}
		break;
	case 'r': // Read
	case 'R':
		if( (dptr = cmdEAddr(cptr+1)) == NULL) return 0;
		ntransactions = cmdRRead(dptr);
		if(ntransactions != 0) {
			*rptrptr = response;
			return strlen(response);
		}
		break;
	case 'p': // Poke
	case 'P':
		if( (dptr = cmdEAddr(cptr+1)) == NULL) return 0;
		ntransactions = cmdPPoke(dptr);
		if(ntransactions != 0) {
			*rptrptr = resp_ok;
			return sizeof(resp_ok)-1;
		}
		break;
	case 'k': // Peek
	case 'K':
		if( (dptr = cmdEAddr(cptr+1)) == NULL) return 0;
		ntransactions = cmdKPeek(dptr);
		if(ntransactions != 0) {
			*rptrptr = response;
			return strlen(response);
		}
		break;
	case 'x': // Dump xadc pd values only
	case 'X':
	    /*
		 * if( (dptr = cmdEAddr(cptr+1)) == NULL) return 0;
		 */
		//xil_printf("in case x\n");
		ntransactions = cmdXADC(dptr);
		if(ntransactions != 0) {
			*rptrptr = response;
			return strlen(response);
		}
		break;
	}
	
	return 0;
}
//---------------------------------------------------------------------------
// Extract Address from the command string
//   returns
//   returns number of values to be accessed (or zero of the address is invalid)
//   If address is valid, pointer location is
// Note, this also does some remapping, to convert the raw UDP address into
//   the matching value in the Microblaze/AXI bus space.
char * cmdEAddr(char * c)
{
	char *endptr;
	u32_t _uaddr;
	while(*c != '\n' && *c != '\0' ) {
		if( strchr(ws_chars,(int)(*c)) == NULL ) {  // skip whitespaces
			_uaddr = (u32_t)strtoul(c,&(endptr),0);
			if ((_uaddr >= valid_addr_range1[0]) && (_uaddr <= valid_addr_range1[1])) {
				uaddr_mb = _uaddr;
				uaddr_udp = _uaddr;
				return endptr;
			}
			else if ((_uaddr >= valid_addr_range2[0]) && (_uaddr <= valid_addr_range2[1])) {
				if (_uaddr == 0x000001FC) {
					uaddr_mb = (XPAR_EXT_AXI_BASEADDR + 0x200);
					uaddr_udp = _uaddr;
					return endptr;
				} else {
					uaddr_mb = XPAR_XADC_WIZ_0_BASEADDR + _uaddr;
					uaddr_udp = _uaddr;
					return endptr;
				}
			}
			else {
				return 0;
			}
		}
		c++;
	}
	return NULL;
}

//--------------------------------------------------------------------------
// UDP Write command:
// >W ADDR D1 D2 D3.... <nl>  - This will write the data starting at address "ADDR".
// It will write to consecutive memory locations.  Thus D1 => ADDR, D2 =>ADDR+1, etc.
// This command will respond with "OK" if the command is successful or "ERR" if it
// failed (for whatever reason).
//
// cmdWWrite function:
//   c = string which points at data string: "D1 D2..."
// return= the number of data values written, or 0 if failed
//
int cmdWWrite(char * c)
{
	char *pch;
	u32_t data;
	int ndata = 0;
	pch = strtok (c,ws_chars);
	if(pch == NULL) return 0;  // no data!
	do
	{
		//if (uaddr > valid_addr_range[1]) {
		//	return 0;
		//}
		data = (u32_t)strtoul(pch,NULL,0);
		*(u32_t *)uaddr_mb = data;  // Write data to this location...
		ndata++;
#ifdef VERBOSE_DEBUG_MODE
		xil_printf("\ndata %d = 0x%X to 0x%X",ndata,data,uaddr_udp);
#endif
		uaddr_mb += sizeof(u32_t);
		pch = strtok (NULL,ws_chars);
	} while (pch != NULL);
	return ndata;
}
//--------------------------------------------------------------------------
// UDP Read command:
// >R ADDR N <cr>  - This will read N locations starting at address "ADDR".  It will
// return the values read in a string as: R ADDR Q1 Q2 ... QN.<cr>  or "ERR" if it failed.
// Data is read from consecutive 32 bit address locations, thus Q1 <= ADDR, Q2 <= ADDR+1, etc
//
// cmdRRead function:
//   c = string which points at N.   Takes address from global uaddr
// return = returns number of values read (N), or zero if it failed
//
int cmdRRead(char * c)
{
	u32_t data;
	int ndata;
	char *rptr = response;
	int rsize = sizeof(response);
	int rinc;
	int iloop;

	ndata = (u32_t)strtoul(c,NULL,0);
	if(ndata == 0) return 0;  // no data!

	rinc = snprintf(rptr,rsize,"R 0x%x ",uaddr_udp);
	if(rinc > 0) {
		rsize -= rinc;
		rptr += rinc;
	}
	else return 0;
	for(iloop=0; iloop <ndata; iloop++)
	{
		//if (uaddr > valid_addr_range[1]) {
		//	return 0;
		//}
		data = *(u32_t *)uaddr_mb;  // Read data from this location...
		rinc = snprintf(rptr,rsize,"0x%x ",data);
		if(rinc > 0) {
			rsize -= rinc;
			rptr += rinc;
		}
		else return 0;
		uaddr_mb += sizeof(u32_t);
	}
	rinc = snprintf(rptr,rsize,"\n");
	return ndata;
}
//--------------------------------------------------------------------------
// UDP Poke command:
// >>P ADDR D1 D2 D3 .... <cr>  - This will poke the data to address "ADDR".  It will
// write repeatedly to the specified memory location.  Thus D1 => ADDR, D2 =>ADDR, etc.
// This command will respond with "OK" if the poke is successful.
//
// cmdPPoke function:
//   c = string which points at data string: "D1 D2..."
// return= the number of data values written, or 0 if failed
int cmdPPoke(char * c)
{
	char *pch;
	u32_t data;
	int ndata = 0;
	pch = strtok (c,ws_chars);
	if(pch == NULL) return 0;  // no data!
	do
	{
		//if ((uaddr >= valid_addr_range[0]) && (uaddr <= valid_addr_range[1])) {
		//	return 0;
		//}
		data = (u32_t)strtoul(pch,NULL,0);
		*(u32_t *)uaddr_mb = data;  // Write data to this location...
		ndata++;
		//uaddr += sizeof(u32_t);  -- Poke...
		pch = strtok (NULL,ws_chars);
	} while (pch != NULL);
	return ndata;
}
//--------------------------------------------------------------------------
// UDP Peek command:
// >K ADDR N <cr>  - This will read N locations starting at address "ADDR".  It will
// return the values read in a string as: K ADDR Q1 Q2 ... QN.<cr>  or "ERR" if it failed.
// Data is read from the same 32 bit address locations, thus Q1 <= ADDR, Q2 <= ADDR, etc
//
// cmdKPeek function:
//   c = string which points at N.   Takes address from global uaddr
// return= the number of data values written, or 0 if failed
int cmdKPeek(char * c)
{
	u32_t data;
	int ndata;
	char *rptr = response;
	int rsize = sizeof(response);
	int rinc;
	int iloop;

	ndata = (u32_t)strtoul(c,NULL,0);
	if(ndata == 0) return 0;  // no data!

	rinc = snprintf(rptr,rsize,"K 0x%x ",uaddr_udp);
	if(rinc > 0) {
		rsize -= rinc;
		rptr += rinc;
	}
	else return 0;
	for(iloop=0; iloop <ndata; iloop++)
	{
		data = *(u32_t *)uaddr_mb;  // Read data from this location...
		rinc = snprintf(rptr,rsize,"0x%x ",data);
		if(rinc > 0) {
			rsize -= rinc;
			rptr += rinc;
		}
		else return 0;
	}
	rinc = snprintf(rptr,rsize,"\n");
	return ndata;
}

int cmdXADC(char * c)
{
	u32 data;
	int ndata = 8;
	char *rptr = response;
	int rsize = sizeof(response);
	int rinc;
	//int iloop;
	u32 raw_xadc;
	int i;
	
    /* we are not reading from registers
	 * ndata = (u32_t)strtoul(c,NULL,0);
	 * if(ndata == 0) return 0;  // no data!
     */
	//xil_printf("\n\n");
    rinc = snprintf(rptr,rsize,"XADC= ");
	   if(rinc > 0) {
		 rsize -= rinc;
		 rptr += rinc;
	}	 
	else return 0;
    
	*XADC_AMUX_CON = 0; // Initialize the analog mux
	
		// ----- Dump The Monitor ports
	for(i=0; i<4; i++) {
		raw_xadc = *XADC_VALUE_VAUXP(i);
/*		if(raw_xadc > 65535) {
			xil_printf("!ERR - JTAG Locked: PD(%d) reg = %d\n",i,raw_xadc);
			rinc = snprintf(rptr,rsize,"!ERR ");
		    if(rinc > 0) {
			    rsize -= rinc;
			    rptr += rinc;
		    }
		    else return 0;
		}
		else {
*/
			data = raw_xadc >> 4;
			//xil_printf("pd%d= 0x%X ", i,data);
			rinc = snprintf(rptr,rsize,"0x%x ",data);
		    if(rinc > 0) {
			    rsize -= rinc;
			    rptr += rinc;
		    }
		    else return 0;
		//}
	}
	for(i=8; i<12; i++) {
		raw_xadc = *XADC_VALUE_VAUXP(i);
/*
		if(raw_xadc > 65535) {
			xil_printf("!ERR - JTAG Locked: PD(%d) reg = %d\n",i,raw_xadc);
			rinc = snprintf(rptr,rsize,"!ERR ");
		    if(rinc > 0) {
			    rsize -= rinc;
			    rptr += rinc;
		    }
		    else return 0;
		}
		else {
*/

		data = raw_xadc >> 4;
		//xil_printf("pd%d= 0x%X ", i-4,data);
			rinc = snprintf(rptr,rsize,"0x%x ",data);
		    if(rinc > 0) {
			    rsize -= rinc;
			    rptr += rinc;
		    }
		    else return 0;
		//}
	}
	//xil_printf("\n");
		//else return 0;
		//uaddr_mb += sizeof(u32_t);
	rinc = snprintf(rptr,rsize,"\n");
	return ndata;
}


/*------------------------------------------------------------------------------
 * Debug function - dump values from the A/D converter in real-world units
 *
 * For VAUX[15-0] -> In unipolar mode, ADC produces full scale code of FFFh when 1V present.
 *					So, V_aux = (16bitREGDATA >> 4) * (1V / 2^12)
 *
 * (For VCCINT, VCCAUX, and VCCBRAM -> ADC produces full scale code of FFFh with 3V input voltage (but 3V is outside of allowed supply range)
 *				So, V_supply = (16bitREGDATA >> 4) * (3V / 2^12)
 *
 *For TEMP -> Temp_C = ( (16bitREGDATA >> 4) * (503.975 / 2^12) ) - 273.15
 */


void dump_xadc_values(void)
{
	u32 raw_xadc,amux;
	int i;

	*XADC_AMUX_CON = 0; // Initialize the analog mux
	// ----- Dump temperature
	raw_xadc = *XADC_VALUE_ITEMP;
	// Rescale to an actual temperature value.
	if(raw_xadc > 65535) {
		xil_printf("!ERR - JTAG Locked: Temp reg = %d\n",raw_xadc);
	}
	else {
		float temp =(float)(raw_xadc >> 4);
		temp *= (503.975 / 4096.0);
		temp -=  273.15;
		printf("Core Temp = %5.2f C\n",temp);
	}
	// ----- Dump VCCINT
	raw_xadc = *XADC_VALUE_VCCINT;
	// Rescale to an actual temperature value.
	if(raw_xadc > 65535) {
		xil_printf("!ERR - JTAG Locked: VCCINT reg = %d\n",raw_xadc);
	}
	else {
		float temp =(float)(raw_xadc >> 4);
		temp *= (3.0 / 4096.0);
		printf("VCINT = %5.2f Volts\n",temp);
	}
	// ----- Dump VCCAUX
	raw_xadc = *XADC_VALUE_VCCAUX;
	// Rescale to an actual temperature value.
	if(raw_xadc > 65535) {
		xil_printf("!ERR - JTAG Locked: VCCAUX reg = %d\n",raw_xadc);
	}
	else {
		float temp =(float)(raw_xadc >> 4);
		temp *= (3.0 / 4096.0);
		printf("VCAUX = %5.2f Volts\n",temp);
	}

	// ----- Dump VCCBRAM
	raw_xadc = *XADC_VALUE_VCCBRAM;
	// Rescale to an actual temperature value.
	if(raw_xadc > 65535) {
		xil_printf("!ERR - JTAG Locked: VCCBRAM reg = %d\n",raw_xadc);
	}
	else {
		float temp =(float)(raw_xadc >> 4);
		temp *= (3.0 / 4096.0);
		printf("VCCBRAM = %5.2f Volts\n",temp);
	}
	// ----- Dump The Monitor ports
	for(i=0; i<4; i++) {
		raw_xadc = *XADC_VALUE_VAUXP(i);
		// Rescale to an actual temperature value.
		if(raw_xadc > 65535) {
			xil_printf("!ERR - JTAG Locked: PD(%d) reg = %d\n",i,raw_xadc);
		}
		else {
			float temp =(float)(raw_xadc >> 4);
			temp *= (1.0 / 4096.0); //Was temp *= (3.0 / 4096.0);
			printf("Monitor PD(%d) = %5.2f Volts\n",i,temp);
		}
	}
	for(i=8; i<12; i++) {
		raw_xadc = *XADC_VALUE_VAUXP(i);
		// Rescale to an actual temperature value.
		if(raw_xadc > 65535) {
			xil_printf("!ERR - JTAG Locked: PD(%d) reg = %d\n",(i-4),raw_xadc);
		}
		else {
			float temp =(float)(raw_xadc >> 4);
			temp *= (1.0 / 4096.0); //Was temp *= (3.0 / 4096.0);
			printf("Monitor PD(%d) = %5.2f Volts\n",(i-4),temp);
		}
	}
	// Loop Through the external mux values...
	for(i=0; i<16; i++) {
		int j;
		// Spin my wheels.
		for(j=0; j <1000; j++)
			amux = *XADC_AMUX_CON;
		raw_xadc = *XADC_VALUE_VPVN;
		amux = *XADC_AMUX_CON;
		*XADC_AMUX_CON = i+1; // change to the next value, allows MUX to settle during the time wasted in the print
		if(raw_xadc > 65535) {
			xil_printf("!ERR - JTAG Locked: EXT(%d) reg = %d\n",amux,raw_xadc);
		}
		else {
			float temp =(float)(raw_xadc >> 4);
			temp *= (3.0 / 4096.0);
			printf("Monitor EXT(%d) = %5.2f Volts\n",amux,temp);
		}

	}
}

