#ifndef RTW_HEADER_simulator_h_
#define RTW_HEADER_simulator_h_
#ifndef simulator_COMMON_INCLUDES_
#define simulator_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "simulator_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME simulator
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (11) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (3)   
#elif NCSTATES != 3
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T ddhjp3t0im ; real_T j4zjfbfn2z ; real_T hpplgmotgp ;
real_T eo1wc0eucv ; real_T et4nlekrg5 ; real_T fzo5smtw1d [ 6 ] ; real_T
fjizvwmtmp ; real_T i2t5cdxhvy ; } B ; typedef struct { real_T fd5il4ocnr ;
real_T pap12ufrht ; real_T kb02n0c24y ; real_T jolk2wnpoh ; real_T hlmipjdt25
; real_T hixtpg0x1t ; struct { void * LoggedData ; } c3v5hkrypy ; int32_T
ppa3fjzq12 ; int32_T gxcvgcvdkv ; int32_T nvuhhb0bcg ; uint8_T lsnb104v2a ;
uint8_T itgoqa5rps ; uint8_T aaykuljpmu ; boolean_T offng0d0eq ; boolean_T
o2lwgb0ugo ; boolean_T i55sx5pxox ; } DW ; typedef struct { real_T e1f0twl5yp
[ 3 ] ; } X ; typedef struct { real_T e1f0twl5yp [ 3 ] ; } XDot ; typedef
struct { boolean_T e1f0twl5yp [ 3 ] ; } XDis ; typedef struct { real_T
e1f0twl5yp [ 3 ] ; } CStateAbsTol ; typedef struct { real_T e1f0twl5yp [ 3 ]
; } CXPtMin ; typedef struct { real_T e1f0twl5yp [ 3 ] ; } CXPtMax ; typedef
struct { rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
OutputSamplePoints_Value ; real_T TransferFcn_A [ 3 ] ; real_T TransferFcn_C
[ 3 ] ; real_T UD5_InitialCondition ; real_T UD4_InitialCondition ; real_T
UD3_InitialCondition ; real_T UD_InitialCondition ; real_T
UD1_InitialCondition ; real_T UD2_InitialCondition ; real_T
SignalGenerator_Amplitude ; real_T SignalGenerator_Frequency ; } ; extern
const char_T * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ;
extern DW rtDW ; extern P rtP ; extern mxArray * mr_simulator_GetDWork ( ) ;
extern void mr_simulator_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_simulator_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * simulator_GetCAPIStaticMap ( void ) ; extern
SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ; extern
rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid )
; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T
tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model (
ssExecutionInfo * executionInfo ) ;
#endif
