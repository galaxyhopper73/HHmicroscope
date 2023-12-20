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
	double capacitance = 0;

	double handle_addr = *(double*)mxGetData(prhs[0]);
	hMCCmsg = reinterpret_cast<HMCCMSG>(static_cast<uintptr_t> (handle_addr));

	MCCMSG_GetWholeCellCompCap(hMCCmsg, &capacitance, &nError);
	double* houtptr;
	plhs[0] = mxCreateDoubleScalar(0);

	houtptr = (double*)mxGetData(plhs[0]);
	*houtptr = capacitance;
}

