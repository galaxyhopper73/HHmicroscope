/*
	MC_close.cpp  - MEX file to close MultiClamp 700B

	Execute this function before quit Matlab UI

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
	hMCCmsg = reinterpret_cast<HMCCMSG>(static_cast<uintptr_t> (handle_addr));

	MCCMSG_DestroyObject(hMCCmsg);
	return;
}

