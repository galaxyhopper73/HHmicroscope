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

	double handle_addr = *(double*)mxGetData(prhs[0]);
	double Enable = *(double*)mxGetData(prhs[1]);
	bool bEnable;
	if (Enable == 0)
		bEnable = FALSE;
	else
		bEnable = TRUE;

	hMCCmsg = reinterpret_cast<HMCCMSG>(static_cast<uintptr_t> (handle_addr));

	MCCMSG_SetWholeCellCompEnable(hMCCmsg, bEnable, &nError);

}

