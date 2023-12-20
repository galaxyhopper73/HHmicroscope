/*
	MC_set_pipette_os.cpp  - MEX file to set pipette offset of MultiClamp 700B

	Hugh Robinson, 2005, 2008

	Revised, Hao Jia, 2023

*/
#include <iostream>
#include <windows.h>
#include "AxMultiClampMsg.h"
#include "mex.h"
#include "matrix.h"
#include "math.h"

void mexFunction(
	int nlhs, mxArray* plhs[],
	int nrhs, const mxArray* prhs[]
)
{
	int nError = MCCMSG_ERROR_NOERROR;
	HMCCMSG hMCCmsg;

	double handle_addr = *(double*)mxGetData(prhs[0]);
	double pipette_os = *(double*)mxGetData(prhs[1]);
	if (abs(pipette_os)>20*10e-3)
	{
		mexErrMsgTxt("Too large offset");
	}

	hMCCmsg = reinterpret_cast<HMCCMSG>(static_cast<uintptr_t> (handle_addr));

	MCCMSG_SetPipetteOffset(hMCCmsg, pipette_os, &nError);

}

