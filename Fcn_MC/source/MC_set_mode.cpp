/*
	MC_set_mode.cpp  - MEX file to set channel mode of MultiClamp 700B  

	0: voltage clamp

	1: current clamp 

	2: I=0 

	Refer to documentation and AxMultiClampMsg.h file

	Hugh Robinson, 2005, 2008

	Revised, Hao Jia, 2023

*/

#include <iostream>
#include <windows.h>
#include "AxMultiClampMsg.h"
#include "mex.h"
#include "matrix.h"

void mexFunction(
	int nlhs, mxArray* plhs[],
	int nrhs, const mxArray* prhs[]
)
{
	int nError = MCCMSG_ERROR_NOERROR;
	HMCCMSG hMCCmsg;

	double handle_addr = *(double*)mxGetData(prhs[0]);
	double umodeID = *(double*)mxGetData(prhs[1]);
	const UINT MC_mode = (UINT)umodeID;
	hMCCmsg = reinterpret_cast<HMCCMSG>(static_cast<uintptr_t> (handle_addr));
		
			
				
	if ((MC_mode!=0) && (MC_mode != 1) && (MC_mode != 2))
	{
		mexErrMsgTxt("Invalid mode setting");
	}
	else
		MCCMSG_SetMode(hMCCmsg, MC_mode, &nError);

}

