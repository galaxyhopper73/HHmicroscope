/*
	MC_select.cpp  - MEX file to select channels of MultiClamp 700B

	Parameters to specify device keep unchanged except for channelID defined by user in Matlab UI

	Any further operations on MultiClamp should be preceded by channel selection

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
	HMCCMSG hMCCmsg;
	char szError[256] = "";
	char szSerialNum[16];
	UINT uModel = 0;
	UINT uCOMPortID = 0;
	UINT uDeviceID = 0;
	UINT uChannelID = 0;
	mxArray* tmp;

	int nfields, NStructElems, nError;

	/* check proper input and output */
	if (nrhs != 2)
		mexErrMsgTxt("Two inputs required.");
	else if (nlhs > 1)
		mexErrMsgTxt("Too many output arguments.");
	else if (!mxIsStruct(prhs[1]))
		mexErrMsgTxt("Input must be a structure.");

	/* get input arguments */
	double handle_addr = *(double*)mxGetData(prhs[0]);
	hMCCmsg = reinterpret_cast<HMCCMSG>(static_cast<uintptr_t> (handle_addr));

	tmp = mxGetFieldByNumber(prhs[1], 0, 0);
	if (tmp == NULL) {
		mexErrMsgTxt("Empty structure field!");
	}
	uModel = (UINT)mxGetScalar(tmp);


	tmp = mxGetFieldByNumber(prhs[1], 0, 1);
	if (tmp == NULL)
		mexErrMsgTxt("Empty structure field!");
	if (mxGetString(tmp, szSerialNum, 16))
		mexErrMsgTxt("Could not convert string structure field.");

	tmp = mxGetFieldByNumber(prhs[1], 0, 2);
	if (tmp == NULL) {
		mexErrMsgTxt("Empty structure field!");
	}
	uCOMPortID = (UINT)mxGetScalar(tmp);

	tmp = mxGetFieldByNumber(prhs[1], 0, 3);
	if (tmp == NULL) {
		mexErrMsgTxt("Empty structure field!");
	}
	uDeviceID = (UINT)mxGetScalar(tmp);

	tmp = mxGetFieldByNumber(prhs[1], 0, 4);
	if (tmp == NULL) {
		mexErrMsgTxt("Empty structure field!");
	}
	uChannelID = (UINT)mxGetScalar(tmp);


	// select the  MultiClamp
	if (!MCCMSG_SelectMultiClamp(hMCCmsg, uModel, szSerialNum,
		uCOMPortID, uDeviceID, uChannelID, &nError))
	{
		mexErrMsgTxt("Unable to select Multiclamp");
		return;
	}
}

