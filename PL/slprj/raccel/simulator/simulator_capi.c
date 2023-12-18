#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "simulator_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 23
#endif
#ifndef SS_INT64
#define SS_INT64 24
#endif
#else
#include "builtin_typeid_types.h"
#include "simulator.h"
#include "simulator_capi.h"
#include "simulator_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"simulator/Signal Generator" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } ,
{ 1 , 0 , TARGET_STRING ( "simulator/Transfer Fcn" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 2 , 0 , TARGET_STRING ( "simulator/UD " ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 3 , 0 , TARGET_STRING (
"simulator/UD 4" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 4 , 0 ,
TARGET_STRING ( "simulator/UD 5" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1
} , { 5 , 0 , TARGET_STRING ( "simulator/UD1" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 1 } , { 6 , 1 , TARGET_STRING (
"simulator/Fuzzy Logic  Controller  with Ruleviewer/Fuzzy Logic Controller" )
, TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 7 , 0 , TARGET_STRING (
"simulator/Fuzzy Logic  Controller  with Ruleviewer/Zero-Order Hold" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 1 } , { 8 , 1 , TARGET_STRING (
 "simulator/Fuzzy Logic  Controller  with Ruleviewer/Fuzzy Logic Controller/Defuzzify Outputs"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 9 , 0 , TARGET_STRING (
 "simulator/Fuzzy Logic  Controller  with Ruleviewer/Fuzzy Logic Controller/Defuzzify Outputs/is_active_c14_fuzwiz"
) , TARGET_STRING ( "is_active_c14_fuzwiz" ) , 0 , 1 , 0 , 0 , 1 } , { 10 , 0
, TARGET_STRING (
 "simulator/Fuzzy Logic  Controller  with Ruleviewer/Fuzzy Logic Controller/Evaluate Rule Antecedents/is_active_c11_fuzwiz"
) , TARGET_STRING ( "is_active_c11_fuzwiz" ) , 0 , 1 , 0 , 0 , 1 } , { 11 , 0
, TARGET_STRING (
 "simulator/Fuzzy Logic  Controller  with Ruleviewer/Fuzzy Logic Controller/Evaluate Rule Consequents/is_active_c15_fuzwiz"
) , TARGET_STRING ( "is_active_c15_fuzwiz" ) , 0 , 1 , 0 , 0 , 1 } , { 0 , 0
, ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 12 , TARGET_STRING (
"simulator/Signal Generator" ) , TARGET_STRING ( "Amplitude" ) , 0 , 0 , 0 }
, { 13 , TARGET_STRING ( "simulator/Signal Generator" ) , TARGET_STRING (
"Frequency" ) , 0 , 0 , 0 } , { 14 , TARGET_STRING ( "simulator/Transfer Fcn"
) , TARGET_STRING ( "A" ) , 0 , 2 , 0 } , { 15 , TARGET_STRING (
"simulator/Transfer Fcn" ) , TARGET_STRING ( "C" ) , 0 , 3 , 0 } , { 16 ,
TARGET_STRING ( "simulator/UD " ) , TARGET_STRING ( "InitialCondition" ) , 0
, 0 , 0 } , { 17 , TARGET_STRING ( "simulator/UD 2" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 18 , TARGET_STRING ( "simulator/UD 3"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 19 , TARGET_STRING
( "simulator/UD 4" ) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , {
20 , TARGET_STRING ( "simulator/UD 5" ) , TARGET_STRING ( "InitialCondition"
) , 0 , 0 , 0 } , { 21 , TARGET_STRING ( "simulator/UD1" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 22 , TARGET_STRING (
 "simulator/Fuzzy Logic  Controller  with Ruleviewer/Fuzzy Logic Controller/Output Sample Points"
) , TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 ,
0 , 0 } } ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const
rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 ,
( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 , ( NULL ) , 0 , 0 , 0
} } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . fjizvwmtmp , & rtB . ddhjp3t0im ,
& rtB . eo1wc0eucv , & rtB . hpplgmotgp , & rtB . j4zjfbfn2z , & rtB .
et4nlekrg5 , & rtB . i2t5cdxhvy , & rtB . fzo5smtw1d [ 0 ] , & rtB .
i2t5cdxhvy , & rtDW . aaykuljpmu , & rtDW . itgoqa5rps , & rtDW . lsnb104v2a
, & rtP . SignalGenerator_Amplitude , & rtP . SignalGenerator_Frequency , &
rtP . TransferFcn_A [ 0 ] , & rtP . TransferFcn_C [ 0 ] , & rtP .
UD_InitialCondition , & rtP . UD2_InitialCondition , & rtP .
UD3_InitialCondition , & rtP . UD4_InitialCondition , & rtP .
UD5_InitialCondition , & rtP . UD1_InitialCondition , & rtP .
OutputSamplePoints_Value , } ; static int32_T * rtVarDimsAddrMap [ ] = { (
NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } ,
{ "unsigned char" , "uint8_T" , 0 , 0 , sizeof ( uint8_T ) , ( uint8_T )
SS_UINT8 , 0 , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } , {
rtwCAPI_VECTOR , 4 , 2 , 0 } , { rtwCAPI_VECTOR , 6 , 2 , 0 } } ; static
const uint_T rtDimensionArray [ ] = { 1 , 1 , 6 , 1 , 3 , 1 , 1 , 3 } ;
static const real_T rtcapiStoredFloats [ ] = { 0.0 , 0.1 } ; static const
rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0 } , } ; static const
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , (
int8_T ) 0 , ( uint8_T ) 0 } , { ( const void * ) & rtcapiStoredFloats [ 1 ]
, ( const void * ) & rtcapiStoredFloats [ 0 ] , ( int8_T ) 1 , ( uint8_T ) 0
} } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals ,
12 , rtRootInputs , 0 , rtRootOutputs , 0 } , { rtBlockParameters , 11 ,
rtModelParameters , 0 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap
, rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float"
, { 2617410447U , 2570670894U , 2266917683U , 2230738507U } , ( NULL ) , 0 ,
( boolean_T ) 0 , rt_LoggedStateIdxList } ; const
rtwCAPI_ModelMappingStaticInfo * simulator_GetCAPIStaticMap ( void ) { return
& mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void simulator_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void simulator_host_InitializeDataMapInfo ( simulator_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath
( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
