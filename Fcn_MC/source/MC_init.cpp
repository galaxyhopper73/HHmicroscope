/*
	MC_init.cpp  - MEX file to open MultiClamp 700B interface
	prototype version of MCToolBox
	returns handle of message handler, to be passed to other functions.

	Remember to call CloseMultiClamp when finished.

	Extended to find handles to all Multiclamp channels

	Hugh Robinson, 2005, 2008

	Revised, Hao Jia, 2023 

*/
#include <iostream>
#include <windows.h>
#include "AxMultiClampMsg.h"
#include "mex.h"
#include "matrix.h"

const char* fnames[] = { "Model", "SerialNum", "COMPortID", "DeviceID", "ChannelID" };
void mexFunction(
	int nlhs, mxArray* plhs[],
	int nrhs, const mxArray* prhs[]
)
{
	int nError = MCCMSG_ERROR_NOERROR;
	HMCCMSG hMCCmsg = MCCMSG_CreateObject(&nError);
	char szError[256] = "";
	char* szSerialNum[10];
	UINT uModel[10] = { 0 };  // might have up to 10 Multiclamp channels, i.e. 5 commander channels 700A := 0, 700B := 1
	UINT uCOMPortID[10] = { 0 };
	UINT uDeviceID[10] = { 0 };
	UINT uChannelID[10] = { 0 };
	int nfound = 0;
	for (int i = 0; i < 10; i++)  // up to 10 Multiclamp channels
	{
		szSerialNum[i] = (char*)mxMalloc(128);
		strcpy(szSerialNum[i], "");
	}
	MCCMSG_FindFirstMultiClamp(hMCCmsg, &uModel[0], szSerialNum[0], sizeof(szSerialNum), &uCOMPortID[0], &uDeviceID[0], &uChannelID[0], &nError);
	while (1)
	{
		mexPrintf("MultiClamp found. Model is %d. Serial Number is %s. Headstage Channel ID is %d. Handle is %d.\n",
			uModel[nfound], szSerialNum[nfound], uChannelID[nfound], hMCCmsg);
		nfound++;

		if (!MCCMSG_FindNextMultiClamp(hMCCmsg, &uModel[nfound], szSerialNum[nfound], sizeof(szSerialNum),
			&uCOMPortID[nfound], &uDeviceID[nfound], &uChannelID[nfound], &nError))
		{
			break;
		}
	}

	UINT dev_handle = (UINT) hMCCmsg;
	double* houtptr;
	plhs[0] = mxCreateDoubleScalar(0);
	houtptr = (double*) mxGetData(plhs[0]);
	 *houtptr = (double) dev_handle;
	
	plhs[1] = mxCreateStructMatrix(nfound, 1, 5, fnames);
	for (int i = 0; i < nfound; i++)
	{

		mxSetFieldByNumber(plhs[1], i, 0, mxCreateDoubleScalar(uModel[i]));
		mxSetFieldByNumber(plhs[1], i, 1, mxCreateString(szSerialNum[i]));
		mxSetFieldByNumber(plhs[1], i, 2, mxCreateDoubleScalar(uCOMPortID[i]));
		mxSetFieldByNumber(plhs[1], i, 3, mxCreateDoubleScalar(uDeviceID[i]));
		mxSetFieldByNumber(plhs[1], i, 4, mxCreateDoubleScalar(uChannelID[i]));
	}

	for (int i = 0; i < 10; i++)
		mxFree(szSerialNum[i]);   // clean up

	return;
	
}
