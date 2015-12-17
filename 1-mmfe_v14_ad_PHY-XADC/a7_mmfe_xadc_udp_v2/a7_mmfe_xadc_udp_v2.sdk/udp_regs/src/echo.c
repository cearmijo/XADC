/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <stdio.h>
#include <string.h>

#include "Configure.h"

#include "lwip/err.h"
#include "lwip/tcp.h"
#include "lwip/udp.h"
#ifdef __arm__
#include "xil_printf.h"
#endif

u16_t command_handler(char *cptr,char **rptrptr);

int transfer_data() {
	return 0;
}

void print_app_header()
{
	xil_printf("\n\r\n\r-----lwIP UDP registers server ------\n\r");
	xil_printf("UDP server on port 50001 will accept poke/peek commands\n\r");
}
//
//err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
//                               struct pbuf *p, err_t err)
//{
//	/* do not read the packet if we are not in ESTABLISHED state */
//	if (!p) {
//		tcp_close(tpcb);
//		tcp_recv(tpcb, NULL);
//		return ERR_OK;
//	}
//
//	/* indicate that the packet has been received */
//	tcp_recved(tpcb, p->len);
//
//	/* echo back the payload */
//	/* in this case, we assume that the payload is < TCP_SND_BUF */
//	if (tcp_sndbuf(tpcb) > p->len) {
//		err = tcp_write(tpcb, p->payload, p->len, 1);
//	} else
//		xil_printf("no space in tcp_sndbuf\n\r");
//
//	xil_printf("%c",*(char *)p->payload);
//	/* free the received pbuf */
//	pbuf_free(p);
//
//	return ERR_OK;
//}
//
//err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
//{
//	static int connection = 1;
//
//	/* set the receive callback for this connection */
//	tcp_recv(newpcb, recv_callback);
//
//	/* just use an integer number indicating the connection id as the
//	   callback argument */
//	tcp_arg(newpcb, (void*)connection);
//
//	/* increment for subsequent accepted connections */
//	connection++;
//
//	return ERR_OK;
//}
/*  This is the original version of the code, which was used to implement a
 *   TCP echo function.  We keep it here for reference, but it's not used at this time
 *
 */
//int start_application_tcp()
//{
//	struct tcp_pcb *pcb;
//	err_t err;
//	unsigned port = 7;
//
//	/* create new TCP PCB structure */
//	pcb = tcp_new();
//	if (!pcb) {
//		xil_printf("Error creating PCB. Out of Memory\n\r");
//		return -1;
//	}
//
//	/* bind to specified @port */
//	err = tcp_bind(pcb, IP_ADDR_ANY, port);
//	if (err != ERR_OK) {
//		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
//		return -2;
//	}
//
//	/* we do not need any arguments to callback functions */
//	tcp_arg(pcb, NULL);
//
//	/* listen for connections */
//	pcb = tcp_listen(pcb);
//	if (!pcb) {
//		xil_printf("Out of memory while tcp_listen\n\r");
//		return -3;
//	}
//
//	/* specify callback to use for incoming connections */
//	tcp_accept(pcb, accept_callback);
//
//	xil_printf("TCP echo server started @ port %d\n\r", port);
//
//	return 0;
//}

/*  This is called when we receive a UDP packet.
 * Actions:
 *  1. Receive packet
 *  2. Check for <cr> termination - if not true toss out packet and respond with error
 *  3. Send packet to commandhandler for processing - wait for response
 *  4. Return response.
 */
void recv_callback_udp(void *arg,
		                 struct udp_pcb *upcb,
                         struct pbuf *c,
                         struct ip_addr * addr,
                         u16_t port)
{
	static const char errormsg[] = "!Err\n";
	uint16_t resp_len;
	char *resp;
	struct pbuf *r;
	err_t err;
	char *command = (char *)(c->payload);
#ifdef VERBOSE_DEBUG_MODE
	//xil_printf("\ncommand  = \"%s\"",command);
#endif
	// check if command is 'valid'
	//   must start with a character, must end with a <cr>
	if( ((command[0] >= 'a' && command[0] <= 'z') ||
	     (command[0] >= 'A' && command[0] <= 'Z')) &&
	     (command[(c->len)-1] == '\n') )
	{
		command[(c->len)-1] = '\0';
#ifdef VERBOSE_DEBUG_MODE
		//xil_printf("%c",*(char *)c->payload);
#endif
		resp_len = command_handler(command,&resp);  // process command and return response
		if (resp_len == 0) {
			resp = errormsg;
			resp_len = sizeof(errormsg)-1; // don't send the null
		}
	}
	else { // Packet is malformed..  respond with an error message
#ifdef VERBOSE_DEBUG_MODE
		xil_printf("!ERR - Malformed packet\r\n");
#endif
		resp = errormsg;
		resp_len = sizeof(errormsg)-1;
	}
	pbuf_free(c);  // free incoming data space
	r = pbuf_alloc(PBUF_TRANSPORT,resp_len,PBUF_REF);  // Get empty pbuf
	r->payload = resp;
	r->len = resp_len;
	err = udp_sendto(upcb,r,addr,port);
	if (err != ERR_OK) {
		xil_printf("Unable to send to local port %d, remote port %d, err = %d\n\r",
				(int)(upcb->local_port),
				(int)port,
				(int)err);
	};
	/* free the response buffer */
	pbuf_free(r);
	return;
}


// Creates a UDP server - will receive UDP inputs and return responses.
//
int start_application_udp()
{
	struct udp_pcb *pcb;
	err_t err;
	const unsigned port = 50001;

	/* create new TCP PCB structure */
	pcb = udp_new();
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	err = udp_bind(pcb, IP_ADDR_ANY, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	// setup udp receive callback....
	udp_recv(pcb,recv_callback_udp,NULL);

	xil_printf("UDP command server started @ port %d\n\r", port);
	return 0;
}



