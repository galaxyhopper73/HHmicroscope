/*
	MC_set_prim_gain.cpp  - MEX file to set pipette offset of MultiClamp 700B

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
	double gain = *(double*)mxGetData(prhs[1]);
	hMCCmsg = reinterpret_cast<HMCCMSG>(static_cast<uintptr_t> (handle_addr));

	MCCMSG_SetPrimarySignalGain(hMCCmsg, gain, &nError);

}
