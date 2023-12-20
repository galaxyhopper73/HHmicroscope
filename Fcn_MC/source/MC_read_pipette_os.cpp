/*
	MC_read_pipette_os.cpp  - MEX file to read pipette offset of MultiClamp 700B

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
	double pipette_os = 0;
	
	double handle_addr = *(double*)mxGetData(prhs[0]);
	hMCCmsg = reinterpret_cast<HMCCMSG>(static_cast<uintptr_t> (handle_addr));

	MCCMSG_GetPipetteOffset(hMCCmsg, &pipette_os, &nError);
	double* houtptr;
	plhs[0] = mxCreateDoubleScalar(0);

	houtptr = (double*)mxGetData(plhs[0]);
	*houtptr = pipette_os;
}

